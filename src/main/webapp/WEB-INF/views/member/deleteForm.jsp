<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember</title>


<script type="text/javascript">
function pwCheck(){
	
	if(document.delForm.member_pw.value=='' || document.delForm.member_pw2.value==''){
		alert("암호는 필수 입력입니다.");
		document.delForm.member_pw.focus();
	}else{
		console.log("값이 두 곳에 다 들어감");
		
		if(document.getElementById('member_pw').value != document.getElementById('member_pw2').value){
			alert("비밀번호와 비밀번호확인이 다릅니다.");
			document.getElementById('member_pw').value ='';
			document.getElementById('member_pw2').value ='';
		 	document.delForm.member_pw.focus();
		 	return false;
		}
		
		return true;
	}
	
}
</script>

</head>
<body>

	탈퇴 안내
	회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.
	
	탈퇴 후 회원정보 및 개인형 서비스 이용 기록은 모두 삭제됩니다.
	
	회원정보 및 여러 개인형 서비스 이용기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.
	삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업해주세요.
	<table>
		<tr>
			<td>
				<h2>비밀번호 확인</h2>
			</td>

			<td>
				안전한 이웃사촌 탈퇴를 위해 비밀번호를 입력해 주세요. 
			</td>
		</tr>
		</table>
		
		<form name="delForm" method="post" action="${ctxpath}/member/deletePro.do" onSubmit="return pwCheck()"> <!-- 암호체크 탈퇴시 스크립트 호출 -->
		<!-- 
		<form action="${ctxpath}/member/deletePro.do" method="post" onSubmit="return pwCheck()">
		-->
		
		<table>
			<tr>
				<td>
					<input type="password" name="member_pw" id="member_pw" size="30" placeholder="암호를 입력해 주세요." >				
					<input type="hidden" name="member_id"  id="member_id" value="${member_id}">
				</td>
			</tr>

			<tr>
				<td>
					<input type="password" name="member_pw2" id="member_pw2" size="30" placeholder="암호를 다시 한번 입력해 주세요.">				
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="회원탈퇴">
				</td>
			</tr>
			 
			 <!-- 
			 <table>
			<tr>
				<td align = "center">
					암호를 입력 하세요				
				</td>
			</tr>
			
			<tr>
				<td>
					<input type="text" name="member_pw" id="member_pw">
					<input type="hidden" name="member_id" value="${member_id}">
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="회원 탈퇴">
				</td>
			</tr>
		 -->
		</table>	
			</form>

</body>
</html>