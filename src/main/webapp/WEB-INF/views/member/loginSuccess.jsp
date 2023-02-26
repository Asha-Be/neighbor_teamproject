<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginSuccess.jsp</title>
</head>
<body>
	 <c:set var="member_id" value="${dto.member_id}" scope="session"/>
	 <c:set var="member_name" value="${dto.member_name}" scope="session"/>
	<meta http-equiv="Refresh" content="0;url=${ctxpath}">
</body>
</html>