package com.bookshop01.payment.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop01.api.service.ApiService;

@Service
public class PaymentService 
{
	@Autowired
	private ApiService apiService ;
	
	public Map< String, String > keyin( Map< String, String > receiverMap )
	{
		// ctrl + shift + o   => import 자동완성
		
		Map< String, String > resultMap = new HashMap< String, String >() ;
		
		// API 연동 소스 작성 예정
		
		// rest api 연동 할 예정
		// 라이브러리를 사용해서 연동
		
		String orderNumber = "";
		String cardNo = "";
		String expireMonth = "";
		String expireYear = "";
		String birthday = "";
		String cardPw = "";
		String amount = "";
		String quota = "";
		String itemName = "";
		String userName = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e" ;
		
		// 보내야되는 값 세팅 예정
		// receiverMap.get( "cardNo" ) ; => 화면에서 입력한 카드번호 받아옴
		orderNumber = "Test1234" ;
		cardNo = receiverMap.get( "cardNo" ) ;
		expireMonth = receiverMap.get( "expireMonth" ) ;
		expireYear = receiverMap.get( "expireYear" ) ;
		birthday = receiverMap.get( "birthday" ) ;
		cardPw = receiverMap.get( "cardPw" ) ;
		amount = "1000" ;
		quota = "0" ;
		itemName = "책" ;
		userName = "정동진" ;
		timestamp = "202305311544" ;
		
		//signature 암호화해서 생성해야함
		try 
		{
			signature = encrypt( "himedia|" + orderNumber + "|" + amount + "|" + certKey + "|" + timestamp ) ;
		} catch ( NoSuchAlgorithmException e )
		{
			e.printStackTrace() ;
		}
		
		// paramMap은 요청값들이 담길 맵
		Map<String, String> paramMap = new HashMap<String, String>() ;
		
		// 요청 주소
		String url = "https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2" ;
		
		
		paramMap.put( "orderNumber", orderNumber ) ;
		paramMap.put( "cardNo", cardNo ) ;
		paramMap.put( "expireMonth", expireMonth ) ;
		paramMap.put( "expireYear", expireYear ) ;
		paramMap.put( "birthday", birthday ) ;
		paramMap.put( "cardPw", cardPw ) ;
		paramMap.put( "amount", amount ) ;
		paramMap.put( "quota", quota ) ;
		paramMap.put( "itemName", itemName ) ;
		paramMap.put( "userName", userName ) ;
		paramMap.put( "signature", signature ) ;
		paramMap.put( "timestamp", timestamp ) ;

		resultMap = apiService.restApi( paramMap, url ) ;
		
				
		// 연동결과
		System.out.println( "결제 승인 API 통신 결과 = " + resultMap.toString() ) ;
		
		
		return resultMap ;
	}
	
	// 카카오 주문 하는 기능
	public Map<String,String> kakaoOrder( Map<String,String> receiverMap )
	{
		Map<String,String> resultMap = new HashMap<String,String>() ;
		
		
		// API 통신
		// 카카오 3.1 주문요청
		
		String orderNumber = "";
		String userAgent = "";
		String amount = "";
		String itemName = "" ;
		String userName = "";
		String returnUrl = "";
		String signature = "";
		String timestamp = "";
		String certKey = "ac805b30517f4fd08e3e80490e559f8e" ;
		
		// 실제로는 receiverMap 으로 받아와야하지만 연동되어있지 않아서 임의로 입력
		
		orderNumber = "Test_Oreder" ;
		userAgent = "WP" ;
		amount = "100" ; //실결제 됩니다.
		itemName = "강의테스트" ;
		userName = "kim" ;
		returnUrl = "test" ; // 아무값이나 가능
		timestamp = "202306011111";
		
		// 암호화 생성
		try 
		{
			signature = encrypt( "himedia|" + orderNumber + "|" + amount + "|" + certKey + "|" + timestamp ) ;
		} catch ( NoSuchAlgorithmException e )
		{
			e.printStackTrace() ;
		}
		
		// paramMap은 요청값들이 담길 맵
		Map<String, String> paramMap = new HashMap<String, String>() ;
		
		// 요청 주소
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/order" ;
		
		// apiService.restApi("요청하는 값", "주소" )  => 실행하는 코드 생성
		paramMap.put("orderNumber", orderNumber ) ;
		paramMap.put("userAgent", userAgent ) ;
		paramMap.put("amount", amount ) ;
		paramMap.put("itemName", itemName ) ;
		paramMap.put("userName", userName ) ;
		paramMap.put("returnUrl", returnUrl ) ;
		paramMap.put("timestamp", timestamp ) ;
		paramMap.put( "signature", signature ) ;
		
		resultMap = apiService.restApi( paramMap, url ) ;
		
		// 연동결과
		System.out.println( "카카오 주문 API 통신 결과 = " + resultMap.toString() ) ;
		
//		카카오 주문 API 통신 결과 = {good_mny=100, site_cd=A8QOB, Ret_URL=test, affiliaterCode=0005, 
//				buyr_name=kim, ordr_idxx=20230601110651KK0280, 
//				good_name=강의테스트, responseCode=0000, responseMsg=성공}
		
		return resultMap ; 
		
	}
	
	// 카카오 승인 요청
	public Map<String,String> kakaoPay( Map<String,String> receiverMap )
	{
		
		Map<String,String> resultMap = new HashMap<String,String>() ;
		
		// 3.3 승인요청 전문 보고 소스 완성하기
		
		String res_cd = "";
		String enc_info = "";
		String enc_data = "";
		String card_pay_method = "" ;
		String ordr_idxx = "";

		
		res_cd = receiverMap.get("res_cd") ;
		enc_info = receiverMap.get("enc_info") ;
		enc_data = receiverMap.get("enc_data") ;
		card_pay_method = receiverMap.get("card_pay_method") ;
		ordr_idxx = receiverMap.get("ordr_idxx") ;
		
		// paramMap은 요청값들이 담길 맵
		Map<String, String> paramMap = new HashMap<String, String>() ;
		
		// 요청 주소
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay" ;
		
		// apiService.restApi("요청하는 값", "주소" )  => 실행하는 코드 생성
		paramMap.put("res_cd", res_cd ) ;
		paramMap.put("enc_info", enc_info ) ;
		paramMap.put("enc_data", enc_data ) ;
		paramMap.put("card_pay_method", card_pay_method ) ;
		paramMap.put("ordr_idxx", ordr_idxx ) ;
		
		resultMap = apiService.restApi( paramMap, url ) ;
		
		System.out.println( "카카오 승인요청 API 통신 결과 = " + resultMap.toString() ) ;
		
		return resultMap ; 
		
	}

	
	
	public String encrypt(String text) throws NoSuchAlgorithmException 
	{
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());
        return bytesToHex(md.digest());
    }
	
    private String bytesToHex(byte[] bytes) 
    {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) 
        {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
}
