package com.bookshop01.admin.customer.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.customer.vo.NoticeVO;

public interface adminCustomerService {
	public Map<String ,List> NoticeList(String startRowNum, String endRowNum) throws Exception;
	public List selectNoticeDetail(String notice_id) throws Exception;
	public void modifyNotice(Map noticeMap) throws Exception;
	public void deleteNotice(String notice_id) throws Exception;
	public void addNotice(NoticeVO noticeVO) throws Exception;
    public List<String> keywordSearch(String keyword);
}