package com.bob.mypage.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bob.common.base.BaseController;
import com.bob.customer.vo.QnaVO;
import com.bob.member.vo.MemberVO;
import com.bob.mypage.service.MyPageService;
import com.bob.order.vo.OrderVO;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController  implements MyPageController{
	private static final String CURR_QNA_IMAGE_REPO_PATH = "C:\\shopping\\qna_file_repo";
	
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/myPageMain.do" ,method = RequestMethod.GET)
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		List<OrderVO> myOrderList=myPageService.listMyOrderGoods(member_id);
		
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam("order_id")  String order_id,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO orderer=(MemberVO)session.getAttribute("memberInfo");
		
		List<OrderVO> myOrderList=myPageService.findMyOrderInfo(order_id);
		mav.addObject("orderer", orderer);
		mav.addObject("myOrderList",myOrderList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do" ,method = RequestMethod.GET)
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
			                               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMember_id();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("member_id", member_id);
		List<OrderVO> myOrderHistList=myPageService.listMyOrderHistory(dateMap);
		
		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate1[0]);
		mav.addObject("endMonth",endDate1[1]);
		mav.addObject("endDay",endDate1[2]);
		mav.addObject("myOrderHistList", myOrderHistList);
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView cancelMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelOrder(order_id);
		mav.addObject("message", "cancel_order");
		mav.setViewName("redirect:/mypage/myPageMain.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	// 회원탈퇴 기능 추가
	@Override
	@RequestMapping(value="/deleteMember.do")
	public ResponseEntity deleteMember(HttpServletRequest request, HttpServletResponse response)  throws Exception {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		HttpSession session=request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		System.out.println("session = " + session );
		System.out.println("memberVO = " + memberVO );
		System.out.println("member_id = " + member_id );
		

		myPageService.updateDel_yn(member_id);
		String script = "<script>alert('회원 탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.'); "
				+ "location.href='"+request.getContextPath()+"/main/main.do'; </script>";
		   
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;

	
	}
	
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMember_id();
		if(attribute.equals("member_birth")){
			val=value.split(",");
			memberMap.put("member_birth_y",val[0]);
			memberMap.put("member_birth_m",val[1]);
			memberMap.put("member_birth_d",val[2]);
			memberMap.put("member_birth_gn",val[3]);
		}else if(attribute.equals("tel")){
			val=value.split(",");
			memberMap.put("tel1",val[0]);
			memberMap.put("tel2",val[1]);
			memberMap.put("tel3",val[2]);
		}else if(attribute.equals("hp")){
			val=value.split(",");
			memberMap.put("hp1",val[0]);
			memberMap.put("hp2",val[1]);
			memberMap.put("hp3",val[2]);
			memberMap.put("smssts_yn", val[3]);
		}else if(attribute.equals("email")){
			val=value.split(",");
			memberMap.put("email1",val[0]);
			memberMap.put("email2",val[1]);
			memberMap.put("emailsts_yn", val[2]);
		}else if(attribute.equals("address")){
			val=value.split(",");
			memberMap.put("zipcode",val[0]);
			memberMap.put("roadAddress",val[1]);
			memberMap.put("jibunAddress", val[2]);
			memberMap.put("namujiAddress", val[3]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("member_id", member_id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	
	
	
	//Q&A
	//Q&A 메인페이지
	@RequestMapping(value = "/myQnaList.do", method = RequestMethod.GET)
	public ModelAndView myQnaList(@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 10; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		Map<String ,List> qnaMap = myPageService.myQnaList(String.valueOf(member_id), String.valueOf(startRowNum), String.valueOf(endRowNum));

		List<QnaVO> qnaList = qnaMap.get("qnaList");
		
		mav.addObject("qnaList", qnaList);

		return mav;
	}
	
	//Q&A 단일조회
	@Override
	@RequestMapping(value="/myQnaDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectQna(@RequestParam("qna_id") String qna_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectQna = myPageService.selectQnaDetail(qna_id);
		mav.addObject("selectQna", selectQna);
		return mav;
	}
	
	//Q&A 입력페이지
	@RequestMapping(value = "/myQnaWrite.do")
	public ModelAndView myQnaWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String goods_id = request.getParameter("goods_id");
		System.out.println("굿즈아이디 : " + goods_id);
		if( goods_id != null ) {
			mav.addObject("goods_id", goods_id);
		}
		return mav;
	}
	
	//Q&A 등록하기
	@RequestMapping(value="/addQna.do" ,method={RequestMethod.POST})
	public ResponseEntity addQna(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName=null;
		
		Map newQnaMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newQnaMap.put(name,value);
			System.out.println("name: " + name + ", value: " + value);
		}
		
		MultipartFile file = multipartRequest.getFile("fileName");
		String fileName = file.getOriginalFilename();
		newQnaMap.put("fileName", fileName);
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		newQnaMap.put("member_id", member_id);
		
		String goodsID = (String)newQnaMap.get("goods_id");
		newQnaMap.put("goods_id", goodsID);

		
		List<QnaVO> imageFileList =qnaUpload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(QnaVO qnaVO : imageFileList) {
				qnaVO.setMember_id(member_id);
			}
			newQnaMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int qna_id = myPageService.addQna(newQnaMap);
			if(newQnaMap!=null && newQnaMap.size()!=0) {
				imageFileName = (String) newQnaMap.get("fileName");
				File srcFile = new File(CURR_QNA_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(CURR_QNA_IMAGE_REPO_PATH+"\\"+qna_id);
				if (!destDir.exists()) {
	                destDir.mkdirs(); // 폴더가 존재하지 않으면 생성
	            }
				if (fileName != null && !fileName.isEmpty()) {
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('Q&A가 작성되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/mypage/myQnaList.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(newQnaMap!=null && newQnaMap.size()!=0) {
				imageFileName = (String)newQnaMap.get("fileName");
				File srcFile = new File(CURR_QNA_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();
			}
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/mypage/qnaWrite.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		System.out.println("newQnaMap: " + newQnaMap);
		return resEntity;
	}
	
	
}
