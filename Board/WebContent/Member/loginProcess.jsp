<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
    
<%
	request.setCharacterEncoding("euc-kr");
	
	Connection conn = null;
	String sql = "select id,password from member where id = ? and password = ? ";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String pass = request.getParameter("passwd");

	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			out.println("<script> alert('立加己傍')</script>");
			out.println("<h3>立加己傍</h3>");
		}
		else{
			out.println("<script> alert('立加角菩')</script>");
			out.println("<h3>立加角菩</h3>");
			out.println("<script>location.href='login.net'</script>");
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
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>