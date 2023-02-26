<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<!-- 암호 찾기 창 -->

<form name="pw_search" action ="${ctxpath}/member/search_pwd_next.do" method="POST" align = "center">

<div class="pw_search_checkbox">
	
	비밀번호를 찾고자 하는 아이디를 적어주세요.
	<br>	
	<input type="text" name="writeID_search_pw" id="writeID_search_pw" size="30">
	<br>	
	<input type="submit" name="search" value="다음" onClick="location='${ctxpath}/member/search_pwd_next.do'">
	<!-- form >pro > form>pro로 controller이랑 왓다갓다 해야하는걸지도.... -->
<hr>
</div>
<div align="center">
	아이디가 기억나지 않는다면?<a href="search_id.do">아이디 찾기</a>
</div>


</form>

</body>
</html>