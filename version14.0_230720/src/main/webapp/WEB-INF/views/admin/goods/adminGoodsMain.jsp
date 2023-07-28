<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			url : "${contextPath}/admin/goods/adminGoodsMain.do",
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
			<span class="customer-title">상품관리</span>
		</div>
    </div>
</div>
<div class="boardwrap">
    <div class="border-qna-wrap">
	    <div class="board-buttondiv">
	        <div>
                	<input class="board-btn btn1" onclick="location.href='addNewGoodsForm.do'" type="button" value="상품 등록">
            </div>
            <div class="searchdiv">
            	<form action="adminGoodsMain.do">
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
	        </div>
	    </div>
		<div>
			<table class="noticeAdmin-table">
				<tbody align=center >
					<tr>
						<td class="noticeAdmin-title">상품번호</td>
						<td class="noticeAdmin-title">상품이름</td>
						<td class="noticeAdmin-title">저자</td>
						<td class="noticeAdmin-title">출판사</td>
						<td class="noticeAdmin-title">상품가격</td>
						<td class="noticeAdmin-title">입고일자</td>
						<td class="noticeAdmin-title">출판일</td>
		 			</tr>
		   			<c:choose>
		     			<c:when test="${empty newGoodsList}">			
							<tr>
				       			<td colspan=5 class="fixed">
						  		<strong>조회된 상품이 없습니다.</strong>
					  		</td>
				     		</tr>
			 			</c:when>
			 			<c:otherwise>
		     			<c:forEach var="item" items="${newGoodsList}" varStatus="i">
		     			<tr>
							<td class="noticeAdmin-td1">
								<a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									<strong>${item.goods_id}</strong>
								</a>
							</td>
							<td class="noticeAdmin-td2">
								<a href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									<strong>${item.goods_title}</strong>
								</a>
							</td>
							<td class="noticeAdmin-td3">
								<a class="notice-view" href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									${item.goods_writer}
								</a>
							</td>
							<td class="noticeAdmin-td4">
								<a class="notice-view" href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									${item.goods_publisher}
								</a>
							</td>
							<td class="noticeAdmin-td5">
								<a class="notice-view" href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									${item.goods_sales_price}
								</a>
							</td>
							<td class="noticeAdmin-td6">
								<a class="notice-view" href="${pageContext.request.contextPath}/admin/goods/modifyGoodsForm.do?goods_id=${item.goods_id}">
									${item.goods_credate}
								</a>
							</td> 
							<td class="noticeAdmin-td6">
								<c:set var="pub_date" value="${item.goods_published_date}" />
						   		<c:set var="arr" value="${fn:split(pub_date,' ')}" />
								   <c:out value="${arr[0]}" />
							</td> 
							</tr>
						</c:forEach>
						</c:otherwise>
	  				</c:choose>	
				</tbody>
			</table>
			<div id="pagenav">
			 	<div class="container-fluid">
					<div class="row">
					  <ul class="pagination">
						<c:forEach   var="page" begin="1" end="5" step="1" >
					        <c:if test="${page == 1 }">
					        	<a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &lt &nbsp;</a>
					        </c:if>
					        	<a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
					        <c:if test="${page == 5 }">
					        	<a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; &gt &nbsp;</a>
					        </c:if> 
				      	</c:forEach>
					  </ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
