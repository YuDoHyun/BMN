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
import com.bookshop01.customer.vo.NoticeVO;


@Controller("CustomerController")
@RequestMapping(value="/customer")
public class CustomerControllerImpl implements CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
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
		
		NoticeVO noticeVO = new NoticeVO();
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
	@RequestMapping(value = "/keywordSearch.do", method = RequestMethod.POST)
	public ModelAndView keywordSearch(@RequestParam("keyword") String keyword) {
	    ModelAndView mav = new ModelAndView("redirect:/customer/noticeMain.do");
	    
	    if (keyword == null || keyword.equals("")) {
	        return mav;
	    }
	    
		List<String> keywordList =customerService.keywordSearch(keyword);
	    mav.addObject("notice_id", keywordList);
	    
	    return mav;
	}


}