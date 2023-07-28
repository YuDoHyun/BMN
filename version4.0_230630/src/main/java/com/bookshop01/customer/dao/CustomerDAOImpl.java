package com.bookshop01.customer.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;
import com.bookshop01.customer.vo.QnaVO;


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
	public List<String> FaqKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.customer.FaqKeywordSearch",keyword);
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
}
