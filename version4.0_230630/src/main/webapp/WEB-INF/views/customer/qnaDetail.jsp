<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<link href="${contextPath}/resources/css/notice_detail.css" rel="stylesheet" type="text/css">
<%-- <div id="page-nav-wrap">
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
    </c:forEach> --%>
<div id="container">
	<div class="qnaContents">
		<div>
			<div>
				<div class="titleArea">
					<h2>
						<font>QNA</font>
					</h2>
					<p>1:1문의</p>
				</div>
				<form id="qna-form" name="qna-form" action="" method="post" target="_self">
				<c:forEach items="${selectQna }" var="qna">
					<table>
						<caption>1:1 맞춤상담 상세</caption>
						<tbody>
				            <tr>
				            	<th scope="row">제목</th>
	            	           	<td colspan="3">${ qna.qna_title }</td>
				            </tr>
			             	<tr>
				            	<th scope="row">이름</th>
	            	           	<td colspan="3"><!-- qna membername 들어갈예정 --></td>
	            	           	<th scope="row">답변여부</th>
	            	           	<td colspan="3">db 작성 후 완료 예정</td>
				            </tr>
			             	<tr class="tableView">
				            	<div class="detail">${ qna.qna_content }</div>
	            	           	<p>
	            	           		<br>
	            	           	</p>
	            	           	<p>
	            	           		<br>
	            	           	</p>
	            	           	<p>
	            	           		<br>
	            	           	</p>
	            	           	<img src="" alt="" />
				            </tr>
				            <tr id="content">
				            	<td>${ qna.qna_title } <span><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></span></td> 
				                <td>${ qna.qna_content }</td>
				            </tr>
				            <tr id="image">
				                <td>${ qna.qna_content }</td>
				            </tr>
			          	</tbody>
        			</table>
        		</c:forEach>
				</form>
			</div>
		</div>
	</div>
</div>