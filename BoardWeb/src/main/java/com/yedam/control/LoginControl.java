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
		System.out.println(req.getRemoteHost());

		if (mvo == null) {
			req.setAttribute("msg", "아이디와 비밀번호를 확인하세요.");
			req.getRequestDispatcher("common/loginForm.tiles").forward(req, resp);
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("logId", id);
			session.setAttribute("img", mvo.getImages());
//			resp.sendRedirect("main.do");
			
			if(mvo.getResponsibility().equals("User")) {
				req.getRequestDispatcher("common/main.tiles").forward(req, resp);
			}else if(mvo.getResponsibility().equals("Admin")) {
				req.getRequestDispatcher("manager/main.tiles").forward(req, resp);
			}
		}
	}
}
