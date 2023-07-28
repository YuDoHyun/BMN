<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="${contextPath}/resources/css/adminQnaDetail.css" rel="stylesheet" type="text/css">

	<% session = request.getSession(); %>

<div class="content-wrap">
	<div class="content-item">
        <p class="admin-title">REVIEW</p>
        <div id="qna-answer-wrap">
			<form action="/adminQnaDetailImage.do" method="get">
	            <table>
	              <c:forEach var="review" items="${selectReview}">
	                <tr class="taps" style="width:50%;">
	                    <td>이름</td>
	                    <td class="taps_td">${ review.member_name }</td>                    
	                </tr>
	                <tr class="taps" style="width:50%;">
	                    <td>작성일</td>
	                    <td class="taps_td"><fmt:formatDate value="${ review.review_date }" pattern = "yyyy-MM-dd"/></td>                    
	                </tr>
	                <tr>
                    <td>별점</td>
	                    <td class="taps_td">        
		                    <div class="star-ratings">                    
		                        <div class="star-ratings-fill space-x-2 text-lg" style="width: ${review.review_star * 20}%;">
		                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		                        </div>
		                        <div class="star-ratings-base space-x-2 text-lg">
		                            <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		                        </div>
		                    </div>
		                </td>
                	</tr>
	                <tr>
	                    <td>내용</td>
	                    <td class="taps_td">${ review.review_content }</td>
	                </tr>
	                <tr>
	                    <td>사진</td>
	                    <td>
	                        <div class="qna-answer-img">
	                            <img src="${contextPath}/reviewthumbnails.do?review_id=${review.review_id}&fileName=${review.fileName}" alt="" width="70px" height="70px" onClick="view('${review.review_id}', '${review.fileName}')" style="cursor:pointer;">
	                        </div>
	                    </td>
	                </tr>          
	            </table>
			</form>
	        <div id="answerform-wrap">
	            <form action="modifyReview.do">
	                <div>
	                    <p>답변내용</p>
	                    <p>
	                    	<input type="hidden" name="review_id" value="${ review.review_id }">
	                        <textarea name="review_comment" id="">${ review.review_comment }</textarea>
	                    </p>
	                </div>
	            <input type="submit" value="답변하기">
	            </form>
	          </c:forEach>     
	        </div><!--answerform-wrap 답변부분 랩-->
   		</div><!--one2one-answer-wrap-->
   	</div>
</div>

<script>
function view(review_id, fileName) {
    window.name = "adminReviewDetail"
    window.open("adminReviewDetailImage.do?review_id=" + review_id + "&fileName=" + fileName, "adminReviewDetailImage.do ", '');
    form.submit();
  };    
</script>