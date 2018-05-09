<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
	
<%
	request.setCharacterEncoding("euc-kr");
%>
	
	

<!DOCTYPE html>
<html>
<head>
	
	<style>
		table{width:200px; margin: 0 auto}
		td{text-align:center; }
		tr:nth-child(1) {background:pink}
	</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<table border=1>
		<tr>
		<td colspan=3>회원 목록</td>
		</tr>
		<tr>
			<td>아이디</td><td>이름</td><td>삭제</td>
		</tr>
		
		<c:forEach var="m" items="${totallist }">
			<tr>
			<td>
				<a href ='member_info.net?id=${m.id }'> ${m.id }</a>
			</td>
			<td>
			${m.name}
			</td>
			<td>
				<a href ='member_delete.net?id=${m.id }'>삭제</a>
			</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan=3>
			<a href='main.net'> 메인으로 돌아가기 </a>
		</td>
		</tr>
		</table>

</body>
</html>
