package com.bob.admin.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;

public interface adminCustomerController {
	//공지사항
	public ModelAndView adminNoticeMain(@RequestParam(value="page",required=false) String page, @RequestParam(value="keyword",required=false) String keyword,	HttpServletRequest request)  throws Exception;
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyNotice(@RequestParam("notice_id")  String notice_id,
			@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity deleteNotice(@RequestParam("notice_id") List<String> notice_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView adminNoticeWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity addNotice(@ModelAttribute("notice") NoticeVO notice,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//FAQ
	public ModelAndView adminFaqMain(@RequestParam(value="page",required=false) String page, @RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception;
	public ModelAndView selectFaq(@RequestParam("faq_id") String faq_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyFaq(@RequestParam("faq_id")  String faq_id,
			@RequestParam("faq_title") String faq_title,
			@RequestParam("faq_content") String faq_content,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity deleteFaq(@RequestParam("faq_id") List<String> faq_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView adminFaqWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity addFaq(@ModelAttribute("faq") FaqVO faq,
            HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	//Q&A
	public ModelAndView adminQnaMain(@RequestParam(value="page",required=false) String page, @RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception;
	public ModelAndView selectQna(@RequestParam("qna_id") String qna_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyQna(@RequestParam("qna_id")  String qna_id,
			@RequestParam("qna_comment") String qna_comment,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView adminQnaDetailImage(@RequestParam("qna_id") String qna_id,
			@RequestParam("fileName") String fileName, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	//Review
	public ModelAndView adminReviewMain(@RequestParam(value="page",required=false) String page,	@RequestParam(value="keyword",required=false) String keyword, HttpServletRequest request)  throws Exception;
	public ModelAndView selectReview(@RequestParam("review_id") String review_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyReview(@RequestParam("review_id")  String review_id,
			@RequestParam("review_comment") String review_comment,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView adminReviewDetailImage(@RequestParam("review_id") String review_id,
			@RequestParam("fileName") String fileName, HttpServletRequest request, HttpServletResponse response)  throws Exception;
}