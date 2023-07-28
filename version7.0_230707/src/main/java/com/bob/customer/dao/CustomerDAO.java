package com.bob.customer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;


public interface CustomerDAO {
	//공지사항
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum);
	public List selectNoticeDetail(String notice_id);
	public List<String> NoticeKeywordSearch(String keyword) throws DataAccessException;
	
	//FAQ
	public List<FaqVO> FaqList(String startRowNum, String endRowNum);
	public List selectFaqDetail(String faq_id);
	public List<String> FaqKeywordSearch(String keyword) throws DataAccessException;
	
	//Q&A
	public List<QnaVO> QnaList(String startRowNum, String endRowNum);
	public List selectQnaDetail(String qna_id);
	public int insertQna(Map newQnaMap) throws DataAccessException;
}
