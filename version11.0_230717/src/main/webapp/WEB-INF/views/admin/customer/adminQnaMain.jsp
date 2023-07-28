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
			url : "${contextPath}/admin/customer/NoticekeywordSearch.do",
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
<div id="page-nav-wrap">
	<div id="page-nav">
		<div class="titlediv">
		<span class="customer-title">게시판관리</span>
	</div>

	<div id="customer-session-menu">
		<ul>
			<li onClick="location.href='adminNoticeMain.do'" id="notice_menu"><a
				herf="/customer/adminNoticeMain.do"> notice </a></li>
			<li onClick="location.href='adminFaqMain.do'" id="faq_menu"><a
				herf="/customer/adminFaqMain.do"> faq </a></li>
			<li onClick="location.href='adminQnaMain.do'" id="qna_menu"><a
				herf="/customer/adminQnaMain.do"> q&a </a></li>
			<li onClick="location.href='adminReviewMain.do'" id="review_menu"><a
				herf="/customer/adminReviewMain.do"> review </a></li>
		</ul>
	</div>
    </div>
</div>
<div class="boardwrap">
	<div class="border-qna-wrap">
        <div class="board-buttondiv" style="flex-direction: row-reverse">
            <div class="searchdiv">
            	<form action="QnakeywordSearch.do" method="post">
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
	                <c:forEach var="qna" items="${ qnaList }">
	                <tr>
	                    <td class="noticeAdmin-td1"><input type="checkbox" name="qna_id" value="${ qna.qna_id }"></td>
	                    <td class="noticeAdmin-td2">${ qna.qna_id }</td>
	                    <td class="noticeAdmin-td3"><a class="notice-view" href="adminQnaDetail.do?qna_id=${ qna.qna_id }">${ qna.qna_title }</a></td>
	                    <td class="noticeAdmin-td5">
							<c:set var="dateVar" value="${ qna.qna_date }" />
							<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" /></td>
	                </tr>
	                </c:forEach>
	
	            </table>
			   <div id="pagenav">
				   <div class="container-fluid">
						<div class="row">
							<ul class="pagination">
							  
								<li class="<c:if test="${ page == 1 } ">disabled</c:if>">
									<a href="/admin/customer/adminQnaMain.do?page=${page-1}">&#60;</a>
								</li>
								<li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=1">1</a>
								</li>
								<li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=2">2</a>
								</li>
								<li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=3">3</a>
								</li>
								<li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=4">4</a>
								</li>
								<li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=5">5</a>
								</li>
								<li class="<c:if test="${ page == 5 }">disabled</c:if>">
									<a class="" href="/admin/customer/adminQnaMain.do?page=${page+1}">&gt;</a>
								</li>
							</ul>
						</div>
					</div>
				</div><!--content-wrap-->
				
				
	        </div>	
        </form>    
    </div>
</div>
</body>
</html>
    