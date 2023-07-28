package com.bookshop01.customer.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.customer.vo.NoticeVO;


@Repository("CustomerDAO")
public class CustomerDAOImpl  implements CustomerDAO{
	@Autowired
	private SqlSession sqlSession;

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
	public List<String> KeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.customer.KeywordSearch",keyword);
	   return list;
	}
	
	
}
