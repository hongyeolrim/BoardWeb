package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.Control;
import com.yedam.common.DataSource;
import com.yedam.mapper.BoardMapper;
import com.yedam.vo.BoardVO;

public class ModifyFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//bno=15 단건조회, modifyBoard.jsp
		try (SqlSession sqlSession = DataSource.getInstance().openSession()) {

			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			String bno = req.getParameter("bno");
			String page = req.getParameter("page");

			BoardVO board = mapper.selectOne(Integer.parseInt(bno));
			req.setAttribute("board", board);
			req.setAttribute("page", page);

			// 권한체크
			HttpSession session = req.getSession();
			String logId = (String) session.getAttribute("logId");

			if (logId != null && logId.equals(board.getWriter())) {
				req.getRequestDispatcher("/WEB-INF/views/modifyForm.jsp").forward(req, resp);

			} else {
				req.setAttribute("msg", "권한이 없지롱~헤헿");
				req.getRequestDispatcher("/WEB-INF/views/board.jsp").forward(req, resp);
			}

		}
	}
}
