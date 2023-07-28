<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">

<link href="${contextPath}/resources/css/adminNoticeDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
 <div class="content-wrap">
        <p class="admin-title">게시판 관리</p>
        <p class="admin-subtitle">-공시사항 </p>
        <div class="notice_board">
	        <form action="adminfaqUpdateAction">
	        <div class="notice_board_title">
	            	<input type="hidden" name="faq_idx" value="${ faqdto.faq_idx }"></input>
	            	<input type="text" name="faq_title" value="${ faqdto.faq_title }"></input>
	            	<span>
	            		<c:set var="dateVar" value="${ faqdto.faq_date }" />
						<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
					</span>
			</div>
	        <div class="notice_board_content">
	                <textarea rows="" cols=""  name="faq_content">${faqdto.faq_content}</textarea >               
	        </div>
	           <input type="submit" value="수정"></input>
	       	</form>    
            <a href="admin_faq"><button>목록</button></a>
        </div>
       
    </div><!--content-wrap-->
    </body>
    <script>
    $('textarea').each(function () {
    	this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
    	}).on('input', function () {
    	this.style.height = 'auto';
    	this.style.height = (this.scrollHeight) + 'px';
    	});
    </script>
   </html>