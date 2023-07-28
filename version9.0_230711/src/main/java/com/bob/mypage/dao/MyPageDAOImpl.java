package com.bob.mypage.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bob.customer.vo.QnaVO;
import com.bob.member.vo.MemberVO;
import com.bob.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException{
		List<OrderVO> orderGoodsList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList",member_id);
		return orderGoodsList;
	}
	
	public List selectMyOrderInfo(String order_id) throws DataAccessException{
		List myOrderList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderInfo",order_id);
		return myOrderList;
	}	

	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException{
		List<OrderVO> myOrderHistList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList",dateMap);
		return myOrderHistList;
	}
	
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",member_id);
		return memberVO;
		
	}
	
	public void updateMyOrderCancel(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderCancel",order_id);
	}
	
	public void updateDel_yn(String member_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateDel_yn",member_id);
	}
	
	@Override
	public List<QnaVO> myQnaList(String member_id, String startRowNum, String endRowNum) throws DataAccessException {
		QnaVO qnaVO = new QnaVO();
		qnaVO.setMember_id(member_id);
		qnaVO.setStartRowNum(startRowNum);
		qnaVO.setEndRowNum(endRowNum);
	    
	    List<QnaVO> qnaList = sqlSession.selectList("mapper.mypage.myQnaList", qnaVO);
	    return qnaList;
	}
	
	public List selectQnaDetail(String qna_id) throws DataAccessException{
		List selectQna=(List)sqlSession.selectList("mapper.mypage.selectQnaDetail",qna_id);
		return selectQna;
	}
	
	@Override
	public int insertQna(Map newQnaMap) throws DataAccessException {
		sqlSession.insert("mapper.mypage.insertQna",newQnaMap);
		return (Integer)newQnaMap.get("qna_id");
	}
}
