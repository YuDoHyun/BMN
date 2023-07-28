package com.bookshop01.main;

import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class MainControllerTest {
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/main/test.do")
	public String test(@RequestParam Map<String, String> receiverMap)  throws Exception{
		
		
		Map<String,String> map = sqlSession.selectOne("mapper.test.select", "");
		
		
		System.out.println(map.toString());
		
		return "";
	}
	
}