<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<div id="footer-wrap">
	<div class="footer-link">
		<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">이용약관</a></li>
			<li><a href="#">개인정보취급방침</a></li>
			<li><a href="#">제휴/도서홍보</a></li>
			<li><a href="#">광고센터</a></li>
			<li><a href="#">고객만족센터</a></li>
			<li class="no_line"><a href="#">찾아오시는길</a></li>
		</ul>
		<ul class="sns-link">
			<li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
			<li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa-brands fa-youtube"></i></a></li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="footer-info">
		<div class="footer-text footer__logo">
	        <a href="${contextPath}/main/main.do">
	        	<i class="fa-solid fa-paw"></i>&nbsp;밥멍냥
	        </a>
		</div>
		<div class="footer-text footer__company">
			<p>Dongwon Dearfood</p>
			<p>CEO. Inseog | TEL. 1234-5678 | E-MAIL. bob@himedia.com</p>
			<p>ADDRESS. 5th floor, Metrocan Building, 1133, Seongnam-daero, Jungwon-gu, Seongnam-si, Gyeonggi-do</p>
			<p>&nbsp;</p>
			<p>ⓒ 2023</p>
		</div>
		<div class="footer-text footer__bank">
			<p>BANK 신한은행 110-123-123456</p>
			<p>예금주 : 밥먹냥 주식회사</p>
		</div>
	</div>
</div>
