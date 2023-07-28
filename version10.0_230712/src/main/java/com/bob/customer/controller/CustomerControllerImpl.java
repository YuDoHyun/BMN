package com.bob.customer.controller;

import java.io.File;
import java.util.ArrayList;
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
import com.bob.customer.service.CustomerService;
import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;
import com.bob.goods.service.GoodsService;
import com.bob.goods.vo.ImageFileVO;
import com.bob.member.vo.MemberVO;
import com.bob.mypage.service.MyPageService;
import com.bob.order.vo.OrderVO;


@Controller("CustomerController")
@RequestMapping(value="/customer")
public class CustomerControllerImpl extends BaseController implements CustomerController {
	private static final String CURR_QNA_IMAGE_REPO_PATH = "C:\\shopping\\qna_file_repo";
	private static final String CURR_REVIEW_IMAGE_REPO_PATH = "C:\\shopping\\review_file_repo";
	
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private MemberVO memberVO;
	
	//공지사항
	//공지사항 메인페이지
	@RequestMapping(value = "/noticeMain.do", method = RequestMethod.GET)
	public ModelAndView noticeMain(@RequestParam(required = false) String notice_id,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		Map<String ,List> noticeMap = customerService.NoticeList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<NoticeVO> selectNoticeList = new ArrayList<NoticeVO>();
		
		if (notice_id != null && !notice_id.isEmpty()) {
			String[] parts = notice_id.split(",");
			for (String part : parts) {
				int number = Integer.parseInt(part);
				String numberStr = String.valueOf(number);
				List<NoticeVO> selectNotice = customerService.selectNoticeDetail(numberStr);
				selectNoticeList.addAll(selectNotice);
			}
			mav.addObject("noticeList", selectNoticeList);
		} else {
			List<NoticeVO> noticeList = noticeMap.get("noticeList");
			mav.addObject("noticeList", noticeList);
		}

		return mav;
	}

	//공지사항 단일조회
	@Override
	@RequestMapping(value="/noticeDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectNotice = customerService.selectNoticeDetail(notice_id);
		mav.addObject("selectNotice", selectNotice);
		return mav;
	}
	
	
	//공지사항 검색
	@RequestMapping(value = "/NoticekeywordSearch.do", method = RequestMethod.POST)
	public ModelAndView NoticekeywordSearch(@RequestParam("keyword") String keyword) {
	    ModelAndView mav = new ModelAndView("redirect:/customer/noticeMain.do");
	    
	    if (keyword == null || keyword.equals("")) {
	        return mav;
	    }
	    
		List<String> keywordList =customerService.NoticekeywordSearch(keyword);
	    mav.addObject("notice_id", keywordList);
	    
	    return mav;
	}


	//FAQ
	//FAQ 메인페이지
	@RequestMapping(value = "/faqMain.do", method = RequestMethod.GET)
	public ModelAndView faqMain(@RequestParam(required = false) String faq_id,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		Map<String ,List> faqMap = customerService.FaqList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<FaqVO> selectFaqList = new ArrayList<FaqVO>();
		
		if (faq_id != null && !faq_id.isEmpty()) {
			String[] parts = faq_id.split(",");
			for (String part : parts) {
				int number = Integer.parseInt(part);
				String numberStr = String.valueOf(number);
				List<FaqVO> selectFaq = customerService.selectFaqDetail(numberStr);
				selectFaqList.addAll(selectFaq);
			}
			mav.addObject("faqList", selectFaqList);
		} else {
			List<FaqVO> faqList = faqMap.get("faqList");
			mav.addObject("faqList", faqList);
		}

		return mav;
	}
	
	//FAQ 검색
	@RequestMapping(value = "/FaqkeywordSearch.do", method = RequestMethod.POST)
	public ModelAndView FaqkeywordSearch(@RequestParam("keyword") String keyword) {
	    ModelAndView mav = new ModelAndView("redirect:/customer/faqMain.do");
	    
	    if (keyword == null || keyword.equals("")) {
	        return mav;
	    }
	    
		List<String> keywordList =customerService.FaqkeywordSearch(keyword);
	    mav.addObject("faq_id", keywordList);
	    
	    return mav;
	}
	
	
	//Q&A
	//Q&A 메인페이지
	@RequestMapping(value = "/qnaMain.do", method = RequestMethod.GET)
	public ModelAndView qnaMain(@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 10; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		Map<String ,List> qnaMap = customerService.QnaList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<QnaVO> qnaList = qnaMap.get("qnaList");

		mav.addObject("qnaList", qnaList);

		return mav;
	}
	
	//Q&A 단일조회
	@Override
	@RequestMapping(value="/qnaDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectQna(@RequestParam("qna_id") String qna_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectQna = customerService.selectQnaDetail(qna_id);
		mav.addObject("selectQna", selectQna);
		return mav;
	}
	
	//Q&A 입력페이지
	@RequestMapping(value = "/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		String goods_id = request.getParameter("goods_id");
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
			int qna_id = customerService.addQna(newQnaMap);
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
			message +=" location.href='"+multipartRequest.getContextPath()+"/customer/qnaMain.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(newQnaMap!=null && newQnaMap.size()!=0) {
				imageFileName = (String)newQnaMap.get("fileName");
				File srcFile = new File(CURR_QNA_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();
			}
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/customer/qnaWrite.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		System.out.println("newQnaMap: " + newQnaMap);
		return resEntity;
	}
	
	//REVIEW
	//REVIEW 메인페이지
	@RequestMapping(value = "/reviewMain.do", method = RequestMethod.GET)
	public ModelAndView reviewMain(@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 10; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		Map<String ,List> reviewMap = customerService.ReviewList(String.valueOf(startRowNum), String.valueOf(endRowNum));

		List<ReviewVO> reviewList = reviewMap.get("reviewList");
		
		mav.addObject("reviewList", reviewList);
		return mav;
	}
	
	//REVIEW 단일조회
	@Override
	@RequestMapping(value="/reviewDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectReview(@RequestParam("review_id") String review_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectReview = customerService.selectReviewDetail(review_id);
		
		mav.addObject("selectReview", selectReview);
		return mav;
	}
	
	//REVIEW 입력페이지
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
	public ModelAndView reviewWrite(@RequestParam("goods_id") String goods_id,
			@RequestParam("order_id") String order_id, HttpServletRequest request, HttpServletResponse response)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		HttpSession session=request.getSession();
		session=request.getSession();
		
		if( goods_id != null ) {			
			Map<String ,List> reviewMap = customerService.reviewWriteFile(goods_id);
			
			mav.addObject("order_id", order_id);
			
			List<ImageFileVO> reviewWriteFile = reviewMap.get("reviewWriteFile");
			
			mav.addObject("reviewWriteFile", reviewWriteFile);
		}
		return mav;
	}
	
	//REVIEW 등록하기
	@RequestMapping(value="/addReview.do" ,method={RequestMethod.POST})
	public ResponseEntity addReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String imageFileName = null;
		
		Map newReviewMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()){
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			newReviewMap.put(name, value);
			System.out.println("name: " + name + ", value: " + value);
		}
		
		MultipartFile file = multipartRequest.getFile("fileName");
		String fileName = file.getOriginalFilename();
		newReviewMap.put("fileName", fileName);
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		newReviewMap.put("member_id", member_id);
		
		String goodsID = (String)newReviewMap.get("goods_id");
		newReviewMap.put("goods_id", goodsID);
		
		String orderID = (String)newReviewMap.get("order_id");
		newReviewMap.put("order_id", orderID);

		
		List<ReviewVO> imageFileList =reviewUpload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!= 0) {
			for(ReviewVO reviewVO : imageFileList) {
				reviewVO.setMember_id(member_id);
			}
			newReviewMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int review_id = customerService.addReview(newReviewMap); // 리뷰 추가 후 반환된 review_id를 변수에 할당
			if(newReviewMap!=null && newReviewMap.size()!=0) {
				imageFileName = (String) newReviewMap.get("fileName");
				File srcFile = new File(CURR_REVIEW_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(CURR_REVIEW_IMAGE_REPO_PATH+"\\"+review_id);
				if (!destDir.exists()) {
	                destDir.mkdirs(); // 폴더가 존재하지 않으면 생성
	            }
				if (fileName != null && !fileName.isEmpty()) {
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('REVIEW가 작성되었습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/customer/reviewMain.do';";
			message +=("</script>");
		}catch(Exception e) {
			if(newReviewMap!=null && newReviewMap.size()!=0) {
				imageFileName = (String)newReviewMap.get("fileName");
				File srcFile = new File(CURR_REVIEW_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();

			}
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/customer/reviewMain.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		System.out.println("newReviewMap: " + newReviewMap);
		return resEntity;
	}
}