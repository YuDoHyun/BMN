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
    <link href="${contextPath}/resources/css/adminNoticeWrite.css" rel="stylesheet" type="text/css">
    
    </head>
    <body>
    <div class="boardwrap">
    <div class="board-admin">게시판관리</div>
    <div class="board-wrap">
        <string>FAQ</string>
        <form action="addFaq.do">
        <table class="board-table">
            <tr>
                <td class="board-td1 board-name board-title">제목</td>
                <td class="board-td2 board-title"><textarea class="board-text1" name="faq_title"></textarea></td>
            </tr>
            <tr>
                <td class="board-td1 board-name board-content">내용</td>
                <td class="board-td2 board-content"><textarea class="board-text2" name="faq_content"></textarea></td>
            </tr>
        </table>

        <div class="buttondiv">
            <input type="button" class="board-button btn1" value="취소">
            <input type="submit" class="board-button btn2" value="등록">
        </div>
		</form>
    </div>
</div>
</body>
</html>