<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/adminQnaDetail.css" rel="stylesheet" type="text/css">

<c:forEach var="qna" items="${selectQna}">
  <img src="${contextPath}/qnaOriginalthumbnails.do?qna_id=${qna.qna_id}&fileName=${qna.fileName}">
</c:forEach>