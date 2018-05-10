package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardRelplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		BoardDAO boarddao=new BoardDAO();
		BoardBean boarddata=new BoardBean();
	
		
		// �Ķ���ͷ� ���޹��� �亯�� �� ��ȣ�� num ������ �����մϴ�.
		int num = Integer.parseInt(request.getParameter("num"));
		
		// �� ��ȣ num�� �ش��ϴ� ������ �����ͼ� boarddata ��ü�� �����մϴ�.
		boarddata=boarddao.getDetail(num);
		
		// �� ������ ���°��
		if(boarddata==null) {
			System.out.println("���� ������ �̵� ����");
			return null;
		}
		System.out.println("���� ������ �̵� �Ϸ�");
		
		// �亯 �� �������� �̵��� �� ���� �� ������ �����ֱ� ���� boarddata ��ü��
		request.setAttribute("boarddata", boarddata);
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_reply.jsp");
		// �� �亯 ������ ��� �����մϴ�.
		return forward;
	}

}