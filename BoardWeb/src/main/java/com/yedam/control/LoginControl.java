package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 파라미터 uname, psw
		String id = req.getParameter("uname");
		String pw = req.getParameter("psw");

		// 서비스객체 처리
		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.login(id, pw);

		if (mvo == null) {
			req.setAttribute("msg", "아이디와 비밀번호를 확인하세요.");
			req.getRequestDispatcher("WEB-INF/views/loginForm.jsp").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("logId", id);
			resp.sendRedirect("main.do");
		}
	}
}
