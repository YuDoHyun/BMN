package com.bookshop01.customer.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.customer.vo.NoticeVO;

public interface CustomerService {
	public Map<String ,List> NoticeList(String startRowNum, String endRowNum) throws Exception;
	public List selectNoticeDetail(String notice_id) throws Exception;
    public List<String> keywordSearch(String keyword);
}