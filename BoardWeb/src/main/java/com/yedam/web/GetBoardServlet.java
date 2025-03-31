package com.yedam.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;

@WebServlet("/getBoard")
public class GetBoardServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		int boardNo = Integer.parseInt(request.getParameter("board_no"));

		try (SqlSession sqlSession = DataSource.getInstance().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			BoardVO board = mapper.selectOne(boardNo);

			PrintWriter out = response.getWriter();
			String html = "<h3>상세조회</h3>";
			html += "글번호: " + board.getBoardNo() + "<br>";
			html += "작성자: " + board.getWriter() + "<br>";
			html += "작성일시: " + board.getWriteDate() + "<br>";
			html += "제목: " + board.getTitle() + "<br>";
			html += "내용: " + board.getContent() + "<br>";
			html += "<p><a href = 'mainservlet'>목록으로</a></p>";
			out.print(html);
		}
	}

}
