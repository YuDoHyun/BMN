package com.bookshop01.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.payment.service.PaymentService;

@Controller
public class PaymentController2 
{
	@Autowired
	private PaymentService paymentService ;
	
	@RequestMapping( value = "/payment/kakao/pay.do" ) 
	public ModelAndView kakaoPay ( @RequestParam Map<String, String> receiverMap ) throws Exception
	{
		ModelAndView mav = new ModelAndView() ;
		
		System.out.println( "인증 데이터 확인 = " + receiverMap.toString() );

		Map<String, String> resultMap = new HashMap<String, String>() ;
		
		resultMap = paymentService.kakaoPay(receiverMap) ;

		// resultMap 에 승인 결과 내용이 담겨있다.
		
		String responseCode = resultMap.get( "responseCode") ;
		//String responseCode = "0000" ;
		
		if ( "0000".equals(responseCode) )
		{
			// 승인 완료
			
			// 어떤 페이지로 갈 지 설정
			mav.setViewName( "/payment/kakaoS" ) ; // tiles 설정으로 감
			
			// 결제성공관련 데이터 넣어서
			mav.addObject("amount", resultMap.get("amount"));
			
			mav.addObject("kakaoData", resultMap ) ;
			//amount=100, orderNumber=Test_Oreder, type=KAKAO_MONEY, authDateTime=20230601164714, 
			//cashReceipt=100, transactionId=20230601164655KK0750, responseCode=0000, responseMsg=정상처리
			
		} else
		{
			// 승인 실패
			mav.setViewName( "/payment/kakaoF" ) ;
		}
		
		return mav ;
		
	}
	
		
}
