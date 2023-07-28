package com.bob.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bob.payment.service.PaymentService;

@Controller
public class PaymentController2 {
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping(value="/payment/kakao/pay.do")
	public ModelAndView kakaoPay(@RequestParam Map<String, String> receiverMap) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		
		resultMap = paymentService.kakaoPay(receiverMap);
		System.out.println("인증 데이터 확인 = " + resultMap.toString());
		//{amount=100, orderNumber=TEST_ORDER, type=KAKAO_MONEY, authDateTime=20230601164058, cashReceipt=100, transactionId=20230601164036KK0733, responseCode=0000, responseMsg=정상처리}
		
		//resultMap 승인 결과 내용이 담겨있습니다.
		
		String responseCode = resultMap.get("responseCode");
		if("0000".equals(responseCode)) {
			//승인완료
			
			//어떤 페이지로 갈지
			mav.setViewName("/payment/kakaoS"); //tiles 설정으로 감
			
			//결제성공관련 데이터 넣어서
//			mav.addObject("amount", receiverMap.get("amount"));
//			mav.addObject("authDateTime", receiverMap.get("authDateTime"));
//			mav.addObject("type", receiverMap.get("type"));
			
			//결과창 통으로넣기
			mav.addObject("kakaoData", resultMap);
		}else {
			//승인실패
			mav.setViewName("/payment/kakaoF");
		}
		
		return mav;
	}
}
