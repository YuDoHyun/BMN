package com.bookshop01.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.customer.dao.CustomerDAO;
import com.bookshop01.customer.vo.FaqVO;
import com.bookshop01.customer.vo.NoticeVO;
import com.bookshop01.customer.vo.QnaVO;



@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDAO customerDAO;

    //공지사항
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
    public List<String> NoticekeywordSearch(String keyword) {
        return customerDAO.NoticeKeywordSearch(keyword);
    }

    
    //FAQ
    @Override
    public Map<String, List> FaqList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> faqMap = new HashMap<String, List>();
        
        List<FaqVO> faqList = customerDAO.FaqList(startRowNum, endRowNum);
        faqMap.put("faqList", faqList);
        
        return faqMap;
    }

    public List selectFaqDetail(String faq_id) throws Exception{
		return customerDAO.selectFaqDetail(faq_id);
	}

    
    @Override
    public List<String> FaqkeywordSearch(String keyword) {
        return customerDAO.FaqKeywordSearch(keyword);
    }
    
    
    //Q&A
    @Override
    public Map<String, List> QnaList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> qnaMap = new HashMap<String, List>();
        
        List<QnaVO> qnaList = customerDAO.QnaList(startRowNum, endRowNum);
        qnaMap.put("qnaList", qnaList);
        
        return qnaMap;
    }
    
    public List selectQnaDetail(String qna_id) throws Exception{
		return customerDAO.selectQnaDetail(qna_id);
	}

}