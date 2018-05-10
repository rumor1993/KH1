<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<link href="css/list.css" rel="stylesheet">
<head>
<title>Insert title here</title>


<%
request.setCharacterEncoding("euc-kr");
%>
<body>
	<table border=1>
		<c:set var="d" value="${dboarddata }"/>
		<tr>
			<th colspan=2>  MVC �Խ���  </th>
		</tr>
		<tr>
			<td>�۾���</td>
			<td>${d.BOARD_NAME }</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${d.BOARD_SUBJECT }</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${d.BOARD_CONTENT }</td>
		</tr>
		<tr>
			<td>
				÷������
			</td>
			<c:if test="${!empty d.BOARD_FILE }">
			<td>
			<img src="image/image.png" width="10px">
			<a href="./BoardFileDown.bo?filename=${d.BOARD_FILE }">	
			${d.BOARD_FILE }</a>
			</td>
			</c:if>
		</tr>
		
		<tr>
			<td colspan="2" class="center">
			<a href="BoardRelplyView.bo?num=${d.BOARD_NUM }"> �亯 </a>&nbsp;&nbsp;
			<c:if test="${b.BOARD_NAME == id || id == 'admin' }">
			<a href="BoardModifyview.bo?num=${d.BOARD_NUM }"> ���� </a>&nbsp;&nbsp;
			<a href="BoardDelete.bo?num=${d.BOARD_NUM }"> ���� </a>&nbsp;&nbsp;
			</c:if>
			<a href="BoardList.bo"> ��� </a>&nbsp;&nbsp;
	
			
			</td>
		</tr>
		
	</table>
</body>
</html>