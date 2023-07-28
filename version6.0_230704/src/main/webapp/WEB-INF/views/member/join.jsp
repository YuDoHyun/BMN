<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
	<link rel="stylesheet" href="/css/Member/join.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

    <div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 회원가입
        </div>
    </div>
        <div class="join-step">
            <span id="step-font" class="step-font">STEP1.약관동의</span>
            <span class="step-font">></span>
            <span class="step-font">STEP2.회원정보 입력</span>
            <span class="step-font">></span>
            <span class="step-font">STEP3.가입완료</span>
        </div>
        <!-- -------------------------------------------------------------------------------------------------------- -->
        <form action="join_form" method="POST" id="form_wrap" onsubmit="return checkbox_Check();" >
        <div class="join-check">
            <div id="join-agree">
                <input type="checkbox" name="yellowCheckbox1" id="yellowCheckbox1">
                <label for="yellowCheckbox1" class="yellowCheckbox"></label>
                <span>가입 약관 모두 동의</span>
            </div>
            <div class="join-agree testcss" id="testcss">
                <input type="checkbox" name="checkBox" id="yellowCheckbox2" value="0">
                <label for="yellowCheckbox2" class="yellowCheckbox"></label>
                <span>멍냥남매 서비스 이용약관 (필수)</span>
            </div>
            <div class="join-provision">
                <span class="provision">[이용약관]</span><br><br>
                <span class="provision-content">제1조 (목적)<br>
                이 약관은 (주) 멍냥남매(전자상거래 사업자)가 운영하는 (주)멍냥남매 몰(이하 "몰"이라한다) 에서 제공하는 인터넷 관련 서비스(이하 "서비스" 라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
                제2조 (정의)<br>1. "몰"이란 (주)멍냥남매가 재화 또는 용역(이하 "재화 등" 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
                2. "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</span>
            </div>
            <div class="join-agree">
                <input type="checkbox" name="checkBox" id="yellowCheckbox3" value="1">
                <label for="yellowCheckbox3" class="yellowCheckbox"></label>
                <span>개인정보 수집 및 이용약관 (필수)</span>
            </div>
            <div class="join-provision">
                <span class="provision">[개인정보 수집 및 이용 목적]</span><br><br>
                <span class="provision-content">제1조 (목적)<br>
                이 약관은 (주) 멍냥남매(전자상거래 사업자)가 운영하는 (주)멍냥남매 몰(이하 "몰"이라한다) 에서 제공하는 인터넷 관련 서비스(이하 "서비스" 라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
                제2조 (정의)<br>1. "몰"이란 (주)멍냥남매가 재화 또는 용역(이하 "재화 등" 이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>
                2. "이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</span>
            </div>


        </div>
        <div id="join-bottom">
          <button id="join-cancel" class="join-button">취소</button>
          <button id="join-confirm" class="join-button">확인</button>
        </div>

        </form>

</body>

<script type="text/javascript">	
	$(document).ready(function() {
		$("#yellowCheckbox1").click(function() {
      var provision = document.getElementsByClassName("join-provision");
			if($("#yellowCheckbox1").is(":checked")){
        $("input[name=checkBox]").prop("checked", true);
        for(var i = 0 ; i < provision.length; i++){
        	provision[i].classList.add('display-none');
        }
      }
			else{
        $("input[name=checkBox]").prop("checked", false); 
        for(var i = 0 ; i < provision.length; i++){
        	provision[i].classList.remove('display-none');
        }
      }
		});

		$("input[name=checkBox]").click(function() {
      var num = $(this)[0].value;
      var provision = document.getElementsByClassName("join-provision")[num];
      if(provision.classList.contains('display-none') == false){
        provision.classList.add('display-none');
      }else{
        provision.classList.remove('display-none');
      }

			var total = $("input[name=checkBox]").length;
			var checked = $("input[name=checkBox]:checked").length;

			if(total != checked){
        $("#yellowCheckbox1").prop("checked", false);
      } 
			else{
         $("#yellowCheckbox1").prop("checked", true); 
      }
		});
	});
  
  function checkbox_Check(){    	
      if ($("input:checkbox[name=yellowCheckbox1]").is(":checked") == true) {
        if ($("input:checkbox[name=yellowCheckbox2]").is(":checked") == true){
          $(".join-agree:nth-child(1)").css("border-top","none");
        }else{$(".join-agree:nth-child(1)").css("border-top","1px solid #292929;");}
        return true;  
      } alert("모두 동의후 회원가입 가능합니다."); return false;   }
	
</script>

</html>