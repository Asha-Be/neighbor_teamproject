<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<style type="text/css">
	table{
	text-align : center;
	}
	</style>
	
	
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="${ctxpath}/resources/js/member_insertForm/checkAll.js"></script>
    


    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script>
	function deleteMember(){
		document.delForm.action="${ctxpath}/member/deleteForm.do";
		document.delForm.submit();
	}
	</script>
   <script>
	
   function openDaumPostcode(){
      new daum.Postcode({
         oncomplete:function(data){
            document.getElementById('member_zipcode').value=data.zonecode;
            document.getElementById('member_addr').value=data.address;
          }
      }).open();
   }//openDaumPostcode()---
  
   

   
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
	  			return false;
	  	 }   //elseif-end
	  	 
	}//confirmEmailCheck-end
	
	//--------------------------------------
	
	function viewTerms(event){

	event.preventDefault();
	
	window.open(event.target.href,"팝업", "width=500,height=700,left=100, top=50,scrollbars=no, resizable=no, toolbar=no, menubar=no");
		
	}
	


   </script>
</head>
<body>
	
	<form action="${ctxpath}/member/updatePro.do"  method = "post" onsubmit="return memberCheck();">
	
	<table align="center">	
		<tr>
			<td>
				${dto.member_id}
				<input type="hidden" name="member_id" value="${dto.member_id}">
			</td>
			
		</tr>
		
		<tr>
				<td>이름</td>
				<td><input type="text" name="member_name" id="member_name" value="${dto.member_name}" size="20"></td>
			</tr>
			
			
			<tr>
				<td>전화번호</td>	
				<td><input type="text" name="member_tel" id="member_tel" value="${dto.member_tel}" size="40"></td>
				
				
			</tr>

			<tr>
				<td>이메일</td>	
				<td><input type="text" name="member_email" id="member_email" value="${dto.member_email}" size="40"></td>
				
				
			</tr>
			
			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="member_zipcode" id="member_zipcode" value="${dto.member_zipcode}" readonly>
					<input type="button" value="주소찾기" onClick="openDaumPostcode()">
				</td>
			</tr>
			
			<tr>
	 			<td>주소</td>
	 			<td>
	 				<input type="text" name="member_addr" id="member_addr" size="50" value="${dto.member_addr}" readonly>
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td>상세주소</td>
	 			<td><input type="text" name="member_addr2" id="member_addr2" value="${dto.member_addr2}" size="40"></td>
	 		</tr>		
	 		
	 			<tr>
				<td colspan="2" align="center">
				
					<input type="submit" value="내 정보 수정" >
					
					<input type="button" value="회원탈퇴"  onClick="javascript:deleteMember()">
					<input type="button" onClick="location='${ctxpath}'" value="메인으로">
						</td>
				
			</tr>
			
		</table>
	</form>

	
	<form name="delForm" method="post">
		<input type="hidden" name="member_id" value="${member_id}">
	</form>
</body>
</html>