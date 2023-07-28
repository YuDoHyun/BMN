package com.bob.customer.service;

import java.util.List;
import java.util.Map;

import com.bob.customer.vo.NoticeVO;

public interface CustomerService {
	//공지사항
	public Map<String ,List> NoticeList(String startRowNum, String endRowNum) throws Exception;
	public List selectNoticeDetail(String notice_id) throws Exception;
    public List<String> NoticekeywordSearch(String keyword);
    
    //FAQ
    public Map<String ,List> FaqList(String startRowNum, String endRowNum) throws Exception;
	public List selectFaqDetail(String faq_id) throws Exception;
    public List<String> FaqKeywordSearch(String keyword, String startRowNum, String endRowNum);
    
    //Q&A
    public Map<String ,List> QnaList(String startRowNum, String endRowNum) throws Exception;
    public List selectQnaDetail(String qna_id) throws Exception;
    public int addQna(Map newQnaMap) throws Exception;
    
    //REVIEW
    public Map<String ,List> ReviewList(String startRowNum, String endRowNum) throws Exception;
    public Map<String, List> reviewWriteFile(String goods_id) throws Exception;
    public List selectReviewDetail(String review_id) throws Exception;
    public int addReview(Map newReviewMap) throws Exception;
}