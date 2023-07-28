<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<link href="${contextPath}/resources/css/notice_detail.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/goods_detail_review.css" rel="stylesheet" type="text/css">

<div id="container">
	<div class="review-wrap">
		<div class="review-content">
			<div class="titleArea">
				<h2>REVIEW</h2>
			</div>
			<div>
				<table id="review">
	        		<c:forEach var="list" items="${selectReview}">
		            <tr>
		                <td id="first-td">            
		                    <div class="star-ratings">                    
		                        <div class="star-ratings-fill space-x-2 text-lg" style="width: ${list.review_star * 20}%;">
		                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		                        </div>
		                        <div class="star-ratings-base space-x-2 text-lg">
		                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		                        </div>
		                    </div>
		                </td>
		                <td><img src="${contextPath}/reviewthumbnails.do?review_id=${list.review_id}&fileName=${list.fileName}" style="width: 90%; cursor: pointer;" onclick="openImagePopup('${contextPath}/reviewOriginalthumbnails.do?review_id=${list.review_id}&fileName=${list.fileName}')"></td>
		                <td>
		                    ${list.review_content}
		                </td>
		                <td>
		                	  ${list.member_name}
		                </td>
		                <td><fmt:formatDate value="${list.review_date}" pattern = "yyyy-MM-dd"/></td>
		            </tr>
		            <tr class="review_comment">
						<td>
						  └ 리뷰 답글:
						</td>
						<td colspan="4">
							<p class="comment">${list.review_comment}</p>
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>

		</div>
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

document.addEventListener('DOMContentLoaded', function() {
	  var commentElements = document.getElementsByClassName("comment");
	  for (var i = 0; i < commentElements.length; i++) {
	    var commentElement = commentElements[i];
	    if (commentElement.innerText.trim() === "") {
	      var trElement = commentElement.closest(".review_comment");
	      trElement.style.display = "none";
	    }
	  }
	});
</script>