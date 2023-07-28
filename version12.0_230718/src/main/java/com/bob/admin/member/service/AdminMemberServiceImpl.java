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
	
	@Override
	public List<String> memberSearch(String type, String keyword) {
	    String str = "";

	    if (type.equals("all")) {
	        str = "member_id LIKE #{keyword} OR member_name LIKE #{keyword} OR hp1 LIKE #{keyword} OR hp2 LIKE #{keyword} OR hp3 LIKE #{keyword} OR roadaddress LIKE #{keyword} OR jibunaddress LIKE #{keyword} OR namujiaddress LIKE #{keyword} ORDER BY member_id DESC";
	    } else if (type.equals("member_name")) {
	        str = "member_name LIKE #{keyword} ORDER BY member_id DESC";
	    } else if (type.equals("member_id")) {
	        str = "member_id LIKE #{keyword} ORDER BY member_id DESC";
	    } else if (type.equals("member_hp_num")) {
	        str = "hp1 LIKE #{keyword} OR hp2 LIKE #{keyword} OR hp3 LIKE #{keyword} ORDER BY member_id DESC";
	    } else if (type.equals("member_addr")) {
	        str = "roadaddress LIKE #{keyword} OR jibunaddress LIKE #{keyword} OR namujiaddress LIKE #{keyword} ORDER BY member_id DESC";
	    }

	    return adminMemberDAO.memberSearch(str, keyword);
	}
}
