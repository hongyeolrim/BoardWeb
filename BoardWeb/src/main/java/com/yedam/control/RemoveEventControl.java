package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.EventService;
import com.yedam.service.EventServiceImpl;

public class RemoveEventControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int eventId = Integer.parseInt(req.getParameter("eventId"));
		EventService svc = new EventServiceImpl();
		boolean result = svc.removeEvent(eventId);
		
		resp.setContentType("text/plain");
		resp.getWriter().write((result) ? "success" : "fail");
	}

}
