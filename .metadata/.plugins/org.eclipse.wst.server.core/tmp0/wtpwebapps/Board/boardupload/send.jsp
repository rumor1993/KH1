<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");  %>
<html>
 <head>
 <link href="../../../css/send.css" rel="stylesheet" type="text/css">
 <title>send2.jsp</title>
 </head>

 <body>
	<h1> ȸ�� ������ ������</h1>
	<table border='1'>
		<tr>
			<th> ID </th>
			<td><%=request.getParameter("id")%></td>
		</tr>
		<tr>
			<th> ��й�ȣ </th>
			<td><%=request.getParameter("pass")%></td>
		</tr>
		<tr>
			<th> �ֹι�ȣ </th>
			<td>
				<%=request.getParameter("jumin1")%> -
				<%=request.getParameter("jumin2")%>
			</td>
		</tr>
		<tr>
			<th> E-Mail </th>
			<td>
				<%=request.getParameter("email")%>@
				<% if(request.getParameter("sel").equals("")){ %>
				    <%=request.getParameter("domain")%>
				 <%}else{				 
				 %>   
				     <%=request.getParameter("sel")%>
				 <%} %>    
			</td>
		</tr>
		<tr>
			<th> ���� </th>
			<td>
				<%
					if(request.getParameter("gender").equals("man")){
				%>
				����
				<%
					}else{
				%>
				����
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<th> ��� </th>
			<td>
				<%
				   String[] hobby = request.getParameterValues("hobby");
					for(int i=0; i<hobby.length; i++){
				%>
					<%=hobby[i]%>&nbsp;
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<th> ������ȣ </th>
			<td><%=request.getParameter("post1") %> - <%=request.getParameter("post2") %></td>
		</tr>
		<tr>
			<th> �ּ� </th>
			<td><%=request.getParameter("address") %></td>
		</tr>
		<tr>
			<th> �ڱ�Ұ� </th>
			<td><%=request.getParameter("intro") %></td>
		</tr>
	</table>
</body>
</html>