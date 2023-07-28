<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/adminQnaDetail.css" rel="stylesheet" type="text/css">

	<% session = request.getSession(); %>

<div class="content-wrap">
	<div class="content-item">
        <p class="admin-title">Q&A</p>
        <div id="qna-answer-wrap">
			<form action="/adminQnaDetailImage.do" method="get">
	            <table>
	              <c:forEach var="qna" items="${selectQna}">
	                <tr class="taps" style="width:50%;">
	                    <td>No</td>
	                    <td class="taps_td">${ qna.qna_id }</td>                    
	                </tr>
	                <tr class="taps" style="width:50%;">
	                    <td>이름</td>
	                    <td class="taps_td">${ qna.member_name }</td>                    
	                </tr>
	                <tr class="taps" style="width:50%;">
	                    <td>작성일</td>
	                    <td class="taps_td"><fmt:formatDate value="${ qna.qna_date }" pattern = "yyyy-MM-dd"/></td>                    
	                </tr>
	                <tr class="taps" style="width:50%;">
	                    <td>상품명</td>
	                    <c:if test="${qna.goods_title!=null }">
	                    <td class="taps_td">${ qna.goods_title }</td>   
	                    </c:if>
	                    <c:if test="${qna.goods_title==null }">
	                    <td class="taps_td">일반 문의</td>   
	                    </c:if>
	                    
	                </tr>
	                <tr>
	                    <td>제목</td>
	                    <td class="taps_td">${ qna.qna_title }</td>
	                </tr>
	                <tr>
	                    <td>내용</td>
	                    <td class="taps_td">${ qna.qna_content }</td>
	                </tr>
	                <tr id="image">
	                    <td>사진</td>
	                    <td>
	                        <div class="qna-answer-img">
	                            <c:choose>
										  <c:when test="${empty qna.fileName}">
										    <div style="padding-top:25.5px;">없음</div>
										  </c:when>
										  <c:otherwise>
										    <img id="qnaImage" src="${contextPath}/qnathumbnails.do?qna_id=${qna.qna_id}&fileName=${qna.fileName}" alt="" width="70px" height="70px" style="cursor: pointer;" onclick="openImagePopup('${contextPath}/qnaOriginalthumbnails.do?qna_id=${qna.qna_id}&fileName=${qna.fileName}')">
										  </c:otherwise>
										</c:choose>
	                        </div>
	                    </td>
	                </tr>          
	            </table>
			</form>
            <div id="answerform-wrap">
                <form action="modifyQna.do" id="modify">
                    <div>
                        <p>답변내용</p>
                        <p>
                        	<input type="hidden" name="qna_id" value="${ qna.qna_id }">
                            <textarea name="qna_comment" id="">${ qna.qna_comment }</textarea>
                        </p>
                    </div>
                </form>
                	<div style="display:flex;">
		                <input type="button" value="답변하기" onclick="document.getElementById('modify').submit();" id="modify_btn">
					        	<button id="btn" onClick="history.back()">목록</button>
					   </div>
              </c:forEach>     
            </div><!--answerform-wrap 답변부분 랩-->
        </div><!--one2one-answer-wrap-->
    </div>
</div>
    
<script>
function openImagePopup(imageUrl) {
    // 팝업 창 옵션 설정
    var options = "width=500,height=500";
    
    // 팝업 창 열기
    var popupWindow = window.open(imageUrl, "popup", options);
    
    // 팝업 창 포커스
    popupWindow.focus();
}

</script>