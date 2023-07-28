<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:if test='${not empty message }'>

<script>
window.onload=function()
{
  result();
}

function result(){
	alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}
</script>

</c:if>
</head>
<body>
<div id="Container">
	<div id="contents">
		<div id="titleArea" class="pageTitle1">
			<h2>LOGIN</h2>
		</div>
		<form action="${contextPath}/member/login.do" method="post">
			<div class="loginWrap">
				<filedset>
					<div class="formBox">
						<div class="form">						
							<dl>
								<dt>로그인</dt>
								<dd>
									<input name="member_id" fw-filter="isFill" fw-label="아이디" type="text"/>
								</dd>
							</dl>
							<dl>
								<dt>비밀번호</dt>
								<dd>
									<input name="member_pw" type="password" size="20" />
								</dd>
							</dl>
						</div>
						<div class="loginBtn">
							<input class="submitBtn" type="submit" value="로그인"> 
						</div>
						<div class="clear"></div>
						<div class="loginUtil">
							<div>
							   <a href="#">아이디 찾기</a>
							   <a href="#">비밀번호 찾기</a>
						  	</div>
						  	<div>
							   <a href="#">비회원 주문조회</a>
						   </div>
					  	</div>
					  	<div class="snsLogin">	
							<a class="naverBtn" href="javascript:kakaoLogin();">
								<span>카카오로 시작하기</span>
							</a>
							<a href="${contextPath}/member/memberForm.do">회원가입</a>
						</div>		   							
						
					</div>
				</filedset>
			</div>
		</form>
	</div>
</div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("78043f0e0163452bfd6915fc3ef926a6");
function kakaoLogin() {
	window.Kakao.Auth.login({
		scope : 'profile, account-email, gender',
		success: function(authObj){
			console.log(authObj);
			window.Kakao.API.request({
				url:'/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				} 
			});
		}
	});
}
</script>
</body>
</html>