<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>MVC �Խ���</title>
<link href="css/list.css" rel="stylesheet">
</head>
<body>
<%@ include file = "/board/header.jsp" %>
<!--  �Խ��� ����Ʈ -->
<table border=1>
		<!-- ���ڵ尡 ������ -->
		<c:if test="${listcount==0 }">
			<tr>
				<td colspan="4">MVC �Խ���</td>
				<td style="text-align:right">
					<font size=2>��ϵ� ���� �����ϴ�.</font>
				</td>
			</tr>
		</c:if>
			<tr>
				<td colspan="5" style="text-align:right">
					<a href="./BoardWrite.bo">[�۾���]</a>
				</td>
			</tr>
</table>
</body>
</html>