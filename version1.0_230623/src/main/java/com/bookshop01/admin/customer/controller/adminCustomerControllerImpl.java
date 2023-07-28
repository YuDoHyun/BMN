package com.bookshop01.admin.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.bookshop01.admin.customer.service.adminCustomerService;
import com.bookshop01.customer.vo.NoticeVO;






@Controller("adminCustomerController")
@RequestMapping(value="/admin/customer")
public class adminCustomerControllerImpl implements adminCustomerController {
	
	@Autowired
	private adminCustomerService adminCustomerService;
	
	//공지사항 메인페이지
	@RequestMapping(value = "/adminNoticeMain.do", method = RequestMethod.GET)
	public ModelAndView adminNoticeMain(@RequestParam(required = false) String notice_id,
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
		
		NoticeVO noticeVO = new NoticeVO();
		Map<String ,List> noticeMap = adminCustomerService.NoticeList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<NoticeVO> selectNoticeList = new ArrayList<NoticeVO>();
		
		if (notice_id != null && !notice_id.isEmpty()) {
			String[] parts = notice_id.split(",");
			for (String part : parts) {
				int number = Integer.parseInt(part);
				String numberStr = String.valueOf(number);
				List<NoticeVO> selectNotice = adminCustomerService.selectNoticeDetail(numberStr);
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
	@RequestMapping(value="/adminNoticeDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectNotice = adminCustomerService.selectNoticeDetail(notice_id);
		mav.addObject("selectNotice", selectNotice);
		return mav;
	}
	
	//공지사항 수정
	@RequestMapping(value="/modifyNotice.do" ,method={RequestMethod.POST})
	public ResponseEntity modifyNotice( @RequestParam("notice_id") String notice_id,
			                     @RequestParam("notice_title") String notice_title,
			                     @RequestParam("notice_content") String notice_content,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Map<String,String> noticeMap=new HashMap<String,String>();
		noticeMap.put("notice_id", notice_id);
		noticeMap.put("notice_title", notice_title);
		noticeMap.put("notice_content", notice_content);
		adminCustomerService.modifyNotice(noticeMap);
		
		String script = "<script>alert('공지사항이 수정되었습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminNoticeMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//공지사항 삭제하기
	@RequestMapping(value="/deleteNotice.do" ,method = RequestMethod.POST)
	public ResponseEntity deleteNotice(@RequestParam("notice_id") String notice_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		adminCustomerService.deleteNotice(notice_id);
		
		String script = "<script>alert('공지사항이 삭제되었습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminNoticeMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//공지사항 입력페이지
	@RequestMapping(value = "/adminNoticeWrite.do")
	public ModelAndView adminNoticeWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	//공지사항 등록
	@Override
	@RequestMapping(value="/addNotice.do" ,method = RequestMethod.GET)
	public ResponseEntity addNotice(@ModelAttribute("noticeVO") NoticeVO noticeVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    adminCustomerService.addNotice( noticeVO );
		    message = "<script>alert('공지사항이 등록되었습니다.'); "
					+ "location.href='"+request.getContextPath()+"/admin/customer/adminNoticeMain.do'; </script>";
		    
		}catch(Exception e) {
			message = "<script>alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.'); "
					+ "location.href='"+request.getContextPath()+"/admin/customer/adminNoticeWrite.do'; </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//공지사항 검색
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.POST)
	public ModelAndView keywordSearch(@RequestParam("keyword") String keyword) {
	    ModelAndView mav = new ModelAndView("redirect:/admin/customer/adminNoticeMain.do");
	    
	    if (keyword == null || keyword.equals("")) {
	        return mav;
	    }
	    
		List<String> keywordList =adminCustomerService.keywordSearch(keyword);
	    mav.addObject("notice_id", keywordList);
	    
	    return mav;
	}


}