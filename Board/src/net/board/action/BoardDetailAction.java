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
		
		// 글의 내용을 DAO에서 읽은 후 얻은 결과를 boarddata 객체에 저장합니다.
		boarddata = boarddao.getDetail(num);
		// DAO에서 글의 내용을 읽지 못했을 경우 null을 반환합니다.
		if(boarddata==null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");
				
		//boarddata 객체를 Request 객체에 저장합니다.
		request.setAttribute("dboarddata", boarddata);
		forward.setPath("./board/qna_board_view.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
