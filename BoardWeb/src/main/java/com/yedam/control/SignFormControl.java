package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class SignFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 회원가입화면
		if (req.getMethod().equals("GET")) {
			req.getRequestDispatcher("common/signForm.tiles").forward(req, resp);

		} else {
			// 2. 회원가입처리 (파일 업로드: images, db등록)
			// 1)요청정보-req 2)저장경로 3)최대크기지정 4)파일 이름 처리 인코딩 5)리네임정책-같은 이름의 파일이 올라오면 파일명 변경
			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 1024 * 1024 * 5;
			String enc = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req, saveDir, maxSize, enc, new DefaultFileRenamePolicy());

			String uid = mr.getParameter("userId");
			String upw = mr.getParameter("userPw");
			String unm = mr.getParameter("userName");
			String img = mr.getFilesystemName("userImg");

			MemberVO mvo = new MemberVO();
			mvo.setMemberId(uid);
			mvo.setMemberPw(upw);
			mvo.setMemberName(unm);
			mvo.setImages(img);

			// 업무처리
			MemberService svc = new MemberServiceImpl();
			if (svc.addMember(mvo)) {
				resp.sendRedirect("loginForm.do");
			} else {
				System.out.println("처리 오류");
			}
		}
	}
}
