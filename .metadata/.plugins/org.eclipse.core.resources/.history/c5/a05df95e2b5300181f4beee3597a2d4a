package ch12;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class Member_updateProcessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		MemberDAO mdao = new MemberDAO();
		Member m = new Member();
		request.setCharacterEncoding("euc-kr");
		
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        
        m.setId(id);
        m.setName(name);
        m.setAge(age);
        m.setGender(gender);
        m.setEmail(email);
        
		int result = mdao.member_update(m);
		
		 response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         
         out.print("<script>");
         if(result==1) {     
        	  out.print("alert('수정 성공.');");
        	  out.println("location.href='main.net';");
         }else {
	          
	            out.print("alert('수정 실패.');");
	            out.println("history.back();");
	            out.close();
         }
         out.print("</script>");

	
		

		return null;
	}

}
