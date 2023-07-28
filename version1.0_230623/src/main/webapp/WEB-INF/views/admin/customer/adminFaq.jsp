<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="${contextPath}/resources/css/adminNotice.css" rel="stylesheet" type="text/css">   
    </head>
    <body>
    <div class="boardwrap">

        <div class="board-title">
            게시판관리
        </div>

        <div class="board-sub">
            -FAQ
        </div>       
        <div class="board-buttondiv">
            <div>
                <a href="admin_faq_write">
                	<input class="board-btn btn1" onclick="location.href='admin_faq_write'" type="button" value="글등록">
                </a>
	           	 <input class="board-btn btn2" type="button" onclick="document.getElementById('admindelete').submit();" value="글삭제">
            </div>
            <div class="searchdiv">
            	<form action="admin_faq_search">
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
            </div>
        </div>

        <form action="adminfaqDeleteAction"  method="get" id="admindelete">
        <div>
            <table class="noticeAdmin-table">
                <tr>
                    <td class="noticeAdmin-title"></td>
                    <td class="noticeAdmin-title">No</td>
                    <td class="noticeAdmin-title">제목</td>
                    <td class="noticeAdmin-title"></td>
                    <td class="noticeAdmin-title">등록일</td>
                </tr>
                <c:forEach var="dto" items="${ list }">
                <tr>
                    <td class="noticeAdmin-td1"><input type="checkbox" name="faq_idx" value="${ dto.faq_idx }"></td>
                    <td class="noticeAdmin-td2">${ dto.faq_idx }</td>
                    <td class="noticeAdmin-td3"><a class="notice-view" href="admin_faq_detail?faq_idx=${ dto.faq_idx }">${ dto.faq_title }</a></td>
                    <td class="noticeAdmin-td4"><a class="notice-modify" href="admin_faq_detail?faq_idx=${ dto.faq_idx }">수정</a></td>
                    <td class="noticeAdmin-td5">
						<c:set var="dateVar" value="${ dto.faq_date }" />
						<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" /></td>
                </tr>
                </c:forEach>

                
            </table>
        </div>	
        </form>    
    </div>
    </body>
    </html>