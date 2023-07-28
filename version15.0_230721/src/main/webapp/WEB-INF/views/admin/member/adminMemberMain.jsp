<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${contextPath}/resources/css/adminMember.css" rel="stylesheet" type="text/css"> 
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
			<span class="customer-title">회원관리</span>
		</div>
    </div>
</div>	

<div class="boardwrap">
    <div class="border-qna-wrap">
	    <div class="board-buttondiv" style="flex-direction: row-reverse;">
            <div class="searchdiv">
            	<form action="NoticekeywordSearch.do" method="post">
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
	        </div>
	    </div>
		<div>
			<table class="noticeAdmin-table">
		    	<tr>
					<td class="noticeAdmin-title">회원아이디</td>
					<td class="noticeAdmin-title">회원이름</td>
					<td class="noticeAdmin-title">휴대폰번호</td>
					<td class="noticeAdmin-title">주소</td>
					<td class="noticeAdmin-title">가입일</td>
					<td class="noticeAdmin-title">탈퇴여부</td>
		 		</tr>
		 		<c:forEach var="item" items="${member_list}">
				<tr>
		            <td class="noticeAdmin-td2">
		            	<a href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">
					    	<strong>${item.member_id}</strong>
					  	</a>
					</td>
		            <td class="noticeAdmin-td3">
		               	<a class="notice-view" href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">${item.member_name}</a>
		            </td>
		            <td class="noticeAdmin-td4">
		               	<a class="notice-view" href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">${item.hp1}-${item.hp2}-${item.hp3}</a>
		            </td>
		            <td class="noticeAdmin-td5">
		              	<a class="notice-view" href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">${item.roadAddress} ${item.jibunAddress} ${item.namujiAddress}</a>
		            </td>
		            <td class="noticeAdmin-td6">
		               	<a class="notice-view" href="${pageContext.request.contextPath}/admin/member/memberDetail.do?member_id=${item.member_id}">
		            		<c:set var="join_date" value="${item.joinDate}" />
					   		<c:set var="arr" value="${fn:split(join_date,' ')}" />
					   		<c:out value="${arr[0]}" />
		                </a>
		            </td>
	                <td class="noticeAdmin-td7">
	                	<c:choose>
							<c:when test="${item.del_yn=='N' }">
								활동중  
							</c:when>
							<c:otherwise>
								탈퇴
							</c:otherwise>
						</c:choose>

	                </td>
				</tr>
		        </c:forEach>
		
	          </table>
				<div id="pagenav">
				 	<div class="container-fluid">
						<div class="row">
						  <ul class="pagination">
								<c:forEach   var="page" begin="1" end="5" step="1" >
									<c:if test="${ page == 1 }">
							          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section-1}&pageNum=${(section-1)*5 + 1 }">&nbsp; &lt &nbsp; </a>
							         </c:if>
							          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section}&pageNum=${page}">${(section-1)*5 +page } </a>
							         <c:if test="${page == 5 }">
							          <a href="${pageContext.request.contextPath}/admin/member/adminMemberMain.do?chapter=${section+1}&pageNum=${section*5+1}">&nbsp; &gt &nbsp;</a>
							         </c:if> 
								</c:forEach>
						  </ul>
						</div>
					</div>
				</div><!--content-wrap-->
			</div>	
    </div>    
</div>
</body>
</html>

