<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="euc-kr"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="goods"  value="${goodsMap.goods}"  />
<c:set var="imageFileList"  value="${goodsMap.imageFileList}"  />

<c:choose>
<c:when test='${not empty goods.goods_status}'>
<script>
window.onload=function()
{
	init();
}

function init(){
	var frm_mod_goods=document.frm_mod_goods;
	var h_goods_status=frm_mod_goods.h_goods_status;
	var goods_status=h_goods_status.value;
	var select_goods_status=frm_mod_goods.goods_status;
	 select_goods_status.value=goods_status;
}
</script>
</c:when>
</c:choose>
<script type="text/javascript">
function fn_modify_goods(goods_id, attribute){
	var frm_mod_goods=document.frm_mod_goods;
	var value="";
	if(attribute=='goods_sort'){
		value=frm_mod_goods.goods_sort.value;
	}else if(attribute=='goods_title'){
		value=frm_mod_goods.goods_title.value;
	}else if(attribute=='goods_writer'){
		value=frm_mod_goods.goods_writer.value;   
	}else if(attribute=='goods_publisher'){
		value=frm_mod_goods.goods_publisher.value;
	}else if(attribute=='goods_price'){
		value=frm_mod_goods.goods_price.value;
	}else if(attribute=='goods_sales_price'){
		value=frm_mod_goods.goods_sales_price.value;
	}else if(attribute=='goods_point'){
		value=frm_mod_goods.goods_point.value;
	}else if(attribute=='goods_published_date'){
		value=frm_mod_goods.goods_published_date.value;
	}else if(attribute=='goods_page_total'){
		value=frm_mod_goods.goods_page_total.value;
	}else if(attribute=='goods_isbn'){
		value=frm_mod_goods.goods_isbn.value;
	}else if(attribute=='goods_delivery_price'){
		value=frm_mod_goods.goods_delivery_price.value;
	}else if(attribute=='goods_delivery_date'){
		value=frm_mod_goods.goods_delivery_date.value;
	}else if(attribute=='goods_status'){
		value=frm_mod_goods.goods_status.value;
	}else if(attribute=='goods_contents_order'){
		value=frm_mod_goods.goods_contents_order.value;
	}else if(attribute=='goods_writer_intro'){
		value=frm_mod_goods.goods_writer_intro.value;
	}else if(attribute=='goods_intro'){
		value=frm_mod_goods.goods_intro.value;
	}else if(attribute=='publisher_comment'){
		value=frm_mod_goods.publisher_comment.value;
	}else if(attribute=='recommendation'){
		value=frm_mod_goods.recommendation.value;
	}

	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/admin/goods/modifyGoodsInfo.do",
		data : {
			goods_id:goods_id,
			attribute:attribute,
			value:value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("상품 정보를 수정했습니다.");
			}else if(data.trim()=='failed'){
				alert("다시 시도해 주세요.");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}



  function readURL(input,preview) {
	//  alert(preview);
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#'+preview).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
  }  

  var cnt =1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input  type='file' name='detail_image"+cnt+"' id='detail_image"+cnt+"'  onchange=readURL(this,'previewImage"+cnt+"') />");
	  $("#d_file").append("<img  id='previewImage"+cnt+"'   width=200 height=200  />");
	  $("#d_file").append("<input  type='button' value='추가'  onClick=addNewImageFile('detail_image"+cnt+"','${imageFileList[0].goods_id}','detail_image')  />");
	  cnt++;
  }
  
  function modifyImageFile(fileId,goods_id, image_id,fileType){
    // alert(fileId);
	  var form = $('#FILE_FORM')[0];
      var formData = new FormData(form);
      formData.append("fileName", $('#'+fileId)[0].files[0]);
      formData.append("goods_id", goods_id);
      formData.append("image_id", image_id);
      formData.append("fileType", fileType);
      
      $.ajax({
        url: '${contextPath}/admin/goods/modifyGoodsImageInfo.do',
        processData: false,
        contentType: false,
        data: formData,
        type: 'POST',
	      success: function(result){
	         alert("이미지를 수정했습니다!");
	       }
      });
  }
  
  function addNewImageFile(fileId,goods_id, fileType){
	   //  alert(fileId);
		  var form = $('#FILE_FORM')[0];
	      var formData = new FormData(form);
	      formData.append("uploadFile", $('#'+fileId)[0].files[0]);
	      formData.append("goods_id", goods_id);
	      formData.append("fileType", fileType);
	      
	      $.ajax({
	          url: '${contextPath}/admin/goods/addNewGoodsImage.do',
	                  processData: false,
	                  contentType: false,
	                  data: formData,
	                  type: 'post',
	                  success: function(result){
	                      alert("이미지를 수정했습니다!");
	                  }
	          });
	  }
  
  function deleteImageFile(goods_id,image_id,imageFileName,trId){
	var tr = document.getElementById(trId);

      	$.ajax({
    		type : "post",
    		async : true, //false인 경우 동기식으로 처리한다.
    		url : "${contextPath}/admin/goods/removeGoodsImage.do",
    		data: {goods_id:goods_id,
     	         image_id:image_id,
     	         imageFileName:imageFileName},
    		success : function(data, textStatus) {
    			alert("이미지를 삭제했습니다!!");
                tr.style.display = 'none';
    		},
    		error : function(data, textStatus) {
    			alert("에러가 발생했습니다."+textStatus);
    		},
    		complete : function(data, textStatus) {
    			//alert("작업을완료 했습니다");
    			
    		}
    	}); //end ajax	
  }
</script>

</HEAD>
<BODY>
<div id="container" class="modify-container">
	<div id="content">
		<div class="modify-wrap">
			<form name="frm_mod_goods"  method=post >
				<!-- 내용 들어 가는 곳 -->
				<ul class="tabs">
					<li><A href="#tab1">상품정보</A></li>
					<li><A href="#tab2">상품소개</A></li>
					<li><A href="#tab3">상품이미지</A></li>
				</ul>
					
				<div class="tab_container">
					<div class="tab_content" id="tab1">
						<table>
							<tr>
								<td width=200 >상품분류</td>
								<td width=500>
								  <select name="goods_sort">
									<c:choose>
								      <c:when test="${goods.goods_sort=='건식' }">
										<option value="건식" selected>건식</option>
								  	    <option value="습식">습식</option>
								  	  </c:when>
								  	  <c:when test="${goods.goods_sort=='습식' }">
										<option value="건식" >건식</option>
								  	    <option value="습식" selected>습식</option>
								  	  </c:when>
								  	</c:choose>
									</select>
								</td>
								<td >
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_sort')"/>
								</td>
							</tr>
							<tr >
								<td >상품이름</td>
								<td><input name="goods_title" type="text" size="40"  value="${goods.goods_title }"/></td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_title')"/>
								</td>
							</tr>
					
		
							<tr>
								<td >상품정가</td>
								<td><input name="goods_price" type="text" size="40" value="${goods.goods_price }" /></td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_price')"/>
								</td>
								
							</tr>
					
							<tr>
								<td >상품판매가격</td>
								<td><input name="goods_sales_price" type="text" size="40" value="${goods.goods_sales_price }" /></td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_sales_price')"/>
								</td>
								
							</tr>
							
							
							<tr>
								<td >상품 구매 포인트</td>
								<td><input name="goods_point" type="text" size="40" value="${goods.goods_point }" /></td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_point')"/>
								</td>
				
							</tr>
							<tr>
								<td >상품 배송비</td>
								<td><input name="goods_delivery_price" type="text" size="40"  value="${goods.goods_delivery_price }"/></td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_delivery_price')"/>
								</td>
				
							</tr>
							<tr>
								<td >상품 도착 예정일</td>
								<td>
								  <input name="goods_delivery_date" type="date"  value="${goods.goods_delivery_date }" />
								  </td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_delivery_date')"/>
								</td>
				
							</tr>
							
							<tr>
								<td >상품종류</td>
								<td>
								<select name="goods_status">
								  <option value="best">베스트셀러</option>
								  <option value="normal" >스테디셀러</option>
								</select>
								<input  type="hidden" name="h_goods_status" value="${goods.goods_status }"/>
								</td>
								<td>
								 <input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_status')"/>
								</td>
							</tr>
							<tr>
							 <td colspan=3>
							   <br>
							 </td>
							</tr>
						</table>	
					</div>
		
					<div class="tab_content" id="tab2">
						<H4>상품소개</H4>
						<table>
							<tr>
								<td>
									<textarea  rows="60" cols="80" name="goods_intro">${goods.goods_intro }</textarea>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;
						 			<input  type="button" value="수정반영"  onClick="fn_modify_goods('${goods.goods_id }','goods_intro')"/>
								</td>
							</tr>
					    </table>
					</div>
	
					<div class="tab_content" id="tab3">
						<form id="FILE_FORM" method="post" enctype="multipart/form-data" >
							<table>
								<c:forEach var="item" items="${imageFileList }"  varStatus="itemNum">
									<c:choose>
									<c:when test="${item.fileType=='main_image' }">
					        	<tr>
									<td width=200>메인 이미지</td>
									<td>
										<input type="file"  id="main_image"  name="main_image"  onchange="readURL(this,'preview${itemNum.count}');" />
										<%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
										<input type="hidden"  name="image_id" value="${item.image_id}"  />
										<br>
									</td>
									<td class="tab3-image">
									  <img  id="preview${itemNum.count }"  width=100 height=100 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" />
									</td>
									<td>
									  &nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								 	<td>
								 		<input  type="button" value="수정"  onClick="modifyImageFile('main_image','${item.goods_id}','${item.image_id}','${item.fileType}')"/>
									</td> 
								</tr>
							
     								</c:when>
							<c:otherwise>
								<tr id="${itemNum.count-1}">
									<td>상세 이미지${itemNum.count-1 }</td>
									<td>
										<input type="file" name="detail_image"  id="detail_image"   onchange="readURL(this,'preview${itemNum.count}');" />
									<%-- <input type="text" id="image_id${itemNum.count }"  value="${item.fileName }" disabled  /> --%>
										<input type="hidden"  name="image_id" value="${item.image_id }"  />
										<br>
									</td>
									<td>
										<img id="preview${itemNum.count }" src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}">
									</td>
									<td>
									  &nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										<input  type="button" value="수정"  onClick="modifyImageFile('detail_image','${item.goods_id}','${item.image_id}','${item.fileType}')"/>
										<input  type="button" value="삭제"  onClick="deleteImageFile('${item.goods_id}','${item.image_id}','${item.fileName}','${itemNum.count-1}')"/>
									</td> 
								</tr>
								<tr>
									<td>
										<br>
									</td>
								</tr> 
   							</c:otherwise>
							</c:choose>		
							</c:forEach>
								<tr align="center">
									<td colspan="3">
										<div id="d_file">
										 <%-- <img  id="preview${itemNum.count }"   width=200 height=200 src="${contextPath}/download.do?goods_id=${item.goods_id}&fileName=${item.fileName}" /> --%>
										</div>
									</td>
								</tr>
								<tr>
									<td align=center colspan=2>
										<input   type="button" value="이미지파일추가하기"  onClick="fn_addFile()">
									</td>
								</tr> 
							</table>
						</form>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>	
		<div class="clear"></div>

</BODY>				
</form>	