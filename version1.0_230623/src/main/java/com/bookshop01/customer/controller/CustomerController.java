package com.bookshop01.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


public interface CustomerController {
	public ModelAndView noticeMain(@RequestParam(required = false) String keyword,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception;
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView keywordSearch(@RequestParam("keyword") String keyword) throws Exception;
}