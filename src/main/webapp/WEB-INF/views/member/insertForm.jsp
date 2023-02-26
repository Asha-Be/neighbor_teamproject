<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/tistory_admin/lib/jquery/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 <script type="text/javascript" src="${ctxpath}/resources/js/member_insertForm/checkAll.js"></script>
 
 
	<style type="text/css">
	table{
	text-align : center;
	}
	</style>

    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
 
   function openDaumPostcode(){
      new daum.Postcode({
         oncomplete:function(data){
            document.getElementById('member_zipcode').value=data.zonecode;
            document.getElementById('member_addr').value=data.address;
          }
      }).open();
   }//openDaumPostcode()---
  

	
   function confirmIdCheck(){
  		 
  	 	var id_validation = /^[a-zA-Z0-9]{6,12}$/;
  		
  	 	
  	
  	    if($('#member_id').val()==''){
  	       //alert("ID를 입력하세요");
  	    	$("#olmessage").text("아이디를 입력하세요.");
  	    }
  	    //******************************
  	    else if(id_validation.test($('#member_id').val())){
  				console.log("정규표현식에 맞음 성공");
  			  				
  				//-------------------
  			      $.ajax({
  			         type:'POST',
  			         url:'${ctxpath}/member/idCheck.do',
  			         data:"member_id="+$('#member_id').val(),
  			         dataType:'JSON',
  			         success:function(data){
  			        	 
  			            if(data.check==-1){
  			               //alert("사용 중인 ID입니다.");
  			             	$("#olmessage").text("이미 사용중인 아이디 입니다.");
  			             	$("#olmessage").addClass("oldmessagef");
  			             	$("#olmessage").removeClass("olmessaget");
  			               $('#member_id').value="";
  			               $('#member_id').val('').focus();
  			               
  			            }else if(data.check==1){
			  			    console.log("ajax 성공");
  			             	$("#olmessage").text("사용 가능한 아이디 입니다.");
  			             	$("#olmessage").addClass("oldmessaget");
  			             	$("#olmessage").removeClass("olmessagef"); //oldmessage에 각각 클래스를 입혔다가 지우는 행동을 하는 이유는
  			             							//성공시와 실패시에 각각의 글씨에 다른 스타일을 적용하기 위해 (oldmessaget는 성공 oldmessagef는 실패)
  			           //    alert("사용 가능 한 ID입니다.");
  			               $('#member_pw').focus();
  			               
  			           
  			            }
  			         }//success
  			       });
  				
  	   	 }else if(!id_validation.test($('#member_id').val())){
  	   		 console.log("정규표현식에 맞지 않음 실패"); 
  	   		 //alert("6~12자리의 영문 대소문자, 숫자로 이루어진 아이디를 작성하시오.");
  			$("#olmessage").text("6~12자리의 영문 대소문자, 숫자로 이루어진 아이디를 작성하시오.");
           	$("#olmessage").addClass("olmessagef");
           	$("#olmessage").removeClass("olmessaget");
  	   		 $('#member_id').value='';
  			$('#member_id').focus();
  			
  			return false;
  	 }   //elseif-end
  
	             	$("#olmessage").text(""); //얘만 안되는 이유를 모르겠음 ㅡㅡ
  			       return true;
   }//confirmIdCheck() end	   
  	    //*******************************
   
   
   function confirmEmailCheck(){
		

		var email_validation = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
		
		if($('#member_email').val()== ''){
			return false;
		}
		else if(email_validation.test($('#member_email').val())){
	  				console.log("정규표현식에 맞음 성공");
	  				
	  				
				 	return true;
	  	   	 }else if(!email_validation.test($('#member_email').val())){
	  	   		 console.log("정규표현식에 맞지 않음 실패"); 
	  	   		 alert("이메일을 옳게 작성하였는지 확인해주세요.");
		  	   	$('#member_email').val('');
	  			$('#member_email').focus();
	  	 }   //elseif-end
	  	 
	}//confirmEmailCheck-end
	
	//--------------------------------------
	
	function viewTerms(event){

	event.preventDefault();
	
	window.open(event.target.href,"팝업", "width=500,height=700,left=100, top=50,scrollbars=no, resizable=no, toolbar=no, menubar=no");
		//mac에선 팝업창 크기가 적용이 안되는데 왜 그런지 확인하기
	}
	
	//----------------------------------------
	

   </script>

</head>
<body>
	<h1>회원가입</h1>

	<form action="${ctxpath}/member/insertPro.do" method="post" onsubmit="return memberCheck();">
		<table align ="center">
			<tr>
				<td>아이디</td>
				<td class="dupcheck_class">
					<input type="text" name="member_id" id="member_id" size="20" placeholder="6-12자의 영문 대소문자, 숫자">
					<input type="button" value="ID중복 체크" id="dupcheck" onClick="confirmIdCheck();">
					<span id="olmessage"></span>					
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="member_pw" id="member_pw" size="30" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자" >				
					<span id="password-error" style="color:red;"></span>
				</td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" name="member_pw2" id="member_pw2" size="30" placeholder="8~15자리의 영문 대소문자, 숫자, 특수문자"
					onblur="confirmPwCheck();
					return false;">				
				</td>
			</tr>
			
			<tr>
				<td>성명, 단체명</td>
				<td>
					<input type="text" name="member_name" id="member_name" size="30" placeholder="성명·단체명 입력">				
				</td>
			</tr>
			
			<tr>
				<td>이메일 주소</td>
				<td>
					<input type="text" name="member_email" id="member_email" size="30" placeholder="이메일 주소 입력" onblur="confirmEmailCheck();
					return false;"
					>				
				</td>
			</tr>
			
			<tr>
				<td>휴대폰 번호</td>
				<td>
					<input type="text" name="member_tel" id="member_tel" size="30" placeholder="휴대폰 번호 입력('-'제외)" onblur="confirTelCheck(); return false;"
					>			
				</td>
			</tr>
			
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="member_zipcode" id="member_zipcode" size="7" readonly placeholder="우편번호 입력">	
					<input type="button" value="주소찾기" onClick="openDaumPostcode()">			
				</td>
			</tr>
			
			<tr>
	 		
	 			<td>
	 				<input type="text" name="member_addr" id="member_addr" size="50" readonly>
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			
	 			<td><input type="text" name="member_addr2" id="member_addr2" size="40"></td>
	 		</tr>
	 		
			<tr>
				<td>
	 				<h2>약관 및 개인정보 수집·이용 동의</h2>		
				</td>
			</tr>
		
				 
				 <div>
			<table class="checkbox_group" align = "center">
				<tr>
					<td>
						<input type="checkbox" id="check_all">
						<label for=check_all>모두 동의합니다.</label>
					</td>
				</tr>
			<tr>
				<td>
					<hr>
				</td>
			</tr>
			
			<tr>  
			      <td>
			        <input type="checkbox" id="agree_TermsofUse" class="normal">
			        <label for="agree_TermsofUse">[필수] 웹사이트 이용약관 동의</label>
			        <a href="agree_TemsofUse.do" onclick="viewTerms(event)">보기</a>
			      </td>
			    </tr>
			    <tr>
			      <td>
			        <input type="checkbox" id="agree_Privacy" class="normal">
			        <label for="agree_Privacy">[필수] 개인정보 수집 ∙ 이용 동의</label>
			        <a href="agree_Privacy_popup.do" onclick="viewTerms(event)">보기</a>
			        <span id="agreeMessage"></span>
			      </td>
			    </tr>
			    <tr>
				   	<td>
					
						<input type="submit" value="가입하기" onclick="return agree_check();" >
					
					</td>
					
				</tr>
			 </table>
				</div>
			
			
			<script> 
			//체크박스 선택 이벤트 스크립트
			
			$(".checkbox_group").on("click", "#check_all", function () {
			    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
			});
			
			// 체크박스 개별 선택
			$(".checkbox_group").on("click", ".normal", function() {
			    var is_checked = true;
			
			    $(".checkbox_group .normal").each(function(){
			        is_checked = is_checked && $(this).is(":checked");
			    });
			
			    $("#check_all").prop("checked", is_checked);
			});
			
			</script>
		<!-- 
		일반적으로 script를 body 안에 작성하는 경우는 많다..
		이유인즉슨 DOM (Document Object Model - 문서 객체 모델)로드가 모두 완료된 후에 script를 실행해야 하는 경우가 많기때문
		체크박스 체크 시 해당 체크박스들을 제어해야 하는데
		body 내에 모든 체크박스가 로드된 후여야 자바스크립트에서 해당 체크박스들을 제어할 수 있게 되는 것 --> 
				
		
			
		</table>
	</form>
	
	
</body>
</html>

