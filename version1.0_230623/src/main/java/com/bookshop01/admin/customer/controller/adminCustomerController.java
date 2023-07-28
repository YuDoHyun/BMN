package com.bookshop01.admin.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.customer.vo.NoticeVO;

public interface adminCustomerController {
	public ModelAndView adminNoticeMain(@RequestParam(required = false) String keyword,
			@RequestParam(value="page",required=false) String page,
			HttpServletRequest request)  throws Exception;
	public ModelAndView selectNotice(@RequestParam("notice_id") String notice_id, HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyNotice(@RequestParam("notice_id")  String notice_id,
			@RequestParam("notice_title") String notice_title,
			@RequestParam("notice_content") String notice_content,
			HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity deleteNotice(@RequestParam("notice_id") String notice_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView adminNoticeWrite(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity addNotice(@ModelAttribute("notice") NoticeVO notice,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView keywordSearch(@RequestParam("keyword") String keyword) throws Exception;
}