<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

// 주소 선택
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('roadAddress').value = fullRoadAddr;
      document.getElementById('jibunAddress').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }
      
     
    }
  }).open();
}

// 아이디 중복확인
function fn_overlapped(){
    var _id=$("#_member_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/member/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_member_id').prop("disabled", true);
       	    $('#member_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
<script>
// 휴대전화 입력시 -(하이픈)자동생성
const phone= document.getElementById('phone');
phone.addEventListener('input', function (e) {
  // 입력값에서 하이픈을 제거합니다.
  const phoneNumber = e.target.value.replace(/-/g, '');

  // 하이픈을 추가할 위치를 결정합니다.
  let formattedNumber = '';
  if (phoneNumber.length > 3) {
    formattedNumber += phoneNumber.substr(0, 3);
    if (phoneNumber.length > 7) {
      formattedNumber += '-' + phoneNumber.substr(3, 4) + '-' + phoneNumber.substr(7);
    } else {
      formattedNumber += '-' + phoneNumber.substr(3);
    }
  } else {
    formattedNumber = phoneNumber;
  }

  // 입력값에 하이픈을 추가하여 설정합니다.
  e.target.value = formattedNumber;
});
</script>
</head>
<body>
<div id="Container">
	<div id="contents">
		<div id="titleArea" class="pageTitle2">
			<h2>JOIN US</h2>
		</div>
		<div class="member-join">
			<form class="joinform" name="joinform" action="${contextPath}/member/addMember.do" method="post">
				<div class="joinWrap">
					<div>
						<table>
							<caption>회원 기본정보</caption>
							<tbody>
								<tr class="idCheck">
									<th scope="row" class="va-t">
										<div class="mt10">아이디 *</div>						
									</th>
									<td>
										<div>
											<input type="text" name="_member_id"  id="_member_id" />
											<input type="hidden" name="member_id"  id="member_id" />
											<input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
										</div>
										<p class="msg">* 아이디를 입력하세요</p>
									</td>
								</tr>
								<tr>
									<th>
										<div class="mt10">비밀번호 *</div>
									</th>
									<td>
										<input name="member_pw" type="password" placeholder="최소 10자 ~ 최대 16자" autocomplete="off"/>
										<p class="msg">* 비밀번호를 입력하세요</p>
									</td>
								</tr>
								<tr>
									<th scope="row" class="titleName">
										<div class="mt10">이름 *</div>						
									</th>
									<td>
										<input type="text" name="name" id="name" />
									</td>
								</tr>
								<tr class="">
									<th scope="row" class="">
										<div class="mt10">성별 *</div>
									</th>
									<td>
										<label for="add1__0" style="white-space:nowrap;">
											<input name="gender" type="radio" value="male" autocomplete="off"/>
											여
										</label>
										<label for="add2__0" style="white-space:nowrap;">
											<input name="gender" type="radio" value="female" autocomplete="off"/>
											남
										</label>
									</td>
								</tr>
								<tr>
									<th>
										<div class="mt10">생년월일 *</div>
									</th>
									<td>
										<input id="" name="add1" type="text" autocomplete="off"/>
										년
										<input id="" name="add2" type="text" autocomplete="off"/>
										월
										<input id="" name="add2" type="text" autocomplete="off"/>
										일
									</td>
								</tr>
								<tr>
									<th scope="row">
										<div class="mt10">휴대전화 *</div>						
									</th>
									<td>
										<input id="phone" type="text" name="phone" placeholder="번호를 입력하세요">
										<br>
										<input type="checkbox"	name="smssts_yn" value="Y" checked />
										밥먹냥에서 발송하는 SMS 소식을 수신합니다.
									</td>							
								</tr>
								<tr class="email">
									<th scope="row">
										<div class="mt10">이메일 *</div>						
									</th>
									<td>
										<input id="email1" type="text" name="email1" /> @ <input id="email2" type="text" name="email2" /> 
										<select name="email2" onChange="" title="직접입력">
												<option value="non">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="nate.com">nate.com</option>
												<option value="google.com">gmail.com</option>
												<option value="daum.com">kakao.com</option>
										</select>
										<br>
										<input type="checkbox" name="emailsts_yn" value="Y" checked />
										쇼핑몰에서 발송하는 e-mail을 수신합니다.
									</td>
								</tr>
								<tr class="address">
									<th scope="row">
										<div class="mt10">주소 *</div>						
									</th>
									<td>
										<input type="text" id="zipcode" name="zipcode"> <a href="javascript:execDaumPostcode()">우편번호검색</a>
										<br>
										<p> 
											지번 주소<br><input type="text" id="roadAddress"  name="roadAddress"><br>
											도로명 주소<br><input type="text" id="jibunAddress" name="jibunAddress"><br>
											나머지 주소<br><input type="text"  name="namujiAddress"/>
										</p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>