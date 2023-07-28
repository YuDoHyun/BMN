<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link href="${contextPath}/resources/css/faq.css" rel="stylesheet" type="text/css">


    <div class="customerwrap">
        <div class="titlediv">
            <span class="customer-title">고객센터</span>
        </div>
        
        <div id="customer-session-menu">
            <input onClick="location.href='notice'" type="button" class="customerservice button-bgcolor" id="left-button" value="공지사항">
            <input type="button" class="customerservice" id="right-button" value="FAQ">
        </div>
        
        
        <div id="faq">
            <table class="customer-table">
                <tr class="table-head">
                    <td class="table-td1">번호</td>
                    <td class="table-td2">제목</td>
                    <td class="table-td3">작성일</td>
                </tr>
                <c:forEach var="list" items="${list}" varStatus="status">
                <tr class="table-tr" id="${ status.index }">
                    <td class="td1">${ list.faq_idx }</td>
                    <td class="td2">${ list.faq_title }</td>
                    <td class="td3"><fmt:formatDate value="${ list.faq_date }" pattern = "yyyy-MM-dd"/></td>
                </tr>
                <tr>
                	<td colspan="3"><div class="content" id="content${ status.index }" style="text-align: center; display: none; border-bottom: 1px solid #ebebeb; padding: 20px">${ list.faq_content }</div></td>
                </tr>
                </c:forEach>
            </table>

            <div class="customer-search">
			    <form action="faq_search">
                <input type="text" class="searchbar" name="keyword">
                <input type="submit" class="searchbutton" value="검색">
		        </form>
                <input onClick="location.href='one2one'" type="button" class="onetoone" value="1:1문의하기">
            </div>
        </div>
    </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
        	$(".table-tr").click(function (){
                var id = $(this).attr("id");
                $(".content").slideUp(400);
                if($("#content"+id).is(":visible") != true){
                    $("#content"+id).slideDown(400);
                }else{
                    $("#content"+id).slideUp(400);
                }
                
        	})
        </script>
