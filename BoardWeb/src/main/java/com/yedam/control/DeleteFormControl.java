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

public class DeleteFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try (SqlSession sqlSession = DataSource.getInstance().openSession()) {

			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			String bno = req.getParameter("bno");
			BoardVO board = mapper.selectOne(Integer.parseInt(bno));
			req.setAttribute("board", board);
			req.getRequestDispatcher("/WEB-INF/views/deleteForm.jsp").forward(req, resp);
		}
	}
}
