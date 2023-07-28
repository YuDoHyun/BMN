package com.bookshop01.admin.customer.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;

public interface adminCustomerService {
	//공지사항
	public Map<String ,List> NoticeList(String startRowNum, String endRowNum) throws Exception;
	public List selectNoticeDetail(String notice_id) throws Exception;
	public void modifyNotice(Map noticeMap) throws Exception;
	public void deleteNotice(String notice_id) throws Exception;
	public void addNotice(NoticeVO noticeVO) throws Exception;
    public List<String> NoticekeywordSearch(String keyword);
    
    //FAQ
    public Map<String ,List> FaqList(String startRowNum, String endRowNum) throws Exception;
	public List selectFaqDetail(String faq_id) throws Exception;
	public void modifyFaq(Map faqMap) throws Exception;
	public void deleteFaq(String faq_id) throws Exception;
	public void addFaq(FaqVO faqVO) throws Exception;
    public List<String> FaqkeywordSearch(String keyword);
}