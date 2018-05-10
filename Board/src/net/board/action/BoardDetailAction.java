package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		boarddao.setReadCountUpdate(num);
		
		// ���� ������ DAO���� ���� �� ���� ����� boarddata ��ü�� �����մϴ�.
		boarddata = boarddao.getDetail(num);
		// DAO���� ���� ������ ���� ������ ��� null�� ��ȯ�մϴ�.
		if(boarddata==null) {
			System.out.println("�󼼺��� ����");
			return null;
		}
		System.out.println("�󼼺��� ����");
				
		//boarddata ��ü�� Request ��ü�� �����մϴ�.
		request.setAttribute("dboarddata", boarddata);
		forward.setPath("./board/qna_board_view.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}