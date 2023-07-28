package com.bookshop01.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface CustomerController {
	//공지사항
	public ModelAndView noticeMain(@RequestParam(required = false) String keyword,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception;
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView NoticekeywordSearch(@RequestParam("keyword") String keyword) throws Exception;
	
	//FAQ
	public ModelAndView faqMain(@RequestParam(required = false) String keyword,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception;
	public ModelAndView FaqkeywordSearch(@RequestParam("keyword") String keyword) throws Exception;
	
	//Q&A
	public ModelAndView qnaMain(@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception;
	public ModelAndView selectQna(@RequestParam("qna_id") String qna_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	
	//REVIEW 23-06-28
	/*
	 * public ModelAndView reviewMain(@RequestParam(value="page",required=false)
	 * String page, HttpServletRequest request) throws Exception; public
	 * ModelAndView selectReview(@RequestParam("review_id") String
	 * review_id,HttpServletRequest request, HttpServletResponse response) throws
	 * Exception;
	 */
}