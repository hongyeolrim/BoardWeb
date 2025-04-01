package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.mapper.BoardMapper;

public class DeleteBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bno = req.getParameter("bno");

		try (SqlSession sqlSession = DataSource.getInstance().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			int r = mapper.deleteBoard(Integer.parseInt(bno));
			if (r > 0) {
				resp.sendRedirect("boardList.do");
			} else {
				System.out.println("삭제 오류");
			}
		}
	}
}
