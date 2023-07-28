<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/adminQnaDetail.css" rel="stylesheet" type="text/css">

<c:forEach var="review" items="${selectReview}">
  <img src="${contextPath}/reviewOriginalthumbnails.do?review_id=${review.review_id}&fileName=${review.fileName}">
</c:forEach>