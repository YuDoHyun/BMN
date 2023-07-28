<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
</head>
<BODY>
	<h1> 카카오 성공 </h1>
	
	<TABLE class="list_view">
		<TBODY align=center>
			<tr style="background: #33ff00">
			    <td>결제 금액</td>
				<td>주문 번호</td>
				<td>결제 타입</td>
				<td>결제 일시</td>
				<td>결제 번호</td>
				<td>반응 코드</td>
				<td>반응 메세지</td>
			</tr>
			<tr>
			    <td><fmt:formatNumber value = "${ kakaoData.amount }" pattern="#,###" /></td>
			    <td> ${ kakaoData.orderNumber } </td>
				<td>${ kakaoData.type }</td>
				<td>
				<fmt:parseDate value="${ kakaoData.authDateTime }" var="dateValue" pattern="yyyyMMddHHmmss"/>
				<fmt:formatDate value="${ dateValue }" pattern="yyyy-MM-dd"/>
				</td>
				<td>${ kakaoData.transactionId }</td>
				<td>${ kakaoData.responseCode }</td>
				<td>${ kakaoData.responseMsg }</td>
			</tr>
		</TBODY>
	</TABLE>
	
	<!-- Paycontroller2 에서 받은 데이터 -->
	
	<%-- ${amount}
	${ kakaoData.amount }
	<c:out value="${ kakaoData.amount }" />
	
	<!-- 숫자 포맷 -->
	<fmt:formatNumber value = "${ kakaoData.amount }" pattern="#,###" />
	
	<!-- 날짜 포맷 -->
	${ authDateTime } 
	<!-- : 20230531112322 -->
	
	<fmt:parseDate value="${ authDateTime }" var="dateValue" pattern="yyyyMMddHHmmss"/>
	<fmt:formatDate value="${ dateValue }" pattern="yyyy-MM-dd"/>
	
	<!-- 2023-05-31 --> --%>
	
</BODY>