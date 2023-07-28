package com.bookshop01.customer.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.customer.vo.NoticeVO;


public interface CustomerDAO {
	public List<NoticeVO> NoticeList(String startRowNum, String endRowNum);
	public List selectNoticeDetail(String notice_id);
	public List<String> KeywordSearch(String keyword) throws DataAccessException;
}
