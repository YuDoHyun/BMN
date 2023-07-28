<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<html>
<head>
<meta  charset="utf-8">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="${contextPath}/resources/css/adminNotice.css" rel="stylesheet" type="text/css">  
    <link href="${contextPath}/resources/css/pagenav.css" rel="stylesheet" type="text/css"> 
    
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/customer/keywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
</script>
    </head>
    <body>
    <div class="boardwrap">

        <div class="board-title">
            게시판관리
        </div>

        <div class="board-sub">
            -공지사항
        </div>       
        <div class="board-buttondiv">
            <div>
                <a href="adminNoticeWrite.do">
                	<input class="board-btn btn1" onclick="location.href='adminNoticeWrite.do'" type="button" value="글등록">
                </a>
	           	 <input class="board-btn btn2" type="button" onclick="document.getElementById('admindelete').submit();" value="글삭제">
            </div>
            <div class="searchdiv">
            	<form action="keywordSearch.do" method="post">
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
            </div>
        </div>

        <form action="deleteNotice.do"  method="post" id="admindelete">
        <div>
            <table class="noticeAdmin-table">
                <tr>
                    <td class="noticeAdmin-title"></td>
                    <td class="noticeAdmin-title">No</td>
                    <td class="noticeAdmin-title">제목</td>
                    <td class="noticeAdmin-title">등록일</td>
                </tr>
                <c:forEach var="notice" items="${ noticeList }">
                <tr>
                    <td class="noticeAdmin-td1"><input type="checkbox" name="notice_id" value="${ notice.notice_id }"></td>
                    <td class="noticeAdmin-td2">${ notice.notice_id }</td>
                    <td class="noticeAdmin-td3"><a class="notice-view" href="adminNoticeDetail.do?notice_id=${ notice.notice_id }">${ notice.notice_title }</a></td>
                    <td class="noticeAdmin-td5">
						<c:set var="dateVar" value="${ notice.notice_date }" />
						<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" /></td>
                </tr>
                </c:forEach>

            </table>
   <div id="pagenav">
    <div class="container-fluid">
		<div class="row">
		  <ul class="pagination">
		   
		    <li class="<c:if test="${ page == 1 } ">disabled</c:if>">
		    	<a href="/admin/customer/adminNoticeMain.do?page=${page-1}">&#60;</a>
		    </li>
		   
		    <li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=1">1</a>
		    </li>
		    <li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=2">2</a>
		    </li>
		    <li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=3">3</a>
		    </li>
		    <li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=4">4</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=5">5</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="" href="/admin/customer/adminNoticeMain.do?page=${page+1}">&gt;</a>
		    </li>
		  </ul>
		</div>
	</div>
	</div><!--content-wrap-->
        </div>	
        </form>    
    </div>
    </body>
    </html>
    