package com.yedam.control;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.common.Control;
import com.yedam.service.EventService;
import com.yedam.service.EventServiceImpl;
import com.yedam.vo.EventVO;

public class AddEventControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8"); // 요청 한글 인코딩 처리
		
		// 1. 요청 데이터 읽기
		BufferedReader reader = req.getReader();
		Gson gson = new Gson();
		EventVO evo = gson.fromJson(reader, EventVO.class);
		
		// 2. 서비스 호출 -> 이벤트 db에 등록 후 eventId 포함된 VO 반환 받기
		EventService svc = new EventServiceImpl();
		EventVO result = svc.addEvent(evo);
		
		// 3. js fetch에 응답 돌려주기
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		resp.getWriter().write(gson.toJson(result));
	}

}
