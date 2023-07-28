<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<style>
    #suggestList {
      border: 1px solid #ccc;
      background-color: #fff;
      max-height: 200px;
      overflow-y: auto;
      padding: 5px;
      border-radius: 7px;
    }
    .suggestItem {
      cursor: pointer;
      padding: 3px;
    }
    .suggestItem:hover {
      background-color: #f2f2f2;
    }
  </style>
  
<script type="text/javascript">
var loopSearch = true;
var timeoutId = null;

function keywordSearch() {
    clearTimeout(timeoutId); // 이전의 타이머 제거
    timeoutId = setTimeout(performSearch, 300); // 300ms 후에 검색 수행
  }

function performSearch() {
    var value = document.frmSearch.searchWord.value.trim();

    if (value === "") {
      hide('suggest');
      return;
    }
    
    $.ajax({
        type: "get",
        async: true,
        url: "${contextPath}/goods/keywordSearch.do",
        data: { keyword: value },
        success: function(data, textStatus) {
          console.log(data); // 반환된 데이터 확인
          var jsonInfo = JSON.parse(data);
          displayResult(jsonInfo);
        },
        error: function(data, textStatus) {
          alert("에러가 발생했습니다." + data);
        },
        complete: function(data, textStatus) {
          // 작업 완료
        }
      });
    }
	
function displayResult(jsonInfo) {
    var count = jsonInfo.keyword.length;
    var listView = document.getElementById("suggestList");

    if (count > 0) {
      listView.innerHTML = ""; // 기존 항목 제거

      for (var i = 0; i < count; i++) {
        var item = document.createElement("div");
        item.className = "suggestItem";
        item.textContent = jsonInfo.keyword[i];
        item.addEventListener("click", function() {
          select(this.textContent);
        });

        listView.appendChild(item);
      }
      
      show('suggest');
    } else {
      hide('suggest');
    }
  }
	
function select(selectedKeyword) {
    document.frmSearch.searchWord.value = selectedKeyword;
    loopSearch = false;
    hide('suggest');
  }
		
function show(elementId) {
    document.getElementById(elementId).style.display = 'block';
  }
	
function hide(elementId) {
    document.getElementById(elementId).style.display = 'none';
  }
	
function showHide() {
    var searchDiv = document.getElementById("search");
    if (searchDiv.style.display === 'none') {
      searchDiv.style.display = 'block';
    } else {
      searchDiv.style.display = 'none';
    }
  }
  
function confirmMsg() {
	var confirMsg = confirm("정말 탈퇴하시겠습니까?");
	if (confirMsg) {
		window.location.href = "${contextPath}/mypage/deleteMember.do"
	} else {
		
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
			<li><a href="#" onClick="confirmMsg()">회원탈퇴</a></li>
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
			<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.member_id !='admin' }">
				<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				<li><a href="${contextPath}/mypage/myPageMain.do">마이페이지</a></li>
				<li>
					<a href="#" onClick="javascript:showHide()">
						<i class="fa-solid fa-magnifying-glass"></i>
					</a>
				</li>
				<li>
					<a href="${contextPath }/cart/myCartList.do">
						<i class="fa-solid fa-cart-shopping"></i>
					</a>
				</li>
				
			</c:when>
			<c:when test="${isLogOn==true and not empty memberInfo and memberInfo.member_id =='admin' }">
				<li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
				<li class="no_line"><a href="${contextPath}/admin/goods/adminGoodsMain.do">관리자</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
				<li><a href="${contextPath}/member/join.do">회원가입</a></li>
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
			<div id="suggest">
	    		<div id="suggestList"></div>
			</div>		
			
		</div>
	
	</div>
	
</body>
</html>
