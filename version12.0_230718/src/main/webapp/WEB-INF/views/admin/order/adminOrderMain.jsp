<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="${contextPath}/resources/css/adminOrder.css" rel="stylesheet" type="text/css"> 
<link href="${contextPath}/resources/css/pagenav.css" rel="stylesheet" type="text/css"> 
<c:choose>
<c:when test='${not empty order_goods_list}'>
<script  type="text/javascript">
window.onload=function()
{
	init();
}

//화면이 표시되면서  각각의 주문건에 대한 배송 상태를 표시한다.
function init(){
	var frm_delivery_list=document.frm_delivery_list;
	var h_delivery_state=frm_delivery_list.h_delivery_state;
	var s_delivery_state=frm_delivery_list.s_delivery_state;
	
	
	if(h_delivery_state.length==undefined){
		s_delivery_state.value=h_delivery_state.value; //조회된 주문 정보가 1건인 경우
	}else{
		for(var i=0; s_delivery_state.length;i++){
			s_delivery_state[i].value=h_delivery_state[i].value;//조회된 주문 정보가 여러건인 경우
		}
	}
}
</script>
</c:when>
</c:choose>
<script>
function fn_modify_order_state(order_id,select_id){
	var s_delivery_state=document.getElementById(select_id);
    var index = s_delivery_state.selectedIndex;
    var value = s_delivery_state[index].value;
    //console.log("value: "+value );
	 
	$.ajax({
		type : "post",
		async : false,
		url : "${contextPath}/admin/order/modifyDeliveryState.do",
		data : {
			order_id:order_id,
			"delivery_state":value
		},
		success : function(data, textStatus) {
			if(data.trim()=='mod_success'){
				alert("주문 정보를 수정했습니다.");
				location.href="${contextPath}/admin/order/adminOrderMain.do";
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
</script>
<script type="text/javascript">
	var loopSearch=true;
	function keywordSearch(){
		if(loopSearch==false)
			return;
	 var value=document.frmSearch.searchWord.value;
		$.ajax({
			type : "get",
			async : true, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/admin/customer/NoticekeywordSearch.do",
			data : {keyword:value},
			success : function(data, textStatus) {
			    var jsonInfo = JSON.parse(data);
				displayResult(jsonInfo);
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax	
	}
</script>
</head>
<body>
<div id="page-nav-wrap">
	<div id="page-nav">
		<div class="titlediv">
			<span class="customer-title">주문관리</span>
		</div>
    </div>
</div>
<div class="boardwrap">
    <div class="border-qna-wrap">
	    <div class="board-buttondiv">
            <div class="searchdiv">
            	<form action="" >
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
	        </div>
	    </div>
		<div>
			<table class="noticeAdmin-table">
				<tbody align=center >
					<tr>
						<td class="noticeAdmin-title">주문번호</td>
						<td class="noticeAdmin-title">주문일자</td>
						<td class="noticeAdmin-title">주문내역</td>
						<td class="noticeAdmin-title">배송상태</td>
						<td class="noticeAdmin-title">배송수정</td>
		 			</tr>
		   			<c:choose>
		     			<c:when test="${empty newOrderList}">			
							<tr>
				       			<td colspan=5 class="fixed">
						  		<strong>주문한 상품이 없습니다.</strong>
					  		</td>
				     		</tr>
			 			</c:when>
			 			<c:otherwise>
		     			<c:forEach var="item" items="${newOrderList}" varStatus="i">
		        			<c:choose>
		          				<c:when test="${item.order_id != pre_order_id }">  
		            			<c:choose>
									<c:when test="${item.delivery_state=='delivery_prepared' }">
										<tr  bgcolor="lightgreen">    
									</c:when>
									<c:when test="${item.delivery_state=='finished_delivering' }">
										<tr  bgcolor="lightgray">    
									</c:when>
									<c:otherwise>
										<tr  bgcolor="orange">   
									</c:otherwise>
								</c:choose>   

								<td class="noticeAdmin-td2">
									<a href="${pageContext.request.contextPath}/admin/order/orderDetail.do?order_id=${item.order_id}">
										<strong>${item.order_id}</strong>
									</a>
								</td>
								<td class="noticeAdmin-td3">
									<a class="notice-view" href="${pageContext.request.contextPath}/admin/order/orderDetail.do?order_id=${item.order_id}">${item.pay_order_time}</a>
								</td>
								<td class="noticeAdmin-td4">
									<a class="notice-view" href="${pageContext.request.contextPath}/admin/order/orderDetail.do?order_id=${item.order_id}">
										주문자:${item.orderer_name}<br>
										주문자 번화번호:${item.orderer_hp}<br>
										수령자:${item.receiver_name}<br>
										수령자 번화번호:${item.receiver_hp1}-${item.receiver_hp2}-${item.receiver_hp3}<br>
										주문상품명(수량):${item.goods_title}(${item.order_goods_qty})<br>
										<c:forEach var="item2" items="${newOrderList}" varStatus="j">
											<c:if test="${j.index > i.index }" >
												<c:if  test="${item.order_id ==item2.order_id}" >
													<strong>주문상품명(수량):${item2.goods_title}(${item2.order_goods_qty})</strong><br>
												</c:if>   
											</c:if>
										</c:forEach> 
									</a>
								</td>
								<td class="noticeAdmin-td5">
									<select name="s_delivery_state${i.index }"  id="s_delivery_state${i.index }">
									<c:choose>
									<c:when test="${item.delivery_state=='delivery_prepared' }">
										<option  value="delivery_prepared" selected>배송준비중</option>
										<option  value="delivering">배송중</option>
										<option  value="finished_delivering">배송완료</option>
										<option  value="cancel_order">주문취소</option>
										<option  value="returning_goods">반품</option>
									</c:when>
										<c:when test="${item.delivery_state=='delivering' }">
										<option  value="delivery_prepared" >배송준비중</option>
										<option  value="delivering" selected >배송중</option>
										<option  value="finished_delivering">배송완료</option>
										<option  value="cancel_order">주문취소</option>
										<option  value="returning_goods">반품</option>
									</c:when>
									<c:when test="${item.delivery_state=='finished_delivering' }">
										<option  value="delivery_prepared" >배송준비중</option>
										<option  value="delivering"  >배송중</option>
										<option  value="finished_delivering" selected>배송완료</option>
										<option  value="cancel_order">주문취소</option>
										<option  value="returning_goods">반품</option>
									</c:when>
									<c:when test="${item.delivery_state=='cancel_order' }">
										<option  value="delivery_prepared" >배송준비중</option>
										<option  value="delivering"  >배송중</option>
										<option  value="finished_delivering" >배송완료</option>
										<option  value="cancel_order" selected>주문취소</option>
										<option  value="returning_goods">반품</option>
									</c:when>
									<c:when test="${item.delivery_state=='returning_goods' }">
										<option  value="delivery_prepared" >배송준비중</option>
										<option  value="delivering"  >배송중</option>
										<option  value="finished_delivering" >배송완료</option>
										<option  value="cancel_order" >주문취소</option>
										<option  value="returning_goods" selected>반품</option>
									</c:when>
									</c:choose>
								 </select> 
				            	</td>
				            	<td class="noticeAdmin-td6">
				               		<input  type="button" value="배송수정"  onClick="fn_modify_order_state('${item.order_id}','s_delivery_state${i.index}')"/>
				            	</td> 
								</c:when>
							</c:choose>	
							<c:set  var="pre_order_id" value="${item.order_id }" />
						</c:forEach>
						</c:otherwise>
	  				</c:choose>			   
				</tbody>
			</table>
			<div id="pagenav">
				 	<div class="container-fluid">
						<div class="row">
						  <ul class="pagination">
							<c:forEach   var="page" begin="1" end="5" step="1" >
						         <c:if test="${ page == 1 }">
						          	<a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &lt &nbsp;</a>
						         </c:if>
						          	<a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
						         <c:if test="${page == 5 }">
						          	<a href="${contextPath}/admin/order/adminOrderMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; &gt &nbsp;</a>
						         </c:if> 
				      		</c:forEach> 
						  </ul>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>
</body>
</html>

