package com.bob.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bob.customer.vo.QnaVO;
import com.bob.customer.vo.ReviewVO;
import com.bob.member.vo.MemberVO;
import com.bob.mypage.dao.MyPageDAO;
import com.bob.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl  implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception{
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}
	
	public List findMyOrderInfo(String order_id) throws Exception{
		return myPageDAO.selectMyOrderInfo(order_id);
	}
	
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception{
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 myPageDAO.updateMyInfo(memberMap);
		 return myPageDAO.selectMyDetailInfo(member_id);
	}
	
	public void cancelOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderCancel(order_id);
	}
	
	public MemberVO myDetailInfo(String member_id) throws Exception{
		return myPageDAO.selectMyDetailInfo(member_id);
	}
	
	public void updateDel_yn(String member_id) throws Exception{
		myPageDAO.updateDel_yn(member_id);
	}
	
	@Override
    public Map<String, List> myQnaList(String member_id, String startRowNum, String endRowNum) throws Exception {
        Map<String, List> qnaMap = new HashMap<String, List>();
        
        List<QnaVO> qnaList = myPageDAO.myQnaList(member_id, startRowNum, endRowNum);
        qnaMap.put("qnaList", qnaList);
        
        return qnaMap;
    }
    
    public List selectQnaDetail(String qna_id) throws Exception{
		return myPageDAO.selectQnaDetail(qna_id);
	}
    
    @Override
	public int addQna(Map newQnaMap) throws Exception{
		int qna_id = myPageDAO.insertQna(newQnaMap);
		return qna_id;
	}
	
    public List<ReviewVO> reviewList() throws Exception{
		return myPageDAO.reviewList();
	}
}
