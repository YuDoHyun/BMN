<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">

<!-- CSS -->
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
<link href="${contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/login.css" rel="stylesheet" type="text/css">

<!-- 외부 라이브러리 -->
<script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
<script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
<%-- <script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script> --%>


<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Poor+Story&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/bb535d3b48.js" crossorigin="anonymous"></script>

<title>
	<tiles:insertAttribute name="title" />
</title>
	
</head>
<body>
	<div id="wrap">
		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>
		<div class="clear"></div>
		<%-- <aside>
			 <tiles:insertAttribute name="side" />
		</aside> --%>
		<article>
	 		<tiles:insertAttribute name="body" />
		</article>
		<div class="clear"></div>
		<footer>
      		<tiles:insertAttribute name="footer" />
      	</footer>
	</div>        	
</body>      
        
        