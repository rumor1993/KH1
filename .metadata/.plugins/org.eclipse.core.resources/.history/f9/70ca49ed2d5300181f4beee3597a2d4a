package ch12;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch12.db.Member;
import ch12.db.MemberDAO;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("euc-kr");
			ActionForward forward = new ActionForward();
			MemberDAO mdao = new MemberDAO();
			List<Member> list = mdao.getList();
			
			forward.setPath("./ch11/Member/member_list.jsp");
			forward.setRedirect(false);
			request.setAttribute("totallist", list);
			return forward;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
