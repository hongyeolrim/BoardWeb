package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yedam.common.Control;
import com.yedam.service.EventService;
import com.yedam.service.EventServiceImpl;
import com.yedam.vo.EventVO;

public class EventListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 인코딩 설정
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		// 서비스 호출해서 전체 일정 불러오기
		EventService svc = new EventServiceImpl();
		List<EventVO> list = svc.eventList();

		// JSON으로 변환해서 응답
		Gson gson = new Gson();
		resp.getWriter().write(gson.toJson(list));
	}

}
