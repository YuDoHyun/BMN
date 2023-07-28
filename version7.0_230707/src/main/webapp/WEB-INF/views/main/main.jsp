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
<!-- <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script> -->


<section class="section visual-slide">
  <!-- Swiper -->
  <div class="swiper mySwiper1">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="${contextPath}/resources/image/banner01.png" alt="banner01"></div>
      <div class="swiper-slide"><img src="${contextPath}/resources/image/banner02.png" alt="banner02"></div>
      <div class="swiper-slide"><img src="${contextPath}/resources/image/banner03.png" alt="banner03"></div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>
</section>


<section class="section card-slide">
  <!-- Swiper -->
  <div #swiperRef="" class="swiper mySwiper2">
    <div class="swiper-wrapper">
    <c:set var="goods_count" value="0" />
	<c:forEach var="item" items="${goodsMap.bestseller }">
      <div class="swiper-slide slide-item">
      <c:set  var="goods_count" value="${goods_count+1 }" />
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
 	<div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
   	<div class="swiper-pagination"></div>
  </div>
</section>



<%-- <div class="main_cardSlide ">
	<div class="main-bestItem main-carousel">
	<c:set var="goods_count" value="0" />
	<c:forEach var="item" items="${goodsMap.bestseller }">
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
<div class="clear"></div> --%>

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
						<div class="product-item-img" style="width: 180px; height: 250px; background: red;">
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
		
     	<div class="more">
	      <a href="${contextPath }/goods/shopMain.do">더 보기</a>
     	</div>
	</div>
</div>

<section class="section main-video">
	<a href="#">
		<div>
			<video class="background-video" autoplay="auto" playinline muted loop preload>
				<source src="https://cdn.thebanchan.co.kr/extrachannel/arrr/arrr_foodjournalpc.mp4">
			</video>
		</div>
	</a>
</section>


<!-- Initialize Swiper -->
<script>
  var swiper = new Swiper(".mySwiper1", {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,

    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
  
  <!-- Initialize Swiper -->
   var swiper = new Swiper(".mySwiper2", {
     slidesPerView: 5,
     centeredSlides: true,
     spaceBetween: 30,

     pagination: {
       el: ".swiper-pagination",
       clickable: true,
     },

   });
</script>



