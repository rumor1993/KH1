<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	//session.removeAttribute("id");//id속성 제거합니다.
	session.invalidate();
%>
	<h1>로그아웃 되었습니다.</h1><br>
	<a href ="loginform.jsp">로그인 페이지로 이동</a>
</body>
</html>