package com.bookshop01.customer.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.customer.vo.NoticeVO;

public interface CustomerService {
	//공지사항
	public Map<String ,List> NoticeList(String startRowNum, String endRowNum) throws Exception;
	public List selectNoticeDetail(String notice_id) throws Exception;
    public List<String> NoticekeywordSearch(String keyword);
    
    //FAQ
    public Map<String ,List> FaqList(String startRowNum, String endRowNum) throws Exception;
	public List selectFaqDetail(String faq_id) throws Exception;
    public List<String> FaqkeywordSearch(String keyword);
    
    //Q&A
    public Map<String ,List> QnaList(String startRowNum, String endRowNum) throws Exception;
    public List selectQnaDetail(String qna_id) throws Exception;
}