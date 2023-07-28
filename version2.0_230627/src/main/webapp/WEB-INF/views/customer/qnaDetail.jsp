<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/notice_detail.css" rel="stylesheet" type="text/css">
<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 공지사항
        </div>
    </div>
    <c:forEach items="${selectQna}" var="qna">
      <div id="contentwrap">
        <h2>공지사항</h2>
        <table>
            <tr id="title">
            	<td>${ qna.qna_title } <span><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></span></td>            	
            </tr>
            <tr id="content">
                <td>${ qna.qna_content }</td>
            </tr>
            <tr id="image">
                <td>${ qna.qna_content }</td>
            </tr>
        </table>
        <a href="qnaMain.do"><button>목록</button></a>
    </div>
    </c:forEach>
