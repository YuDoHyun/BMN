package com.bob.customer.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.bob.goods.vo.ImageFileVO;


@Repository("CustomerDAO")
public class CustomerDAOImpl  implements CustomerDAO{
	@Autowired
	private SqlSession sqlSession;

	//공지사항
	@Override
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum) throws DataAccessException {
		NoticeVO noticeVO = new NoticeVO();
	    noticeVO.setStartRowNum(startRowNum);
	    noticeVO.setEndRowNum(endRowNum);
	    
	    List<NoticeVO> noticeList = sqlSession.selectList("mapper.customer.NoticeList", noticeVO);
	    return noticeList;
	}
	
	public List selectNoticeDetail(String notice_id) throws DataAccessException{
		List selectNotice=(List)sqlSession.selectList("mapper.customer.selectNoticeDetail",notice_id);
		return selectNotice;
	}
	
	@Override
	public List<String> NoticeKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.customer.NoticeKeywordSearch",keyword);
	   return list;
	}
	
	
	//FAQ
	@Override
	public List<FaqVO> FaqList(String startRowNum, String endRowNum) throws DataAccessException {
		FaqVO faqVO = new FaqVO();
	    faqVO.setStartRowNum(startRowNum);
	    faqVO.setEndRowNum(endRowNum);
	    
	    List<FaqVO> faqList = sqlSession.selectList("mapper.customer.FaqList", faqVO);
	    return faqList;
	}
	
	public List selectFaqDetail(String faq_id) throws DataAccessException{
		List selectFaq=(List)sqlSession.selectList("mapper.customer.selectFaqDetail",faq_id);
		return selectFaq;
	}
	
	@Override
	public List<String> FaqKeywordSearch(String keyword, String startRowNum, String endRowNum) throws DataAccessException {
		Map<String, Object> paramMap = new HashMap<String, Object>();
	   paramMap.put("keyword", keyword);
	   paramMap.put("startRowNum", startRowNum);
	   paramMap.put("endRowNum", endRowNum);
	   
	    List<String> list= sqlSession.selectList("mapper.customer.FaqKeywordSearch",paramMap);
	    return list;
	}
	
	
	//Q&A
	@Override
	public List<QnaVO> QnaList(String startRowNum, String endRowNum) throws DataAccessException {
		QnaVO qnaVO = new QnaVO();
		qnaVO.setStartRowNum(startRowNum);
		qnaVO.setEndRowNum(endRowNum);
	    
	    List<QnaVO> qnaList = sqlSession.selectList("mapper.customer.QnaList", qnaVO);
	    return qnaList;
	}
	
	public List selectQnaDetail(String qna_id) throws DataAccessException{
		List selectQna=(List)sqlSession.selectList("mapper.customer.selectQnaDetail",qna_id);
		return selectQna;
	}
	
	@Override
	public int insertQna(Map newQnaMap) throws DataAccessException {
		sqlSession.insert("mapper.customer.insertQna",newQnaMap);
		return (Integer)newQnaMap.get("qna_id");
	}
	
	//REVIEW
	@Override
	public List<ReviewVO> ReviewList(String startRowNum, String endRowNum) throws DataAccessException {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStartRowNum(startRowNum);
		reviewVO.setEndRowNum(endRowNum);
	    
	    List<ReviewVO> reviewList = sqlSession.selectList("mapper.customer.ReviewList", reviewVO);
	    return reviewList;
	}
	
	public List<ImageFileVO> reviewWriteFile(String goods_id){
		List<ImageFileVO> reviewList = sqlSession.selectList("mapper.customer.reviewWriteFile", goods_id);
		return reviewList;
	}
	
	public List selectReviewDetail(String review_id) throws DataAccessException{
		List selectReview=(List)sqlSession.selectList("mapper.customer.selectReviewDetail",review_id);
		return selectReview;
	}
	
	@Override
	public int insertReview(Map newReviewMap) throws DataAccessException {
		sqlSession.insert("mapper.customer.insertReview",newReviewMap);
		return (Integer)newReviewMap.get("review_id");
	}
}
