<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../module/ctxpath.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>

 <script type="text/javascript">
   function updateMember(){
	   document.updateMember.action="${ctxpath}/member/updateMember.do";
	   document.updateMember.submit();
   }
  
   function deleteMember(){
	   document.delForm.action="${ctxpath}/member/deleteForm.do";
	   document.delForm.submit();
   }
  </script>
  
</head>
<body>
	<table border="0" style="width:100%;min-width:50%;">
	  <tr>
	    <td align="left">
	    <a href="${ctxpath}">홈으로</a>
	    </td>
	  </tr>
	  
	  <tr>
	    <td align="center">
		    <a href="${ctxpath}">공지사항</a>
		    <a href="${ctxpath}">게시판</a>
		    <a href="${ctxpath}">상품목록</a>
		    <a href="${ctxpath}">Q&A</a>	    
	    </td>
	  </tr>
	  
	  <tr valign="top">
	    <td align="right">
	    <!-- 로그인 x 상태  -->
	 		<c:if test="${member_id==null}">
			    <a href="${ctxpath}/member/loginForm.do">로그인</a>
			    <a href="${ctxpath}/member/insertForm.do">회원가입</a>
    		</c:if>
    
    <!-- 로그인 상태 -->
	
		    <c:if test="${member_id!=null}">
		    	${member_name}님 반갑습니다.
			    <a href="${ctxpath}/member/logOut.do">로그아웃</a>
			    <a href="javaScript:updateMember()">내정보변경</a>
		    </c:if>
    	</td>
	  </tr>
	</table>
	
	<form name="updateMember" method="post">
   <input type="hidden" name="member_id" value="${member_id}">
 </form>
 
 
</body>
</html>