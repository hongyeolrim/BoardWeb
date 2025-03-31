package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.control.AddBoardControl;
import com.yedam.control.BoardControl;
import com.yedam.control.BoardListControl;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	Map<String, Control> map;

	// 생성자
	public FrontController() {
		map = new HashMap<String, Control>();
	}

	// init
	@Override
	public void init() throws ServletException {
		map.put("/board.do", new BoardControl());
		map.put("/boardList.do", new BoardListControl());
		map.put("/addBoard.do", new AddBoardControl());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 메서드 실행");
		String uri = req.getRequestURI();
		System.out.println("요청 URI: " + uri);
		String context = req.getContextPath();
		String page = uri.substring(context.length());
		System.out.println(page);

		Control sub = map.get(page);
		sub.exec(req, resp);
	}
}
