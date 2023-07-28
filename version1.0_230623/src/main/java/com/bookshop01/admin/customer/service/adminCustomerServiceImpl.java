package com.bookshop01.admin.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.admin.customer.dao.adminCustomerDAO;
import com.bookshop01.customer.vo.NoticeVO;



@Service("adminCustomerService")
public class adminCustomerServiceImpl implements adminCustomerService {
    @Autowired
    private adminCustomerDAO adminCustomerDAO;

    @Override
    public Map<String, List> NoticeList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> noticeMap = new HashMap<String, List>();
        
        List<NoticeVO> noticeList = adminCustomerDAO.NoticeList(startRowNum, endRowNum);
        noticeMap.put("noticeList", noticeList);
        
        return noticeMap;
    }

    public List selectNoticeDetail(String notice_id) throws Exception{
		return adminCustomerDAO.selectNoticeDetail(notice_id);
	}
    
    @Override
	public void modifyNotice(Map noticeMap) throws Exception{
    	adminCustomerDAO.modifyNotice(noticeMap);
	}	
    
    @Override
	public void deleteNotice(String notice_id) throws Exception{
    	adminCustomerDAO.deleteNotice(notice_id);
	}	
    
    @Override
	public void addNotice(NoticeVO noticeVO) throws Exception{
    	adminCustomerDAO.insertNotice( noticeVO );
	}
    
    @Override
    public List<String> keywordSearch(String keyword) {
        return adminCustomerDAO.KeywordSearch(keyword);
    }

}