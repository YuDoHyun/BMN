<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
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
					herf="/customer/reviewMain.do"> review </a></li>
			</ul>
		</div>
    </div>
</div>
<div class="customerwrap">
	<div id="customer">
	    <table class="customer-table">
	        <tr class="table-head">
	            <td class="table-td1 qna-table-td1">번호</td>
	            <td class="table-td2 qna-table-td2">상품</td>
	            <td class="table-td3 qna-table-td3">제목</td>
	            <td class="table-td4 qna-table-td4">작성자</td>
	            <td class="table-td5 qna-table-td5">작성일</td>
	        </tr>
	        <c:forEach var="list" items="${reviewList}">
	        <tr class="table-tr" onclick="location.href='reviewDetail.do?review_id=${ list.review_id }'">
	            <td class="td1">${ list.review_id }</td>
	            <td class="td2">
	            	<img src="${contextPath}/thumbnails.do?goods_id=${list.goods_id}&fileName=${list.fileName}">
	            </td>
	            <td class="td3 qna_title_td3">${ list.review_title }</td>
	            <td class="td4">${ list.member_name }</td>
	            <td class="td5"><fmt:formatDate value="${ list.review_date }" pattern = "yyyy-MM-dd"/></td>
	        </tr>
	        </c:forEach>
	     </table>
	     <div id="bottom-wrap">
			<div id="pagenav">
	 			<div class="container-fluid">
					<div class="row">
			 			<ul class="pagination">
			 				<li class="<c:if test="${ page == 1 } ">disabled</c:if>">
								<a href="/customer/reviewMain.do?page=${page-1}">&#60;</a>
							</li>			
							<li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
								<a class="" href="/customer/reviewMain.do?page=1">1</a>
							</li>
							<li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
								<a class="" href="/customer/reviewMain.do?page=2">2</a>
							</li>
							<li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
								<a class="" href="/customer/reviewMain.do?page=3">3</a>
							</li>
							<li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
								<a class="" href="/customer/reviewMain.do?page=4">4</a>
							</li>
							<li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
								<a class="" href="/customer/reviewMain.do?page=5">5</a>
							</li>
							<li class="<c:if test="${ page == 5 }">disabled</c:if>">
								<a class="" href="/customer/reviewMain.do?page=${page+1}">&gt;</a>
				   			</li>
			 			</ul>
					</div>
				</div>
			</div><!--content-wrap-->
		</div>
	</div>
</div>