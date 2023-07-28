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
					herf="/customer/noticeMain.do"> review </a></li>
			</ul>
		</div>
    </div>
</div>
