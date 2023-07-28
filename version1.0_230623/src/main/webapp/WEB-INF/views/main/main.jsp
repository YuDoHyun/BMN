<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  

<!-- swiper slide -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<!-- flickity -->
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>



<div id="ad_main_banner" class="swiper1">
	<ul class="slide swiper-wrapper">	 	
		<li class="swiper-slide"><img src="${contextPath}/resources/image/banner01.png" alt="banner01"></li>
		<li class="swiper-slide"><img src="${contextPath}/resources/image/banner02.png" alt="banner02"></li>
		<li class="swiper-slide"><img src="${contextPath}/resources/image/banner03.png" alt="banner03"></li> 
	</ul>
	<!-- If we need navigation buttons -->
	<div class="swiper-button-prev prevButton1"></div>
	<div class="swiper-button-next nextButton1"></div>
</div>

<div class="main_cardSlide ">
	<div class="main-bestItem main-carousel">
		<c:set var="goods_count" value="0" />
		<c:forEach var="item" items="${goodsMap.newbook }">
		<c:set  var="goods_count" value="${goods_count+1 }" />
			<div class="bestItem carousel-cell">
				<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				</a> 
				<h2 class="title">${item.goods_title }</h2>
				<p class="price">
			  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			          ${goods_price}원
				</p>
			</div>
		</c:forEach>
	</div> 
</div>
<div class="clear"></div>

<div class="main_book">
	<h1>ALL PRODUCT</h1>
	<div class="main-item">
		<c:set var="goods_count" value="0" />
		<c:forEach var="item" items="${goodsMap.bestseller }">
		<c:set  var="goods_count" value="${goods_count+1 }" />
			<div class="book">
				<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
					<img src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}">
				</a> 
				<h2 class="title">${item.goods_title }</h2>
				<p class="price">
			  	   <fmt:formatNumber  value="${item.goods_price}" type="number" var="goods_price" />
			          ${goods_price}원
				</p>
			</div>
		</c:forEach>
     	<div class="more">
	      <a href="${contextPath }/main/main.do">더 보기</a>
     	</div>
	</div>
</div>
<div class="clear"></div>

<script>
// 메인배너 슬라이드
const swiper1 = new Swiper('.swiper1', {
	// Optional parameters
	direction: 'horizontal',
	loop: true,
	
	// Navigation arrows
	navigation: {
  	  nextEl: '.nextButton1',
  	  prevEl: '.prevButton1',
  	}
    
});

</script>
<script>
$('.main-carousel').flickity({
	  // options
	  cellAlign: 'left',
	  contain: true
	});
</script>

