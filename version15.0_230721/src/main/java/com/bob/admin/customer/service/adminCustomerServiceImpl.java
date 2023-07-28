package com.bob.admin.customer.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.admin.customer.dao.adminCustomerDAO;
import com.bob.customer.vo.FaqVO;
import com.bob.customer.vo.NoticeVO;
import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;



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
    public List<NoticeVO> NoticekeywordSearch(String keyword, String startRowNum, String endRowNum) {
        return adminCustomerDAO.NoticeKeywordSearch(keyword, startRowNum, endRowNum);
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
    public List<String> FaqkeywordSearch(String keyword, String startRowNum, String endRowNum) {
        return adminCustomerDAO.FaqKeywordSearch(keyword, startRowNum, endRowNum);
    }
    
    //Q&A
    @Override
    public Map<String, List> QnaList(String startRowNum, String endRowNum) throws Exception {
        Map<String, List> qnaMap = new HashMap<String, List>();
        
        List<QnaVO> qnaList = adminCustomerDAO.QnaList(startRowNum, endRowNum);
        qnaMap.put("qnaList", qnaList);
        
        return qnaMap;
    }

    public List selectQnaDetail(String qna_id) throws Exception{
		return adminCustomerDAO.selectQnaDetail(qna_id);
	}
    
    @Override
	public void modifyQna(Map qnaMap) throws Exception{
    	adminCustomerDAO.modifyQna(qnaMap);
	}	
    
    @Override
    public List<String> QnakeywordSearch(String keyword, String startRowNum, String endRowNum) {
        return adminCustomerDAO.QnaKeywordSearch(keyword, startRowNum, endRowNum);
    }
    
    
    //Review
	@Override
	public Map<String, List> ReviewList(String startRowNum, String endRowNum) throws Exception {
	    Map<String, List> reviewMap = new HashMap<String, List>();
	    
	    List<ReviewVO> reviewList = adminCustomerDAO.ReviewList(startRowNum, endRowNum);
	    reviewMap.put("reviewList", reviewList);
	    
	    return reviewMap;
	}
	
	public List selectReviewDetail(String review_id) throws Exception{
		return adminCustomerDAO.selectReviewDetail(review_id);
	}
	
	@Override
	public void modifyReview(Map reviewMap) throws Exception{
		adminCustomerDAO.modifyReview(reviewMap);
	}	
	
	@Override
    public List<ReviewVO> ReviewkeywordSearch(String keyword, String startRowNum, String endRowNum) {
        return adminCustomerDAO.ReviewKeywordSearch(keyword, startRowNum, endRowNum);
    }
    
    
}