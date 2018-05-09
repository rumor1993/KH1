<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("euc-kr");
	
		Connection conn = null;
		String sql = "delete from member where id = ?";
		PreparedStatement pstmt = null;
		String id = request.getParameter("id");

try{
	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
	conn = ds.getConnection();
	pstmt =  conn.prepareStatement(sql);
	
	pstmt.setString(1,id);
	
	int result = pstmt.executeUpdate();
	
	
	if(result != 0){
		out.println("<script>alert('성공했습니다.')</script>");
		out.println("<script>location.href = 'member_list.net'</script>");
	}else{
		out.println("<script>alert('실패했습니다.')</script>");
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt!=null){
		
		try{
			pstmt.close();
		}catch(SQLException se){
			se.printStackTrace();	
		}
	}
	if(conn!=null){
		try{
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
	
	
%>
</body>
</html>