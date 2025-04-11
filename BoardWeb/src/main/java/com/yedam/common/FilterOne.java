package com.yedam.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.yedam.service.EventService;
import com.yedam.service.EventServiceImpl;

// 클라이언트 - 필터 - 서블릿
public class FilterOne implements Filter {

	public FilterOne() {
		System.out.println("FilterOne 생성자");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("서블릿 실행전");
		
		// 요청 페이지, 클라이언트 ip
		String ip = request.getRemoteAddr();
		HttpServletRequest req = (HttpServletRequest) request; // 캐스팅
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		String reqPage = uri.substring(context.length());
		
		Map<String, String> map = new HashMap<>();
		map.put("page", reqPage);
		map.put("host", ip);
		
		// 로그 저장
		EventService svc = new EventServiceImpl();
		svc.logCreate(map);

//		if(ip.equals("192.168.0.29")) {
//			return;
//		}
		List<String> blockList = new ArrayList<>();
		blockList.add("192.168.0.33");
		blockList.add("192.168.0.35");
		
		if (blockList.contains(ip)) {
			return;
		}
		
		chain.doFilter(request, response);
		System.out.println("서블릿 실행후");
	}
}
