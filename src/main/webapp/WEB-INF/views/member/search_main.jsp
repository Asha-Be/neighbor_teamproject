<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table align="center">
	<tr>
		<td>
			<input type="button" onclick="location='${ctxpath}/member/search_id.do'" value="아이디 찾기">
	
			<input type="button" onclick="location='${ctxpath}/member/search_pwd.do'" value="비밀번호 찾기">
		</td>
	</tr>
	
</table>

</body>
</html>