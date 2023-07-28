package com.bookshop01.customer.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.bookshop01.customer.service.CustomerService;
import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;
import com.bookshop01.customer.vo.QnaVO;


@Controller("CustomerController")
@RequestMapping(value="/customer")
public class CustomerControllerImpl implements CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
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
		for (QnaVO qna : qnaList) {
		    System.out.println("qna_id : " + qna.getQna_id());
		    System.out.println("qna_title : " + qna.getQna_title());
		    System.out.println("qna_content : " + qna.getQna_content());
		    System.out.println("qna_date : " + qna.getQna_date());
		    System.out.println("member_name : " + qna.getMember_name());
		    System.out.println("goods_id : " + qna.getGoods_id());
		    System.out.println("filename : " + qna.getFilename());
		    System.out.println("Date: " + qna.getQna_date());
		    System.out.println("---------------------------");
		}
		
		mav.addObject("qnaList", qnaList);

		return mav;
	}
	
	//공지사항 단일조회
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
}