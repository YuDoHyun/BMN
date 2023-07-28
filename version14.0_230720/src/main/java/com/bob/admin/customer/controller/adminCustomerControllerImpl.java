package com.bob.admin.customer.controller;

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

import com.bob.admin.customer.service.adminCustomerService;
import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;


@Controller("adminCustomerController")
@RequestMapping(value="/admin/customer")
public class adminCustomerControllerImpl implements adminCustomerController {
	
	@Autowired
	private adminCustomerService adminCustomerService;
	
	//공지사항
	
	//공지사항 메인페이지
	@RequestMapping(value = "/adminNoticeMain.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminNoticeMain(@RequestParam(value="page",required=false) String page,
			@RequestParam(value="keyword",required=false) String keyword,
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
		
		Map<String ,List> noticeMap = adminCustomerService.NoticeList(String.valueOf(startRowNum), String.valueOf(endRowNum));

		
		
		if (keyword != null && !keyword.isEmpty()) {
		    List<NoticeVO> keywordList = adminCustomerService.NoticekeywordSearch(keyword, String.valueOf(startRowNum), String.valueOf(endRowNum));
		    mav.addObject("noticeList", keywordList);
		}else {
		  
		List<NoticeVO> selectNoticeList = new ArrayList<NoticeVO>();

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
	public ResponseEntity deleteNotice(@RequestParam("notice_id") List<String> notice_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		for (String noticeId : notice_id) {
	        adminCustomerService.deleteNotice(noticeId);
	    }
		
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
	


	
	
	//FAQ
	
	//FAQ 메인페이지
	@RequestMapping(value = "/adminFaqMain.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminFaqMain(@RequestParam(value="page",required=false) String page, 
			@RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception {
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
		
		
		List<FaqVO> selectFaqList = new ArrayList<FaqVO>();
		
		if (keyword != null && !keyword.isEmpty()) {
			List<String> keywordList =adminCustomerService.FaqkeywordSearch(keyword, String.valueOf(startRowNum), String.valueOf(endRowNum));
		    mav.addObject("faqList", keywordList);
		}else {
		Map<String ,List> faqMap = adminCustomerService.FaqList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		List<FaqVO> faqList = faqMap.get("faqList");
		mav.addObject("faqList", faqList);
		}

		return mav;
	}

	//FAQ 단일조회
	@Override
	@RequestMapping(value="/adminFaqDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectFaq(@RequestParam("faq_id") String faq_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectFaq = adminCustomerService.selectFaqDetail(faq_id);
		mav.addObject("selectFaq", selectFaq);
		return mav;
	}
	
	//FAQ 수정
	@RequestMapping(value="/modifyFaq.do" ,method={RequestMethod.GET})
	public ResponseEntity modifyFaq( @RequestParam("faq_id") String faq_id,
			                     @RequestParam("faq_title") String faq_title,
			                     @RequestParam("faq_content") String faq_content,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Map<String,String> faqMap=new HashMap<String,String>();
		faqMap.put("faq_id", faq_id);
		faqMap.put("faq_title", faq_title);
		faqMap.put("faq_content", faq_content);
		adminCustomerService.modifyFaq(faqMap);
		
		String script = "<script>alert('FAQ가 수정되었습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminFaqMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//FAQ 삭제하기
	@RequestMapping(value="/deleteFaq.do" ,method = RequestMethod.POST)
	public ResponseEntity deleteFaq(@RequestParam("faq_id") List<String> faq_id,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		for (String faqId : faq_id) {
	        adminCustomerService.deleteFaq(faqId);
	    }
		
		String script = "<script>alert('FAQ가 삭제되었습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminFaqMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//FAQ 입력페이지
	@RequestMapping(value = "/adminFaqWrite.do")
	public ModelAndView adminFaqWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	    String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	//FAQ 등록
	@Override
	@RequestMapping(value="/addFaq.do" ,method = RequestMethod.GET)
	public ResponseEntity addFaq(@ModelAttribute("faqVO") FaqVO faqVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    adminCustomerService.addFaq( faqVO );
		    message = "<script>alert('FAQ가 등록되었습니다.'); "
					+ "location.href='"+request.getContextPath()+"/admin/customer/adminFaqMain.do'; </script>";
		    
		}catch(Exception e) {
			message = "<script>alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요.'); "
					+ "location.href='"+request.getContextPath()+"/admin/customer/adminFaqWrite.do'; </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	
	//Q&A
	
	//Q&A 메인페이지
	@RequestMapping(value = "/adminQnaMain.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminQnaMain(@RequestParam(value="page",required=false) String page, 
			@RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception {
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
		
		Map<String ,List> qnaMap = adminCustomerService.QnaList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<QnaVO> selectQnaList = new ArrayList<QnaVO>();
		
		if (keyword != null && !keyword.isEmpty()) {
			
			List<String> keywordList =adminCustomerService.QnakeywordSearch(keyword, String.valueOf(startRowNum), String.valueOf(endRowNum));
		    mav.addObject("qnaList", keywordList);
		    
		}else {
		
			List<QnaVO> qnaList = qnaMap.get("qnaList");
			mav.addObject("qnaList", qnaList);
		}

		return mav;
	}

	//Q&A 단일조회
	@Override
	@RequestMapping(value="/adminQnaDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectQna(@RequestParam("qna_id") String qna_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectQna = adminCustomerService.selectQnaDetail(qna_id);
		mav.addObject("selectQna", selectQna);
		return mav;
	}
	
	//Q&A 수정
	@RequestMapping(value="/modifyQna.do" ,method={RequestMethod.GET})
	public ResponseEntity modifyQna( @RequestParam("qna_id") String qna_id,
			                     @RequestParam("qna_comment") String qna_comment,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Map<String,String> qnaMap=new HashMap<String,String>();
		qnaMap.put("qna_id", qna_id);
		qnaMap.put("qna_comment", qna_comment);
		adminCustomerService.modifyQna(qnaMap);
		
		String script = "<script>alert('Q&A답글을 수정하였습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminQnaMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	//Q&A 검색
	@RequestMapping(value = "/adminQnaSearch.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView QnakeywordSearch(@RequestParam("keyword") String keyword, @RequestParam(value="page",required=false) String page,
			HttpServletRequest request) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
	    
	    if (keyword == null || keyword.equals("")) {
	        return mav;
	    }
	    if( page == null ) {
			page = "1";
		}
		mav.addObject("page", page);
		
		int num_page_no = Integer.parseInt( page ); //page번호 1,2,3,4
		int num_page_size = 5; //한페이지당 Row갯수
		int startRowNum = (num_page_no - 1) * num_page_size + 1; // 1, 6, 11 페이지 시작 줄번호
		int endRowNum = (num_page_no * num_page_size);           // 5, 10, 15 페이지 끝 줄번호
		
		List<String> keywordList =adminCustomerService.QnakeywordSearch(keyword, String.valueOf(startRowNum), String.valueOf(endRowNum));
	    mav.addObject("qnaList", keywordList);
	    
	    return mav;
	}
	
	//Q&A 사진 페이지
	@RequestMapping(value = "//adminQnaDetailImage.do")
	public ModelAndView adminQnaDetailImage(@RequestParam("qna_id") String qna_id,
			@RequestParam("fileName") String fileName, 
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectQna = adminCustomerService.selectQnaDetail(qna_id);
		mav.addObject("selectQna", selectQna);
		return mav;
	}
	
	
	//Review
	
	//Review 메인페이지
	@RequestMapping(value = "/adminReviewMain.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminReviewMain(@RequestParam(value="page",required=false) String page, 
			@RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception {
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
		
		Map<String ,List> reviewMap = adminCustomerService.ReviewList(String.valueOf(startRowNum), String.valueOf(endRowNum));
		
		List<ReviewVO> selectReviewList = new ArrayList<ReviewVO>();
		
		if (keyword != null && !keyword.isEmpty()) {
			List<ReviewVO> keywordList =adminCustomerService.ReviewkeywordSearch(keyword, String.valueOf(startRowNum), String.valueOf(endRowNum));
		    mav.addObject("reviewList", keywordList);
		}else {
			List<ReviewVO> reviewList = reviewMap.get("reviewList");
			mav.addObject("reviewList", reviewList);
		}

		return mav;
	}

	//Review 단일조회
	@Override
	@RequestMapping(value="/adminReviewDetail.do" ,method = RequestMethod.GET)
	public ModelAndView selectReview(@RequestParam("review_id") String review_id,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectReview = adminCustomerService.selectReviewDetail(review_id);
		mav.addObject("selectReview", selectReview);
		return mav;
	}
	
	//Review 수정
	@RequestMapping(value="/modifyReview.do" ,method={RequestMethod.GET})
	public ResponseEntity modifyReview( @RequestParam("review_id") String review_id,
			                     @RequestParam("review_comment") String review_comment,
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		Map<String,String> reviewMap=new HashMap<String,String>();
		reviewMap.put("review_id", review_id);
		reviewMap.put("review_comment", review_comment);
		adminCustomerService.modifyReview(reviewMap);
		
		String script = "<script>alert('리뷰 답글을 수정하였습니다.'); "
				+ "location.href='"+request.getContextPath()+"/admin/customer/adminReviewMain.do'; </script>";
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		resEntity =new ResponseEntity(script, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	//Review 사진 페이지
	@RequestMapping(value = "//adminReviewDetailImage.do")
	public ModelAndView adminReviewDetailImage(@RequestParam("review_id") String review_id,
			@RequestParam("fileName") String fileName, 
			HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List selectReview = adminCustomerService.selectReviewDetail(review_id);
		mav.addObject("selectReview", selectReview);
		return mav;
	}
}