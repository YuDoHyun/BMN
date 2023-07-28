package com.bob.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.customer.dao.CustomerDAO;
import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;
import com.bob.goods.vo.ImageFileVO;



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
    public List<String> FaqKeywordSearch(String keyword, String startRowNum, String endRowNum) {
        return customerDAO.FaqKeywordSearch(keyword, startRowNum, endRowNum);
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
    
    @Override
	public int addQna(Map newQnaMap) throws Exception{
		int qna_id = customerDAO.insertQna(newQnaMap);
		return qna_id;
	}
    
    //Review
    @Override
    public Map<String, List> ReviewList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> reviewMap = new HashMap<String, List>();
        
        List<ReviewVO> reviewList = customerDAO.ReviewList(startRowNum, endRowNum);
        reviewMap.put("reviewList", reviewList);
        
        return reviewMap;
    }
    
    @Override
    public Map<String, List> reviewWriteFile(String goods_id) throws Exception{
    	Map<String, List> reviewMap = new HashMap<String, List>();
    	
    	List<ImageFileVO> reviewWriteFile = customerDAO.reviewWriteFile(goods_id);
    	reviewMap.put("reviewWriteFile", reviewWriteFile);
    	
		return reviewMap;
    }
    
    public List selectReviewDetail(String review_id) throws Exception{
		return customerDAO.selectReviewDetail(review_id);
	}
    
    @Override
	public int addReview(Map newReviewMap) throws Exception{
		int review_id = customerDAO.insertReview(newReviewMap);
		return review_id;
    }

}