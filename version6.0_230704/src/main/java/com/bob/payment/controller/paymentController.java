package com.bob.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bob.payment.service.PaymentService;

// @controller 랑 @RestController 는 다름
@RestController
public class paymentController
{
	@Autowired
	private PaymentService paymentService ;
	
	
	// 카카오페이
	@RequestMapping( value = "/payment/kakao/order.do" ) 
	public Map<String, String> kakaoOrder( @RequestParam Map<String, String> receiverMap ) throws Exception
	{
		Map<String, String> resultMap = new HashMap<String, String>() ;
		
		// 제대로 들어오는지 확인
		System.out.println( "kakaoOrder 확인" ) ;
		
		// 주문 API를 쓴 다음
		// resultMap 주문 결과를 넣음
		
		resultMap = paymentService.kakaoOrder( receiverMap ) ;
		
		// 결과가 제대로 나가는지 테스트 데이터
		//resultMap.put( "test", "test값") ;
		
		return resultMap ;
	}
	
	// 네이버페이, 포인트
		@RequestMapping( value = "/payment/naver/order.do" ) 
		public Map<String, String> naverOrder( @RequestParam Map<String, String> receiverMap ) throws Exception
		{
			Map<String, String> resultMap = new HashMap<String, String>() ;
			
			// 제대로 들어오는지 확인
			System.out.println( "naverOrder 확인" ) ;
			
			// 주문 API를 쓴 다음
			// resultMap 주문 결과를 넣음
			
			resultMap = paymentService.naverOrder( receiverMap ) ;
			
			// 결과가 제대로 나가는지 테스트 데이터
			//resultMap.put( "test", "test값") ;
			
			return resultMap ;
		}
		
	
		
}
