package com.bob.admin.member.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bob.admin.goods.dao.AdminGoodsDAO;
import com.bob.admin.member.dao.AdminMemberDAO;
import com.bob.goods.vo.GoodsVO;
import com.bob.goods.vo.ImageFileVO;
import com.bob.member.vo.MemberVO;
import com.bob.order.vo.OrderVO;


@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception{
		return adminMemberDAO.listMember(condMap);
	}

	public MemberVO memberDetail(String member_id) throws Exception{
		 return adminMemberDAO.memberDetail(member_id);
	}
	
	public void  modifyMemberInfo(HashMap memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 adminMemberDAO.modifyMemberInfo(memberMap);
	}
}
