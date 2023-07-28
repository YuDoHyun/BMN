package com.bob.admin.customer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;


public interface adminCustomerDAO {
	//공지사항
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum);
	public List selectNoticeDetail(String notice_id);
	public void modifyNotice(Map noticeMap) throws DataAccessException;
	public void deleteNotice(String notice_id) throws DataAccessException;
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException;
	public List<NoticeVO> NoticeKeywordSearch(String keyword, String startRowNum, String endRowNum) throws DataAccessException;
	
	//FAQ
	public List<FaqVO> FaqList(String startRowNum, String endRowNum);
	public List selectFaqDetail(String faq_id);
	public void modifyFaq(Map faqMap) throws DataAccessException;
	public void deleteFaq(String faq_id) throws DataAccessException;
	public void insertFaq(FaqVO faqVO) throws DataAccessException;
	public List<String> FaqKeywordSearch(String keyword, String startRowNum, String endRowNum) throws DataAccessException;
	
	//Q&A
	public List<QnaVO> QnaList(String startRowNum, String endRowNum);
	public List selectQnaDetail(String qna_id);
	public void modifyQna(Map qnaMap) throws DataAccessException;
	public List<String> QnaKeywordSearch(String keyword, String startRowNum, String endRowNum) throws DataAccessException;
	
	//Review
	public List<ReviewVO> ReviewList(String startRowNum, String endRowNum);
	public List selectReviewDetail(String review_id);
	public void modifyReview(Map reviewMap) throws DataAccessException;
	public List<ReviewVO> ReviewKeywordSearch(String keyword, String startRowNum, String endRowNum) throws DataAccessException;
}
