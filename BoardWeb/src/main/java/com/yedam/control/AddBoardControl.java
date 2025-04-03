package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;

public class AddBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try (SqlSession sqlSession = DataSource.getInstance().openSession(true)) {
			req.setCharacterEncoding("UTF-8");
			if (req.getMethod().equals("GET")) {
				req.getRequestDispatcher("common/addForm.tiles").forward(req, resp);
			} else if (req.getMethod().equals("POST")) {
				String title = req.getParameter("title");
				String writer = req.getParameter("writer");
				String content = req.getParameter("content");

				BoardVO board = new BoardVO(title, content, writer);
				BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
				int r = mapper.insertBoard(board);

				if (r > 0) {
					resp.sendRedirect("boardList.do");
				} else {
					System.out.println("등록실패");
				}
			}
		}
	}
}