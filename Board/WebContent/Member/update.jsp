<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<%
	request.setCharacterEncoding("euc-kr");
%>
<script src = "http://code.jquery.com/jquery-3.3.1.js"></script>

	<script>
                /*  일부로 폼아래다하는거다 폼먼저읽고 이게 입력되라고*/
	 
	 $(document).ready(function(){

	   $(".canclebtn").click(function(){
	      location.href = "main.net";
	   });
	   $('form').submit(function(){
	      if(!$.isNumeric($("input[name='age']").val())){
	         alert("나이는 숫자를 입력하세요");
	         return false;
	      }
	   })
	 })
	   </script>
	

<c:set var="m" value="${Memeberinfo }"/>
</head>
	<body>
	<form name = update action = member_updateProcess.net
      method = "post">
            <h1>회원 정보 수정 페이지</h1>
   <hr>
      <b>아이디</b>
      <input type=text name=id value=${m.id } readonly><br>
      <b>비밀번호</b> <input type=password name=pass value=${m.password } readonly><br>
      <b>이름</b><input type = text name=name value=${m.name } required="required"><br>
      <b>나이</b><input type = text name=age  value=${m.age } required="required"><br>
      <b>성별</b>
      	<div>
  			<c:if test="${m.gender=='남' }">
  			 <input type = radio name = gender value = 남 checked><span>남자</span>
             <input type = radio name = gender value = 여 ><span>여자</span>
  			</c:if>
      		
 			 <c:if test="${m.gender=='여' }">	
            <input type = radio name = gender value = 남 ><span>남자</span>
            <input type = radio name = gender value = 여 checked ><span>여자</span>
           </c:if>
            
            <%--
            var pandan = '<%=rs.getString("gender")%>';
            if(pandan == '남'){
            	$("input:radio").eq(0).attr('checked','checked');
            	}else{
            	$("input:radio").eq(1).attr('checked','checked');
            	}
            	
            	
            	$(".cancebtn").click(function(){
            		location.href="main.jsp";
            	});
            	
            
             --%>
       </div>
      <b>이메일 주소</b><input type = text name = email value=${m.email } required="required"><br>
      <div class = clearfix>
      	<button type = submit class = submitbtn>수정</button>
      	<button type = reset class = canclebtn>취소</button> 
      </div>
      </form>
      
</body>
</html>