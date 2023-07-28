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
   <div class="section main-item">
	<div class="sub-title">
		<h1>ALL PRODUCT</h1>
	</div>
	<div class="item-list">
		<ul class="all-product">
		<c:set var="goods_count" value="0" />
		<c:forEach var="item" items="${allGoodsList }">
		<c:set  var="goods_count" value="${goods_count+1 }" />
			<li>
				<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					<div class="all-product-item">
						<div class="product-item-img">
							<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
						</div>
						<div class="product-item-title">
							<h2>${item.goods_title }<br></h2>
						</div>
						<div class="product-item-price">
							<p>
						  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
						          ${goods_price}원
							</p>
						</div>
					</div>
				</a>
			</li>
		</c:forEach>	
		</ul>
	</div>
</div>
</body>
</html>
