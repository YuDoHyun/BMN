<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/notice_detail.css" rel="stylesheet" type="text/css">

<c:forEach items="${selectNotice}" var="notice">
	<div id="contentwrap">
		<h2>NOTICE</h2>
		<table>
			<tr id="title">
		      	<td>${ notice.notice_title } <span><fmt:formatDate value="${ notice.notice_date }" pattern = "yyyy-MM-dd"/></span></td>            	
			</tr>
			<tr id="content">
			    <td>${ notice.notice_content }</td>
		    </tr>
	    </table>
	    <a href="noticeMain.do"><button>목록</button></a>
	</div>
</c:forEach>
