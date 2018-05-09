<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<link href="css/form.css" rel="stylesheet">
<body>
	<%@ include file="/board/header.jsp" %>
	<form action="./BoardAddAction.bo" method="post"
			enctype="multipart/form-data" name="boardform">
		<table>
			<tr class="center">
				<th colspan="2">MVC �Խ���-write ������</th>
			</tr>
			<tr>
				<td><div>�۾���</div></td>
				<td>
					<input name="BOARD_NAME" id="board_name" readOnly
					type="text" size="10" maxlength="30" value="${id }">
				</td>
			</tr>
			<tr>
				<td>
					<div>��й�ȣ</div>
				</td>
				<td>
					<input name="BOARD_PASS" id="board_pass" type="password" size="10"
					maxlength="30" value="">
				</td>
			</tr>
			
			<tr>
				<td>
					<div>�� ��</div>
				</td>
				<td>
					<input name="BOARD_SUBJECT" id="board_subject" type="text" size="50"
					maxlength="100" value="">
				</td>
			</tr>
			
			<tr>
				<td>
					<div>�� ��</div>
				</td>
				<td>
					<input name="BOARD_CONTENT" id="board_content" type="text" size="10"
					maxlength="500" value="">
				</td>
			</tr>
			
			<tr>
				<td>
					<div>���� ÷��</div>
				</td>
				<td>
					<input name="BOARD_FILE" id="upfile" type="file">
				</td>
			</tr>
			
			<tr class="center">
				<td colspan="2" class="h30 lime">
					<input type=submit value="���">
					<input type=reset value="���">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>