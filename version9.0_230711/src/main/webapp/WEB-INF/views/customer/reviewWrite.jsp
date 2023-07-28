<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page trimDirectiveWhitespaces="true" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>

<link href="${contextPath}/resources/css/reviewWrite.css" rel="stylesheet" type="text/css">


<form action="addReview.do" method="post" enctype="multipart/form-data">
    <div class="reviewwrap">
        <div class="review-title">
            <span>리뷰작성</span>
        </div>
            <c:forEach var="list" items="reviewWriteFile">
        <div class="review-star">
            <div class="imgdiv">
                <img src="${contextPath}/thumbnails.do?goods_id=${list.goods_id}&fileName=${list.fileName}">
            </div><input type="hidden" name="review_id" >
            <div class="stardiv">
                <span class="product-name"></span><br>
                <div class="star-rating space-x-4 mx-auto">
                    <input type="radio" id="5-stars" name="rating" value="5" onclick="score(this.form);" v-model="ratings" />
                    <label for="5-stars" class="star pr-4">★</label>
                    <input type="radio" id="4-stars" name="rating" value="4" onclick="score(this.form);" v-model="ratings" required/>
                    <label for="4-stars" class="star">★</label>
                    <input type="radio" id="3-stars" name="rating" value="3" onclick="score(this.form);" v-model="ratings"/>
                    <label for="3-stars" class="star">★</label>
                    <input type="radio" id="2-stars" name="rating" value="2" onclick="score(this.form);" v-model="ratings"/>
                    <label for="2-stars" class="star">★</label>
                    <input type="radio" id="1-star" name="rating" value="1" onclick="score(this.form);" v-model="ratings" />
                    <label for="1-star" class="star">★</label>
                </div>
                <span id="star-score" class="star-select">선택하세요</span>
            </div>
        </div>
            </c:forEach>

        <div class="review-confirm">
            
            <div class="uploaddiv">
                <label class="uploadlabel" for="chooseFile"><img id="img" src="/img/icons/camelaicon.jpg" class="uploadimg">사진첨부</label>
                <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
            </div>
            <div id="fileName">첨부파일</div>
            <div class="image-show" id="image-show"></div>

        <div class="review-confirm">
            <span class="review-confirm-title">상세리뷰</span>
            <textarea name="review_content" class="review-content" placeholder="10자이상 작성해주세요."></textarea>
        </div>
        
        <div class="review-button">
            <button class="review-cancel">취소하기</button>
            <input type="submit" class="review-submit" value="등록하기">
        </div>
        
    </div>
    </div>
</form>
    
    <script type="text/javascript">
       
    function score(frm){
        if (frm.rating[0].checked == true ) {
        var a = document.getElementById("star-score");
        a.innerHTML = "<span class='star-select2'>5점</span>";
        }else if (frm.rating[1].checked == true ) {
        var a = document.getElementById("star-score");
        a.innerHTML = "<span class='star-select2'>4점</span>";
        }else if (frm.rating[2].checked == true ) {
        var a = document.getElementById("star-score");
        a.innerHTML = "<span class='star-select2'>3점</span>";
        }else if (frm.rating[3].checked == true ) {
        var a = document.getElementById("star-score");
        a.innerHTML = "<span class='star-select2'>2점</span>";
        }else if (frm.rating[4].checked == true ) {
        var a = document.getElementById("star-score");
        a.innerHTML = "<span class='star-select2'>1점</span>";
        }
    }

    function loadFile(input) {
        var file = input.files[0];

        var name = document.getElementById('fileName');
        name.textContent = file.name;

        var newImage = document.getElementById("img");
        newImage.setAttribute("class", 'img');

        newImage.src = URL.createObjectURL(file);   

        newImage.style.width = "360px";
        newImage.style.height = "180px";
        newImage.style.objectFit = "contain";

        var container = document.getElementById('image-show');
        container.appendChild(newImage);
    };

</script>