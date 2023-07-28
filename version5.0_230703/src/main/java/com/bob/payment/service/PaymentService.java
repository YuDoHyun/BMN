package com.bob.payment.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.api.service.ApiService;

@Service
public class PaymentService {
	
	@Autowired
	private ApiService apiService;
	
	public Map<String, String> keyin(Map<String, String> receiverMap){
		
		//Ctrl + Shift + O(영어) 임포트 자동완성
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		//API 연동 소스 작성 예정
		
		//rest api 연동을 할 예정
		//라이브러리를 사용해서 연동
		
		String orderNumber = ""; //주문번호
		String cardNo = "";      //카드번호
		String expireMonth = ""; //유효기간(월) 2자리 MM
		String expireYear = "";  //유효기간(년) 2자리 YY
		String birthday = "";	 //생년월일
		String cardPw = "";		 //카드비밀번호 2자리
		String amount = "";		 //결제금액
		String quota = "";		 //할부기간 0~24
		String itemName = "";    //상품명
		String userName = "";	 //구매자명
		String signature = "";	 //서명값
		String timestamp = "";	 //타임스탬프 YYYYMMDDHHMMSS형식
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";  //인증키값
		
		// 보내야 되는 값 셋팅 예정
//		receiverMap.get("cardNo"); // >> 화면에서 입력한 카드번호 ( Input에 입력한 값 )
		
		orderNumber = "TEST1234";
		cardNo = receiverMap.get("cardNo");
		expireMonth = receiverMap.get("expireMonth");
		expireYear = receiverMap.get("expireYear");
		birthday = receiverMap.get("birthday");
		cardPw = receiverMap.get("cardPw");
		amount = "1000";
		quota = "0";
		itemName = "TEST아이템";
		userName = "테스터";
		timestamp = "20230531010112";
		
		//암호화해서 생성해야함.
		try {
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//
		
		//paramMap은 요청값들이 담길 맵
		Map<String, String> paramMap = new HashMap<String, String>();
		
		//요청 주소
		String url ="https://api.testpayup.co.kr/v2/api/payment/himedia/keyin2";
		
		paramMap.put("orderNumber", orderNumber);
		paramMap.put("cardNo", cardNo);
		paramMap.put("expireMonth", expireMonth);
		paramMap.put("expireYear", expireYear);
		paramMap.put("birthday", birthday);
		paramMap.put("cardPw", cardPw);
		paramMap.put("amount", amount);
		paramMap.put("quota", quota);
		paramMap.put("itemName", itemName);
		paramMap.put("userName", userName);
		paramMap.put("signature", signature);
		paramMap.put("timestamp", timestamp);
		
		//apiService.restApi("여기에는 요청 값을", "여기에는 URL");
		resultMap = apiService.restApi(paramMap, url);
		
		System.out.println( "결제 승인 API 통신 결과 = " + resultMap.toString() );
		
		//연동 결과
		
		return resultMap;
	}
	
	//카카오 주문 하는 기능
	public Map<String, String> kakaoOrder(Map<String, String> receiverMap){
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		//API 통신
		//카카오 3.1 주문요청
		
		//요청 데이터 설정
		String orderNumber = ""; //주문번호
		String userAgent = "";   //PC인가
		String amount = "";		 //결제금액
		String itemName = "";    //상품명
		String userName = "";	 //구매자명
		String returnUrl = "";
		String signature = "";	 //서명값
		String timestamp = "";	 //타임스탬프 YYYYMMDDHHMMSS형식
		String certKey = "ac805b30517f4fd08e3e80490e559f8e";  //인증키값
		
		orderNumber = "TEST_ORDER";
		userAgent = "WP";
		amount = "100"; //실결제 됩니다. 금액 크게하면 안되요
		itemName = "강의테스트";
		userName = "kevin";
		returnUrl = "test"; //이거는 아무값이나 넣어도 됩니다.
		timestamp = "20230601105020";
		
		//암호화해서 생성해야함.
		try {
			signature = encrypt("himedia|"+orderNumber+"|"+amount+"|"+certKey+"|"+timestamp);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//
		
		
		// apiService.restApi("요청하는 값", "주소") 실행하는 코드 생성
		//paramMap은 요청값들이 담길 맵
		Map<String,String> paramMap = new HashMap<String, String>();
		//요청 주소
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/order";
		paramMap.put("orderNumber",orderNumber);
		paramMap.put("userAgent",userAgent);
		paramMap.put("amount",amount);
		paramMap.put("itemName",itemName);
		paramMap.put("userName",userName);
		paramMap.put("returnUrl",returnUrl);
		paramMap.put("amount",amount);
		paramMap.put("timestamp",timestamp);
		paramMap.put("signature",signature);
		
		resultMap = apiService.restApi(paramMap, url);
				
				
		//연동 결과
		System.out.println("카카오 주문 API 통신 결과 = " + resultMap.toString());
//		카카오 주문 API 통신 결과 = {good_mny=100, site_cd=A8QOB, Ret_URL=test, 
//		affiliaterCode=0005, buyr_name=kevin, ordr_idxx=20230601110421KK0277, 
//		good_name=강의테스트, responseCode=0000, responseMsg=성공}
		
		
		return resultMap;
	}
	
	//카카오 승인 요청
	public Map<String, String> kakaoPay(Map<String, String> receiverMap) throws Exception{
		
		Map<String, String> resultMap = new HashMap<String, String>();
		
		
		//3.3 승인요청 전문 보고 아래소스 완성
		//receiverMap 여기안에 인증데이터 있음
		
		String url = "https://api.testpayup.co.kr/ep/api/kakao/himedia/pay";
		
		resultMap = apiService.restApi(receiverMap, url);
		
		System.out.println("카카오 API 승인 결과 = " + resultMap.toString());
//		{amount=100, orderNumber=TEST_ORDER, type=KAKAO_MONEY, authDateTime=20230601151029, 
//		cashReceipt=100, transactionId=20230601151001KK0644, responseCode=0000, responseMsg=정상처리}
		
		return resultMap;
		
	}
	
	
	
	
	
	
	
	public String encrypt(String text) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(text.getBytes());
        return bytesToHex(md.digest());
    }
    private String bytesToHex(byte[] bytes) {
        StringBuilder builder = new StringBuilder();
        for (byte b : bytes) {
            builder.append(String.format("%02x", b));
        }
        return builder.toString();
    }
}
