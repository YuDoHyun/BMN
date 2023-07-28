package com.bob.admin.customer.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;


@Repository("adminCustomerDAO")
public class adminCustomerDAOImpl  implements adminCustomerDAO{
	@Autowired
	private SqlSession sqlSession;

	//공지사항
	@Override
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum) throws DataAccessException {
		NoticeVO noticeVO = new NoticeVO();
	    noticeVO.setStartRowNum(startRowNum);
	    noticeVO.setEndRowNum(endRowNum);
	    
	    List<NoticeVO> noticeList = sqlSession.selectList("mapper.admin.customer.NoticeList", noticeVO);
	    return noticeList;
	}
	
	public List selectNoticeDetail(String notice_id) throws DataAccessException{
		List selectNotice=(List)sqlSession.selectList("mapper.admin.customer.selectNoticeDetail",notice_id);
		return selectNotice;
	}

	@Override
	public void modifyNotice(Map noticeMap) throws DataAccessException{
		sqlSession.update("mapper.admin.customer.modifyNotice",noticeMap);
	}
	
	@Override
	public void deleteNotice(String notice_id) throws DataAccessException{
		sqlSession.delete("mapper.admin.customer.deleteNotice",notice_id);
	}
	
	@Override
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException{
		sqlSession.insert("mapper.admin.customer.insertNotice",noticeVO);
	}
	
	@Override
	public List<String> NoticeKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.admin.customer.NoticeKeywordSearch",keyword);
	   return list;
	}
	
	
	//FAQ
	@Override
	public List<FaqVO> FaqList(String startRowNum, String endRowNum) throws DataAccessException {
		FaqVO faqVO = new FaqVO();
	    faqVO.setStartRowNum(startRowNum);
	    faqVO.setEndRowNum(endRowNum);
	    
	    List<FaqVO> faqList = sqlSession.selectList("mapper.admin.customer.FaqList", faqVO);
	    return faqList;
	}
	
	public List selectFaqDetail(String faq_id) throws DataAccessException{
		List selectFaq=(List)sqlSession.selectList("mapper.admin.customer.selectFaqDetail",faq_id);
		return selectFaq;
	}

	@Override
	public void modifyFaq(Map faqMap) throws DataAccessException{
		sqlSession.update("mapper.admin.customer.modifyFaq",faqMap);
	}
	
	@Override
	public void deleteFaq(String faq_id) throws DataAccessException{
		sqlSession.delete("mapper.admin.customer.deleteFaq",faq_id);
	}
	
	@Override
	public void insertFaq(FaqVO faqVO) throws DataAccessException{
		sqlSession.insert("mapper.admin.customer.insertFaq",faqVO);
	}
	
	@Override
	public List<String> FaqKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.admin.customer.FaqKeywordSearch",keyword);
	   return list;
	}
	
	//Q&A
	@Override
	public List<QnaVO> QnaList(String startRowNum, String endRowNum) throws DataAccessException {
		QnaVO qnaVO = new QnaVO();
		qnaVO.setStartRowNum(startRowNum);
		qnaVO.setEndRowNum(endRowNum);
	    
	    List<QnaVO> qnaList = sqlSession.selectList("mapper.admin.customer.QnaList", qnaVO);
	    return qnaList;
	}
	
	public List selectQnaDetail(String qna_id) throws DataAccessException{
		List selectQna=(List)sqlSession.selectList("mapper.admin.customer.selectQnaDetail",qna_id);
		return selectQna;
	}

	@Override
	public void modifyQna(Map qnaMap) throws DataAccessException{
		sqlSession.update("mapper.admin.customer.modifyQna",qnaMap);
	}
	
	@Override
	public List<String> QnaKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.admin.customer.QnaKeywordSearch",keyword);
	   return list;
	}
	
	
	//Review
	@Override
	public List<ReviewVO> ReviewList(String startRowNum, String endRowNum) throws DataAccessException {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartRowNum(startRowNum);
		reviewVO.setEndRowNum(endRowNum);
	    
	    List<ReviewVO> reviewList = sqlSession.selectList("mapper.admin.customer.ReviewList", reviewVO);
	    return reviewList;
	}
	
	public List selectReviewDetail(String review_id) throws DataAccessException{
		List selectReview=(List)sqlSession.selectList("mapper.admin.customer.selectReviewDetail",review_id);
		return selectReview;
	}

	@Override
	public void modifyReview(Map reviewMap) throws DataAccessException{
		sqlSession.update("mapper.admin.customer.modifyReview",reviewMap);
	}
	
	@Override
	public List<String> ReviewKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.admin.customer.ReviewKeywordSearch",keyword);
	   return list;
	}
}
