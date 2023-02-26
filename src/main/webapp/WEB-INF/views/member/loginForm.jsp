<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>

<style type="text/css">
table{
text-align : center;
}
</style>

<script type="text/javascript">
function idpwCheck(){
	if(document.loginForm.member_id.value==''){
		alert("아이디를 입력하세요.");
		document.loginForm.member_id.focus();
		return false;
	}
	
	if(document.loginForm.member_pw.value==''){
		alert("암호를 입력하세요.");
		document.loginForm.member_pw.focus();
		return false;
	}
}


	<%String cookie = "";
	Cookie[] cookies = request.getCookies(); //쿠키생성
	if(cookies !=null&& cookies.length > 0)
	for (int i = 0; i < cookies.length; i++){
	if (cookies[i].getName().equals("member_id")) { // 받아온 쿠키의 이름과 (< 값말고!!) member_id 비교하기  
		// Controller 참조 :: Cookie cookie = new Cookie("member_id", member_id);
		cookie = cookies[i].getValue();}}%>
</script>
</head>
<body>

<pre>
<h2>이웃사촌을 
방문해주셔서 감사합니다.</h2>
</pre>


<form name="loginForm" method="post" action="${ctxpath}/member/loginPro.do" onSubmit="return idpwCheck()">

<table align ="center">
	<tr>
		<td>
			<input type="text" id="member_id" name="member_id" size="30" value="<%=cookie%>" placeholder="아이디">
		
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="password" id="member_pw" name="member_pw" size="30" placeholder="비밀번호">
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="checkbox" name="rememberId" value="true" >아이디 저장
			<a href="${ctxpath}/member/search_main.do">아이디/비밀번호 찾기</a>
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="로그인">
		</td>
	</tr>
	
	<tr><td>
	<p>회원이 아니시라면,지금 회원에 가입해보세요.</p>
	</td></tr>
	<tr>
		<td>
			<input type="button" onclick="location='${ctxpath}/member/insertForm.do'" value="회원가입">
		</td>
	</tr>
	
			
	<tr>
			<td>
				<hr>
			</td>
		</tr>	

</table>
	

</form>

</body>
</html>