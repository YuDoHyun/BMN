<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<link href="${contextPath}/resources/css/qna_detail.css" rel="stylesheet" type="text/css">
<div id="page-nav-wrap">
    <c:forEach items="${selectQna}" var="qna">
    <div id="contentwrap">
        <h2>QNA</h2>
        <table>
            <tr id="title">
            	<td>${ qna.qna_title } <span><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></span></td>            	
            	<td><span>답변여부 ${ qna.qna_status }</span> </td>            	
            </tr>
            <tr id="content">
                <td>${ qna.qna_content }</td>
            </tr>
            <tr id="image">
                <td><img id="qnaImage" src="${contextPath}/qnathumbnails.do?qna_id=${qna.qna_id}&fileName=${qna.fileName}" onerror="hideTableRow(this)"></td>
            </tr>
        </table>
        <table id="qna_comment" class="list_view">
            <tr>
            	<td class="qna-td1 qna-td-content2">
                	<span>답변내용</span>
                </td>
                <td colspan='4' class="qna-td2"><p id="comment">${ qna.qna_comment }</p></td>
              </tr>
        </table>
        <a href="myQnaList.do"><button>목록</button></a>
    </div>
    </c:forEach>
</div>

<script type="text/javascript">
var a = document.getElementById("comment").innerHTML
if( a == "" ){
	document.getElementById("qna_comment").style.display = "none";
}

function hideTableRow(image) {
    var tr = image.parentNode.parentNode; // <td>의 부모인 <tr>을 찾습니다.
    tr.style.display = 'none';
}

var image = document.getElementById('qnaImage');
	image.addEventListener('error', function() {
		var tr = document.getElementById('image');
		tr.style.display = 'none';
});    	
    
</script>