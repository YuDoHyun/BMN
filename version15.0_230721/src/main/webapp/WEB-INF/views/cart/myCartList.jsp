<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myGoodsList"  value="${cartMap.myGoodsList}"  />

<c:set  var="totalGoodsNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<head>
<script type="text/javascript">
function calcGoodsPrice(obj){
	var totalPrice,finalTotalPrice,totalNum,totalSalesPrice;
	
	var goods_price=obj.parentNode.parentNode.children[3].children[0].innerText.replace("원","");
	var goods_sales_price=obj.parentNode.parentNode.children[4].children[1].value;
	var cart_goods_qty = obj.parentNode.parentNode.children[5].children[0].value;
	
	var p_totalGoodsNum=document.getElementById("p_totalGoodsNum");
	var p_totalGoodsPrice=document.getElementById("p_totalGoodsPrice");
	var p_totalSalesPrice=document.getElementById("p_totalSalesPrice");
	var p_finalTotalPrice=document.getElementById("p_finalTotalPrice");
	
	var h_totalGoodsNum=document.getElementById("h_totalGoodsNum");
	var h_totalGoodsPrice=document.getElementById("h_totalGoodsPrice");
	var h_totalSalesPrice=document.getElementById("h_totalSalesPrice");
	var h_finalTotalPrice=document.getElementById("h_finalTotalPrice");
	
	if(obj.checked==true){
		totalNum = Number(h_totalGoodsNum.value) + 1;
		totalPrice = Number(h_totalGoodsPrice.value) + Number(goods_price) * Number(cart_goods_qty);
		totalSalesPrice = Number(h_totalSalesPrice.value) + ( Number(goods_price) - Number(goods_sales_price) ) * Number(cart_goods_qty);
		finalTotalPrice = Number(h_finalTotalPrice.value) + Number(goods_sales_price) * Number(cart_goods_qty);
	}else{
		totalNum = Number(h_totalGoodsNum.value) - 1;
		totalPrice = Number(h_totalGoodsPrice.value) - Number(goods_price) * Number(cart_goods_qty);
		totalSalesPrice = Number(h_totalSalesPrice.value) - ( Number(goods_price) - Number(goods_sales_price) ) * Number(cart_goods_qty);
		finalTotalPrice = Number(h_finalTotalPrice.value) - Number(goods_sales_price) * Number(cart_goods_qty);
	}
	
	h_totalGoodsNum.value=totalNum;
	p_totalGoodsNum.innerHTML=totalNum+"개";
	
	h_totalGoodsPrice.value=totalPrice;
	p_totalGoodsPrice.innerHTML=totalPrice+"원";
	
	h_totalSalesPrice.value=totalSalesPrice;
	p_totalSalesPrice.innerHTML=totalSalesPrice+"원";
	
	h_finalTotalPrice.value=finalTotalPrice;
	p_finalTotalPrice.innerHTML=finalTotalPrice+"원";
}

function modify_cart_qty(goods_id,bookPrice,index){
	//alert(index);
   var length=document.frm_order_all_cart.cart_goods_qty.length;
   var _cart_goods_qty=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty[index].value;		
	}else{
		_cart_goods_qty=document.frm_order_all_cart.cart_goods_qty.value;
	}
		
	var cart_goods_qty=Number(_cart_goods_qty);
	//alert("cart_goods_qty:"+cart_goods_qty);
	//console.log(cart_goods_qty);
	
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			goods_id:goods_id,
			cart_goods_qty:cart_goods_qty
		},
		
		success : function(data, textStatus) {
			//alert(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
				var newCartGoodsQty = data.cart_goods_qty;
				updateCartGoodsQty(index, cart_goods_qty);
			}else{
				alert("다시 시도해 주세요!!");	
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
function updateCartGoodsQty(index) {
		var cartGoodsQtyElement;
		var length = document.frm_order_all_cart.cart_goods_qty.length;
		
		if (length > 1) {
		  cartGoodsQtyElement = document.frm_order_all_cart.cart_goods_qty[index];
		} else {
		  cartGoodsQtyElement = document.frm_order_all_cart.cart_goods_qty;
		}
		
		//cartGoodsQtyElement = 업데이트 된 수량
		console.log(cartGoodsQtyElement.value);
		
		var oldSalesPrice = cartGoodsQtyElement.parentNode.parentNode.children[6].innerText.replace("원",""); 
		oldSalesPrice = parseFloat(oldSalesPrice.replace(/,/g, ''));
		console.log(oldSalesPrice/9*10); //세일가격을 불러와 9로나누고 10을 곱해서 정가를 구함

		var p_totalGoodsPrice=document.getElementById("p_totalGoodsPrice");
		var p_totalSalesPrice=document.getElementById("p_totalSalesPrice");
		var p_finalTotalPrice=document.getElementById("p_finalTotalPrice");
		
		var p_totalGoodsPriceText = p_totalGoodsPrice.innerText.replace("원","") //총상품금액
		p_totalGoodsPriceText = parseFloat(p_totalGoodsPriceText.replace(/,/g, ''));
		console.log(p_totalGoodsPriceText);

		var h_totalGoodsPrice=document.getElementById("h_totalGoodsPrice");
		var h_totalSalesPrice=document.getElementById("h_totalSalesPrice");
		var h_finalTotalPrice=document.getElementById("h_finalTotalPrice");
		

		var check = cartGoodsQtyElement.parentNode.parentNode.children[0].children[0]; //체크박스

		var total = cartGoodsQtyElement.parentNode.parentNode.children[6]; //합계
		
		var price = cartGoodsQtyElement.parentNode.parentNode.children[3].innerText.replace("원",""); //정가

		var salesPrice = cartGoodsQtyElement.parentNode.parentNode.children[4].innerText.replace("원(10%할인)",""); //판매가
		salesPrice = parseFloat(salesPrice.replace(/,/g, ''));
		
		var totalPrice;
		totalPrice = Number(cartGoodsQtyElement.value) * Number(salesPrice);
		total.innerHTML = totalPrice.toLocaleString() + "원";
		
		
		if (check.checked) {
			var allPrice;
			allPrice = Number(p_totalGoodsPriceText) - Number( (oldSalesPrice/9*10) ) + Number(price) * Number(cartGoodsQtyElement.value);
			p_totalGoodsPrice.innerHTML = allPrice.toLocaleString() + "원";
			h_totalGoodsPrice.value = allPrice;
			
			var allSalesPrice;
			allSalesPrice = allPrice - allPrice * 0.9;
			p_totalSalesPrice.innerHTML = allSalesPrice.toLocaleString() + "원";
			h_totalSalesPrice.value = allSalesPrice;
			
			var alllFinalPrice;
			alllFinalPrice = allPrice - allSalesPrice;
			p_finalTotalPrice.innerHTML = alllFinalPrice.toLocaleString() + "원";
			h_finalTotalPrice.value = alllFinalPrice;
		}

	
}
	
function delete_cart_goods(cart_id){
	var cart_id=Number(cart_id);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_id";
	i_cart.value=cart_id;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartGoods.do";
    formObj.submit();
}

function fn_order_each_goods(goods_id,goods_title,goods_sales_price,fileName){
	var total_price,final_total_price,_goods_qty;
	var cart_goods_qty=document.getElementById("cart_goods_qty");
	
	_order_goods_qty=cart_goods_qty.value; //장바구니에 담긴 개수 만큼 주문한다.
	var formObj=document.createElement("form");
	var i_goods_id = document.createElement("input"); 
    var i_goods_title = document.createElement("input");
    var i_goods_sales_price=document.createElement("input");
    var i_fileName=document.createElement("input");
    var i_order_goods_qty=document.createElement("input");
    
    i_goods_id.name="goods_id";
    i_goods_title.name="goods_title";
    i_goods_sales_price.name="goods_sales_price";
    i_fileName.name="goods_fileName";
    i_order_goods_qty.name="order_goods_qty";
    
    i_goods_id.value=goods_id;
    i_order_goods_qty.value=_order_goods_qty;
    i_goods_title.value=goods_title;
    i_goods_sales_price.value=goods_sales_price;
    i_fileName.value=fileName;
    
    formObj.appendChild(i_goods_id);
    formObj.appendChild(i_goods_title);
    formObj.appendChild(i_goods_sales_price);
    formObj.appendChild(i_fileName);
    formObj.appendChild(i_order_goods_qty);

    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/orderEachGoods.do";
    formObj.submit();
}

function fn_order_all_cart_goods(){
//	alert("모두 주문하기");
	var order_goods_qty;
	var order_goods_id;
	var objForm=document.frm_order_all_cart;
	var cart_goods_qty=objForm.cart_goods_qty;
	var h_order_each_goods_qty=objForm.h_order_each_goods_qty;
	var checked_goods=objForm.checked_goods;
	var length=checked_goods.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_goods[i].checked==true){
				order_goods_id=checked_goods[i].value;
				order_goods_qty=cart_goods_qty[i].value;
				cart_goods_qty[i].value="";
				cart_goods_qty[i].value=order_goods_id+":"+order_goods_qty;
				//alert(select_goods_qty[i].value);
				console.log(cart_goods_qty[i].value);
			}
		}	
	}else{
		order_goods_id=checked_goods.value;
		order_goods_qty=cart_goods_qty.value;
		cart_goods_qty.value=order_goods_id+":"+order_goods_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartGoods.do";
	objForm.submit();
}

</script>
</head>
<body>
<div id="container">
	<div id="content">
	<div class="myCart-wrap">
		<form name="frm_order_all_cart">
			<table class="list_view">
				<tbody align=center >
					<tr style="background:#1a1a1a; color: #fff;" >
						<td class="fixed" colspan=2>구분</td>
						<td class="fixed">상품명</td>
						<td>정가</td>
						<td>판매가</td>
						<td>수량</td>
						<td>합계</td>
						<td>주문</td>
					</tr>
					
					<c:choose>
					    <c:when test="${ empty myCartList }">
							<tr>
							   <td colspan=8 class="fixed">
							     <strong>장바구니에 상품이 없습니다.</strong>
							   </td>
							</tr>
					    </c:when>
			        	<c:otherwise>
				        	<c:forEach var="item" items="${myGoodsList }" varStatus="cnt">
				        	<c:set var="cart_goods_qty" value="${myCartList[cnt.count-1].cart_goods_qty}" />
							<c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
					 		<tr>       
					 			<td>
									<input type="checkbox" name="checked_goods"  checked  value="${item.goods_id }"  onClick="calcGoodsPrice(this)">
								</td>
								<td class="goods_image">
									<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">
										<img width="75" alt="" src="${contextPath}/thumbnails.do?goods_id=${item.goods_id}&fileName=${item.goods_fileName}"  />
									</a>
								</td>
								<td>
									<h2>
										<a href="${contextPath}/goods/goodsDetail.do?goods_id=${item.goods_id }">${item.goods_title }</a>
									</h2>
								</td>
								<td class="price"><span id="goods_price">${item.goods_price }원</span></td>
								<td>
							   		<strong>
								      <fmt:formatNumber  value="${item.goods_sales_price}" type="number" var="discounted_price" />${discounted_price}원(10%할인)
							        </strong>
							        <input type="hidden" id="goods_sales_price" value="${item.goods_sales_price}">
								</td>
								<td>
							   		<input type="text" id="cart_goods_qty" class="cart_goods_qty" name="cart_goods_qty" size=3 value="${cart_goods_qty}"><br>
									<a href="javascript:modify_cart_qty(${item.goods_id },${item.goods_sales_price },${cnt.count-1 });" >
									    <img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
									</a>
								</td>
								<td>
							   		<strong>
								    	<fmt:formatNumber  value="${item.goods_sales_price*cart_goods_qty}" type="number" var="total_sales_price" />${total_sales_price}원
									</strong>
								</td>
								<td class="mycart-btn">
						      		<a href="javascript:fn_order_each_goods('${item.goods_id }','${item.goods_title }','${item.goods_sales_price}','${item.goods_fileName}');">
							       		주문하기</a>			
									<a href="javascript:delete_cart_goods('${cart_id}');">삭제하기</a>
								</td>
							</tr>
							<c:set  var="totalGoodsPrice" value="${totalGoodsPrice+item.goods_price*cart_goods_qty }" />
							<c:set  var="totalGoodsNum" value="${totalGoodsNum+1 }" />
							<c:set  var="totalDiscountedPrice" value="${totalDiscountedPrice+(item.goods_price - item.goods_sales_price) * cart_goods_qty}" />
							</c:forEach>
							</c:otherwise>
						</c:choose> 
						</tbody>
					</table>
					<br>
					<table width=80% class="list_view" >
						<tbody>
						     <tr align=center  class="fixed" style="background:#1a1a1a; color: #fff;">
						       <td class="fixed">총 상품수 </td>
						       <td>총 상품금액</td>
						       <td>  </td>
						       <td>총 배송비</td>
						       <td>  </td>
						       <td>총 할인 금액 </td>
						       <td>  </td>
						       <td>최종 결제금액</td>
						     </tr>
							<tr cellpadding=40  align=center >
								<td id="">
								  <p id="p_totalGoodsNum">${totalGoodsNum}개 </p>
								  <input id="h_totalGoodsNum"type="hidden" value="${totalGoodsNum}"  />
								</td>
						       <td>
						          <p id="p_totalGoodsPrice">
						          <fmt:formatNumber  value="${totalGoodsPrice}" type="number" var="total_goods_price" />
									         ${total_goods_price}원
						          </p>
						          <input id="h_totalGoodsPrice"type="hidden" value="${totalGoodsPrice}" />
						       </td>
						       <td> 
						          <img width="25" alt="" src="${contextPath}/resources/image/plus.jpg">  
						       </td>
						       <td>
						         <p id="p_totalDeliveryPrice">${totalDeliveryPrice }원  </p>
						         <input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
						       </td>
						       <td> 
						         <img width="25" alt="" src="${contextPath}/resources/image/minus.jpg"> 
						       </td>
						       <td>  
						         <p id="p_totalSalesPrice"> 
									         ${totalDiscountedPrice}원
						         </p>
						         <input id="h_totalSalesPrice"type="hidden" value="${totalDiscountedPrice}" />
						       </td>
						       <td>  
						         <img width="25" alt="" src="${contextPath}/resources/image/equal.jpg">
						       </td>
						       <td>
						          <p id="p_finalTotalPrice">
						          <fmt:formatNumber  value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
						            ${total_price}원
						          </p>
						          <input id="h_finalTotalPrice" type="hidden" value="${totalGoodsPrice+totalDeliveryPrice-totalDiscountedPrice}" />
						       </td>
							</tr>
							</tbody>
						</table>
						<ul class="cart-btn">
							<li>
								<a href="javascript:fn_order_all_cart_goods()">결제하기</a>
							</li>
							<li>
								<a href="${contextpath }/main/main.do">쇼핑계속하기 </a>
							</li>
						</ul>	
	
			</form>	
		</div>
	</div>
</div>
