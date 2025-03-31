package com.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;

@WebServlet("/addBoard")
public class AddBoardServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");

		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);

		try (SqlSession sqlSession = DataSource.getInstance().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			int r = mapper.insertBoard(board);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(r + "건 처리");
		}
	}
}
