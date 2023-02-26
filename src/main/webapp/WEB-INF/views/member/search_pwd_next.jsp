<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호찾기_전화번호입력창</title>
</head>
<body>

<form name="search_pwd_next" action="search_pw_pro" method="POST">
<h1>비밀번호</h1>
<div class="id_search_checkbox">
	<input type="radio" name="for_search_id" id="search_tel" checked>회원정보에 등록한 휴대전화 번호로 찾기
	
	<br>회원 정보에 등록한 휴대전화 번호와 입력하신 휴대전화 번호가 같아야 아이디를 찾을 수 있습니다.
	<br>
	<br>
	
	이름<input type="text" name="search_tel_name" id="search_tel_name" size="20">
	휴대전화 <input type="text" name="search_tel_number" id="search_tel_number" size="20">
	
	
	<hr>
	<input type="radio" name="for_search_id" id="search_email">이메일에 등록한 휴대전화 번호로 찾기
	
</div>

<div align = "center">
	<input type="submit" name="search" value="아이디 찾기">
</div>


</form>
</body>
</html>