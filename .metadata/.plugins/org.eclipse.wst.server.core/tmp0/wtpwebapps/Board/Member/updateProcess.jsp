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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String age2 = request.getParameter("age");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");

	
	
	Connection conn = null;
	String sql = "UPDATE member SET NAME=?, AGE=?, GENDER=?, EMAIL=? WHERE ID = ?";
	PreparedStatement pstmt = null;

	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		pstmt =  conn.prepareStatement(sql);
		int age = Integer.parseInt(age2);
		
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, gender);
		pstmt.setString(4, email);
		pstmt.setString(5, id);
		

		
		int result = pstmt.executeUpdate();

		if(result!=0){
			out.println("<script>alert('수정이 완료 되었습니다.')</script>");
			out.println("<script>location.href = 'main.jsp'</script>");
		}else{
			out.println("<script>alert('수정에 실패 했습니다.')</script>");
			out.println("<script>location.href = 'update.jsp'</script>");
		}
			
	}catch(Exception e){
		out.println("<script>alert('수정에 실패 했습니다.')</script>");
		out.println("<script>location.href = 'update.jsp'</script>");
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