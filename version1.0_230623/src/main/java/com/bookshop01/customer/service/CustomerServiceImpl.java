package com.bookshop01.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.customer.dao.CustomerDAO;
import com.bookshop01.customer.vo.NoticeVO;



@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDAO customerDAO;

    @Override
    public Map<String, List> NoticeList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> noticeMap = new HashMap<String, List>();
        
        List<NoticeVO> noticeList = customerDAO.NoticeList(startRowNum, endRowNum);
        noticeMap.put("noticeList", noticeList);
        
        return noticeMap;
    }

    public List selectNoticeDetail(String notice_id) throws Exception{
		return customerDAO.selectNoticeDetail(notice_id);
	}

    
    @Override
    public List<String> keywordSearch(String keyword) {
        return customerDAO.KeywordSearch(keyword);
    }

}