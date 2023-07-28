<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${contextPath}/resources/css/community.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/pagenav.css" rel="stylesheet" type="text/css">

<div id="page-nav-wrap">
	<div id="page-nav">
		<div class="titlediv">
		<span class="customer-title">COMMUNITY</span>
	</div>

	<div id="customer-session-menu">
		<ul>
			<li onClick="location.href='noticeMain.do'" id="notice_menu"><a
				herf="/customer/noticeMain.do"> notice </a></li>
			<li onClick="location.href='faqMain.do'" id="faq_menu"><a
				herf="/customer/faqMain.do"> faq </a></li>
			<li onClick="location.href='qnaMain.do'" id="qna_menu"><a
				herf="/customer/qnaMain.do"> q&a </a></li>
			<li onClick="location.href='reviewMain.do'" id="review_menu"><a
				herf="/customer/noticeMain.do"> review </a></li>
		</ul>
	</div>
    </div>
</div>


<div class="customerwrap">
	<div id="customer">
		<table class="customer-table">
			<tr class="table-head">
				<td class="table-td1">번호</td>
				<td class="table-td2">제목</td>
				<td class="table-td3">작성일</td>
			</tr>
			<c:forEach var="list" items="${noticeList}">
			<tr class="table-tr"
				onclick="location.href='noticeDetail.do?notice_id=${ list.notice_id }'">
				<td class="td1">${ list.notice_id }</td>
				<td class="td2">${ list.notice_title }</td>
				<td class="td3"><fmt:formatDate value="${ list.notice_date }"
						pattern="yyyy-MM-dd" /></td>
			</tr>				
			</c:forEach>
		</table>
		
		<div id="bottom-wrap">
			<div id="pagenav">
				<div class="container-fluid">
					<div class="row">
						<ul class="pagination">

							<li class="<c:if test="${ page == 1 } ">disabled</c:if>"><a
								href="/customer/noticeMain.do?page=${page-1}">&#60;</a></li>

							<li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
								<a class="" href="/customer/noticeMain.do?page=1">1</a>
							</li>
							<li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
								<a class="" href="/customer/noticeMain.do?page=2">2</a>
							</li>
							<li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
								<a class="" href="/customer/noticeMain.do?page=3">3</a>
							</li>
							<li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
								<a class="" href="/customer/noticeMain.do?page=4">4</a>
							</li>
							<li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
								<a class="" href="/customer/noticeMain.do?page=5">5</a>
							</li>
							<li class="<c:if test="${ page == 5 }">disabled</c:if>"><a
								class="" href="/customer/noticeMain.do?page=${page+1}">&gt;</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!--content-wrap-->

		</div>
	</div>
</div>

<div class="notice_bottom">
	<div class="card">
		<div class="card_content">
			<h1 class="tp">031. 1234. 5678</h1>
			<p class="bold">평일 오전 9:00 - 오후 17:00</p>
			<p>점심시간 12:00 - 13:00 | 공휴일 휴무</p>
			<a href="http://pf.kakao.com/Bob/chat">
				<div class="kakaobtn">
					<span class="btntxt">카카오 채팅 상담</span>
					<img alt="btn" src="/resources/image/go_kakao.svg">
					&nbsp;
				</div>
			</a>
		</div>
	</div>
</div>
