<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logOut.jsp</title>
</head>
<body>

	<!-- 세션 무효화 -->

	<c:remove var="member_id" scope="session"/>
	<c:remove var="member_name" scope="session"/>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}">
</body>
</html>