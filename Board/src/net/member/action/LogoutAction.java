package net.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('�α׾ƿ� �Ǿ����ϴ�.');");
		out.println("location.href='login.net'");
		out.println("</script>");
		
		return null;
		
		
/*		
  		forward�� ��� ���ۿ� ����ִ� ������ ������ �̵��ϱ� ������
  		alertâ�� �Բ� forward�� ����ϸ� alertâ�� ������� �ʰ�
  		�ٷ� �̵��մϴ�.
 
 * 		ActionForward froward = new ActionForward();
		HttpSession session = request.getSession();
		session.invalidate();
		
		forward.setPath("login.net");
		forward.setRedirect(true);
		return forwrad*/
		
	}

}
