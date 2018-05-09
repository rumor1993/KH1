<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
    
<%
	request.setCharacterEncoding("euc-kr");
	
	Connection conn = null;
	String sql = "select * from member where id = ?";
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
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){ // 입력한 비밀번호와 DB에 저장된 비밀번호와 비교
				session.setAttribute("id", id); // 세선에 id를 저장합니다.
				
				// main.jsp로 이동합니다.
				out.println("<script>");
				out.println("alert('"+ id + "님이 로그인 하셨습니다.')");
				out.println("location.href = 'main.net'");
				out.println("</script>");
			}else{
				out.println("<script> alert('비밀번호가 틀립니다.')</script>");
				out.println("<h3>접속실패</h3>");
				out.println("<script>location.href='loginform.jsp'</script>");
		}
	
		}else{ //아이디가 틀린경우
			out.println("<script> alert('아이디가 없습니다..')</script>");
			out.println("<h3>접속실패</h3>");
			out.println("<script>location.href='login.net'</script>");
		}
			
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
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