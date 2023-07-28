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

<link href="${contextPath}/resources/css/community.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/pagenav.css" rel="stylesheet" type="text/css">

 
<div class="customerwrap">
	<div id="customer">
		<input class="board-btn" onClick="location.href='myQnaWrite.do'" type="button" value="QNA 작성하기">
	    <table class="customer-table">
	        <tr class="table-head">
	            <td class="table-td1 qna-table-td1">번호</td>
	            <td class="table-td2 qna-table-td2">상품</td>
	            <td class="table-td3 qna-table-td3">제목</td>
	            <td class="table-td4 qna-table-td4">작성자</td>
	            <td class="table-td5 qna-table-td5">작성일</td>
	        </tr>
	        <c:forEach var="list" items="${qnaList}">
	        <tr class="table-tr" onclick="location.href='myQnaDetail.do?qna_id=${ list.qna_id }'">
	            <td class="td1">${ list.qna_id }</td>
	            <td class="td2">
	            	<img src="${contextPath}/thumbnails.do?goods_id=${list.goods_id}&fileName=${list.fileName}"
	            	onerror="this.onerror=null; this.src='${contextPath}/resources/image/banner01.png'"/>
	            </td>
	            <td class="td3 qna_title_td3">${ list.qna_title }</td>
	            <td class="td4">${ list.member_name }</td>
	            <td class="td5"><fmt:formatDate value="${ list.qna_date }" pattern = "yyyy-MM-dd"/></td>
	        </tr>
	        </c:forEach>
	     </table>
	     
	     <div id="bottom-wrap">
			<div id="pagenav">
	 			<div class="container-fluid">
					<div class="row">
			 			<ul class="pagination">
			 				<li class="<c:if test="${ page == 1 } ">disabled</c:if>">
								<a href="/mypage/myQnaList.do?page=${page-1}">&#60;</a>
							</li>			
							<li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=1">1</a>
							</li>
							<li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=2">2</a>
							</li>
							<li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=3">3</a>
							</li>
							<li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=4">4</a>
							</li>
							<li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=5">5</a>
							</li>
							<li class="<c:if test="${ page == 5 }">disabled</c:if>">
								<a class="" href="/mypage/myQnaList.do?page=${page+1}">&gt;</a>
				   			</li>
			 			</ul>
					</div>
				</div>
			</div><!--content-wrap-->
		</div>
	</div>
</div>
    