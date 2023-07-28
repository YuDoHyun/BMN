<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${contextPath}/resources/css/qnaWrite.css" rel="stylesheet" type="text/css">

<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 문의하기
        </div>
    </div>

    <form action="addQna.do" method="POST" enctype="multipart/form-data">
    <div class="qnawrap">

        <div class="qna-top">
            <span>Q&A</span>
        </div>
        
        <div class="qnaediv">
            <div class="qna-head">
                <span>
                    이용중에 생긴 불편한점이나 문의내용을 남겨주세요.<br>
                    가능한 빠른 시간내에 답변드리겠습니다.
                </span>
            </div>

            <div class="qna-title">
                <span class="qna-title-span">제목</span>
                <input type="text" name="qna_title" class="title" style="border: 1px solid #505050; border-radius: 5px;">
					 <input type="hidden" name="goods_id" value="${goods_id}">
            </div>

            <div class="qna-content">
                <span class="qna-content-span">문의내용</span>
                <textarea name="qna_content" class="content"></textarea>
            </div>

            <div class="qna-confirm">
            
            <div class="uploaddiv">
                <label class="uploadlabel" for="chooseFile"><img id="img" src="${contextPath}/resources/image/camelaicon.jpg" class="uploadimg">사진첨부</label>
                <input type="file" id="chooseFile" name="fileName" accept="image/*" onchange="loadFile(this)">
            </div>
            <div id="fileName">첨부파일</div>
    
            <div class="qna-provision">
                <span>
                    본 양식을 통해 제출하신 개인 정보는 문의 주신 내용에 대한 답변을 드리기 위한 목적으로만 사용되며, 마케팅 목적으로 활용되지 않습니다.
                </span>
            </div>
            
            <div class="qna-button">
                <input type="button" class="qna-cancel" onclick="javascript:history.back();" value="취소">
                <input type="submit" class="qna-submit" value="등록하기" onclick="fileName()")>
            </div>

        </div>

        
    </div>
   </div>
</form>
    
<script type="text/javascript">

function loadFile(input) {
    var file = input.files[0];

    var name = document.getElementById('fileName');
    name.textContent = file.name;

};

function fileName() {
	var fileNameInput = document.getElementsByName('fileName')[0];
	var fileNameValue = document.getElementById('fileName');
	fileNameInput.value = fileNameValue;
	fileName = fileNameInput.val();
	obj.submit();
}

</script>