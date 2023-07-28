package com.bookshop01.admin.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.admin.customer.dao.adminCustomerDAO;
import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;



@Service("adminCustomerService")
public class adminCustomerServiceImpl implements adminCustomerService {
    @Autowired
    private adminCustomerDAO adminCustomerDAO;

    //공지사항
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
    public List<String> NoticekeywordSearch(String keyword) {
        return adminCustomerDAO.NoticeKeywordSearch(keyword);
    }

    
    //FAQ
    @Override
    public Map<String, List> FaqList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> faqMap = new HashMap<String, List>();
        
        List<FaqVO> faqList = adminCustomerDAO.FaqList(startRowNum, endRowNum);
        faqMap.put("faqList", faqList);
        
        return faqMap;
    }

    public List selectFaqDetail(String faq_id) throws Exception{
		return adminCustomerDAO.selectFaqDetail(faq_id);
	}
    
    @Override
	public void modifyFaq(Map faqMap) throws Exception{
    	adminCustomerDAO.modifyFaq(faqMap);
	}	
    
    @Override
	public void deleteFaq(String faq_id) throws Exception{
    	adminCustomerDAO.deleteFaq(faq_id);
	}	
    
    @Override
	public void addFaq(FaqVO faqVO) throws Exception{
    	adminCustomerDAO.insertFaq( faqVO );
	}
    
    @Override
    public List<String> FaqkeywordSearch(String keyword) {
        return adminCustomerDAO.FaqKeywordSearch(keyword);
    }
}