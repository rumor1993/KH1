<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
%>	
	<c:choose>
		<c:when test="${id!='admin' }">
			<span>일반회원 ${sessionScope.id }님이 환영합니다.</span> <a href = "member_update.net">(정보수정)</a> <a href = "logout.net">(로그아웃)</a><br>
		</c:when>
		
		<c:otherwise>
			<span>관리자 ${sessionScope.id }님 환영합니다.</span> <a href = "member_update.net">(정보수정)</a> <a href = "logout.net">(로그아웃)</a><br>
		</c:otherwise>
	</c:choose>
	
<%-- 	<div id="header">
		<c:if test="${empty id }">
			<script>
				location.href="login.net";
			</script>
		</c:if>
		<c:if test="${!empty id }">
			<c:if test="${id=='admin' }">
				<span> 관리자 ${id } 님 환영합니다.></span>
			</c:if>
			<c:if test="${id!='admin' }">
				<span>일반회원 ${id } 님 환영합니다.</span>
			</c:if>
		</c:if> 
		</div>
--%>
		

	
	<%-- 
	<%
	if(!id.equals("admin")){
	%>
		<span>일반회원 <%=id %>님이 환영합니다.</span> <a href = "update.jsp">(정보수정)</a> <a href = "logout.jsp">(로그아웃)</a><br>
	<%
	}else{
	%>
		<%
	}
	%> --%>
</body>
</html>

