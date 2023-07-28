package com.bookshop01.admin.customer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;


public interface adminCustomerDAO {
	//공지사항
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum);
	public List selectNoticeDetail(String notice_id);
	public void modifyNotice(Map noticeMap) throws DataAccessException;
	public void deleteNotice(String notice_id) throws DataAccessException;
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException;
	public List<String> NoticeKeywordSearch(String keyword) throws DataAccessException;
	
	//FAQ
	public List<FaqVO> FaqList(String startRowNum, String endRowNum);
	public List selectFaqDetail(String faq_id);
	public void modifyFaq(Map faqMap) throws DataAccessException;
	public void deleteFaq(String faq_id) throws DataAccessException;
	public void insertFaq(FaqVO faqVO) throws DataAccessException;
	public List<String> FaqKeywordSearch(String keyword) throws DataAccessException;
}
