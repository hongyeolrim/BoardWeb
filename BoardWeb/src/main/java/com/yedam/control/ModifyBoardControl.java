package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.common.PageDTO;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;

public class ModifyBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
//bno=15&title=바뀐값&content=바뀐값, 수정 후 목록으로 이동
		String bno = req.getParameter("bno");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String page = req.getParameter("page");

		try (SqlSession sqlSession = DataSource.getInstance().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			BoardVO board = new BoardVO();
			board.setBoardNo(Integer.parseInt(bno));
			board.setTitle(title);
			board.setContent(content);
			
			int r = mapper.updateBoard(board);
			if (r > 0) {
				resp.sendRedirect("boardList.do?page=" + page);
			} else {
				System.out.println("수정 오류");
			}

		}
	}
}
