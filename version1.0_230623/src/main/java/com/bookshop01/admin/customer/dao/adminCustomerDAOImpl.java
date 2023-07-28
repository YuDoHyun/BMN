package com.bookshop01.admin.customer.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.customer.vo.NoticeVO;


@Repository("adminCustomerDAO")
public class adminCustomerDAOImpl  implements adminCustomerDAO{
	@Autowired
	private SqlSession sqlSession;

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
	public List<String> KeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.admin.customer.KeywordSearch",keyword);
	   return list;
	}
	
	
}
