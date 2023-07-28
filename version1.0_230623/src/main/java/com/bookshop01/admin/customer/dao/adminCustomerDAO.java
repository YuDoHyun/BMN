package com.bookshop01.admin.customer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.customer.vo.NoticeVO;


public interface adminCustomerDAO {
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum);
	public List selectNoticeDetail(String notice_id);
	public void modifyNotice(Map noticeMap) throws DataAccessException;
	public void deleteNotice(String notice_id) throws DataAccessException;
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException;
	public List<String> KeywordSearch(String keyword) throws DataAccessException;
}
