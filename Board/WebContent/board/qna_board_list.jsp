<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>
<link href="css/list.css" rel="stylesheet">
</head>
<body>
<%@ include file = "/board/header.jsp" %>
<table border=1>
		<!-- 레코드가 있으면 -->
		<c:if test="${listcount > 0 }">
			<tr>
				<th colspan="4">MVC 게시판 - list</th>
				<th colspan="2">
				<font size=2>글 개수 : ${listcount }</font>
				</th>
			</tr>
	
	
			<tr>
				<th width="8%"><div>번호</div>  </th>
				<th width="50%"><div>제목</div></th>
				<th width="14%"><div>작성자</div></th>
				<th width="17%" ><div>날짜</div></th>
				<th width="11%"><div>조회수</div></th>
			</tr>
			<c:set var="num" value="${listcount-(page-1)*10 }"/>
		<c:forEach var="list" items="${boardlist }">	
			<tr>
				<td>
					<c:out value="${num }"/> <%-- num 출력 --%>
					<c:set var="num" value="${num-1 }"/> <%-- num = num -1 --%>
				</td>
             
             
             <td>
             	<div>
             	  <%--답변글 제목앞에 여백 처리 부분
               board_re_lev, board_re_lev, board_num,
               board_subject, board_name, board_date,
               board_readcount : property 이름 --%>
             <c:if test="${list.BOARD_RE_LEV != 0 }"> <!-- 답글인 경우 -->
               <c:forEach var="a" begin="0"
                        end="${list.BOARD_RE_LEV*2 }" step="1">
               &nbsp;
               </c:forEach>
              	▶
              </c:if>
              
              <c:if test="${list.BOARD_RE_LEV == 0  }"> <!-- 원문인 경우 -->
              &nbsp; ▶
              </c:if>
                    <a href="./BoardDetailAction.bo?num=${list.BOARD_NUM}">
               ${list.BOARD_SUBJECT}            
            </a>
         </div>
      </td>
      
      <td>
         <div>${list.BOARD_NAME }</div>
      </td>
      
      <td>
         <div>${list.BOARD_DATE }</div>
      </td>
      
      <td>
         <div>${list.BOARD_READCOUNT }</div>
      </td>
</tr>
		</c:forEach>
		</c:if>
			
			<tr class="h30 lime center btn">
				<td colspan=5>
					<c:if test="${page <= 1 }">
					 이전&nbsp;
					 </c:if>
				<c:if test="${page > 1 }">
					<a href="./BoardList.bo?page=${page-1 }">이전</a>
				</c:if>
				
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
					<c:if test="${a==page }">
						${a } 
					</c:if>
					
					<c:if test="${a!=page }">
						<a href="./BoardList.bo?page=${a }">${a }</a>
					</c:if>
				</c:forEach>
				<c:if test="${page >= maxpage }">
					&nbsp;다음
				</c:if>
				
				<c:if test="${page < maxpage }">
					<a href="./BoardList.bo?page=${page+1 }">다음</a>
				</c:if>
				
				
			<tr>
				<td colspan="5" style="text-align:right">
					<a href="./BoardWrite.bo">[글쓰기]</a>
				</td>
			</tr>

</table>
<!--  게시판 리스트 -->
<table border=1>
		<!-- 레코드가 없으면 -->
		<c:if test="${listcount==0 }">
			<tr>
				<td colspan="4">MVC 게시판</td>
				<td style="text-align:right">
					<font size=2>등록된 글이 없습니다.</font>
				</td>
			</tr>
		</c:if>

</table>
</body>
</html>