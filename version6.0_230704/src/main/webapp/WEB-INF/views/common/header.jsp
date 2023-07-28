<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/goods/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
	
	function displayResult(jsonInfo){
		var count = jsonInfo.keyword.length;
		if(count > 0) {
		    var html = '';
		    for(var i in jsonInfo.keyword){
			   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
		    }
		    var listView = document.getElementById("suggestList");
		    listView.innerHTML = html;
		    show('suggest');
		} else{
		    hide('suggest');
		} 
	}
	
	function select(selectedKeyword) {
		 document.frmSearch.searchWord.value=selectedKeyword;
		 loopSearch = false;
		 hide('suggest');
	}
		
	function show() {
		  document.getElementById("search").style.display ='block';
	}
	
	function hide(){
		  document.getElementById("search").style.display ='none';
	}
	
	function showHide(){
        if(document.getElementById("search").style.display =='none') {
            document.getElementById("search").style.display ='block';
        }
        else{
            document.getElementById("search").style.display ='none';
        }
    }
	

</script>
<body>
<nav class="navbar">
	<div class="navbar__logo">
        <a href="${contextPath}/main/main.do">
        	<i class="fa-solid fa-paw"></i>&nbsp;밥멍냥
        </a>
	</div>
	<c:choose>
	<c:when test="${side_menu=='admin_mode' }">
	   <ul class="navbar__menu">
			<li><a href="${contextPath}/admin/goods/adminGoodsMain.do">상품관리</a></li>
			<li><a href="${contextPath}/admin/order/adminOrderMain.do">주문관리</a></li>
			<li><a href="${contextPath}/admin/member/adminMemberMain.do">회원관리</a></li>
			<li><a href="${contextPath}/admin/customer/adminNoticeMain.do">게시판관리</a></li>
		</ul>
	</c:when>
	<c:when test="${side_menu=='my_page' }">
		<ul class="navbar__menu">
			<li><a href="${contextPath}/mypage/listMyOrderHistory.do">주문내역/배송 조회</a></li>
			<li><a href="${contextPath}/mypage/myDetailInfo.do">회원정보</a></li>
			<li><a href="#">회원탈퇴</a></li>
		</ul>
	</c:when>
	<c:otherwise>
		<ul class="navbar__menu">
		    <li><a href="${contextPath}/goods/shopMain.do">SHOP</a></li>
		    <li><a href="${contextPath}/goods/bestMain.do">BEST</a></li>
		    <li><a href="#">BOB</a></li>
		    <li><a href="${contextPath}/customer/noticeMain.do">COMMUNITY</a></li>
	    </ul>
    </c:otherwise>
    </c:choose>
    
	<ul class="navbar__links">
	   <c:choose>
			<c:when test="${isLogOn==true and not empty memberInfo }">
				<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				<li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
				<li><a href="${contextPath}/cart/myCartList.do">장바구니</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
				<li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
				<li>
					<a href="#" onClick="javascript:showHide()">
						<i class="fa-solid fa-magnifying-glass"></i>
					</a>
				</li>
				<li>
					<a href="${contextPath }/member/loginForm.do" onClick="alert('로그인 후 이용해주세요')">
						<i class="fa-solid fa-cart-shopping"></i>
					</a>
				</li>		
			</c:otherwise>
		</c:choose>
		   
		<c:if test="${isLogOn==true and memberInfo.member_id =='admin' }">  
	   	   <li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
	    </c:if> 
	</ul>
	</nav>
	<div id="search">
		<div class="search-inner">
			<a class="closeBtn" href="#" onClick="javascript:showHide()">
				<i class="fa-solid fa-x"></i>
			</a>
			<form id="search-form" name="frmSearch" action="${contextPath}/goods/searchGoods.do" >
				<input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()">
				<input type="submit" name="search" class="btn1"  value="검 색" >
			</form>
		</div>
	</div>
	<div id="suggest">
	     <div id="suggestList"></div>
	</div>
	
</body>
</html>
