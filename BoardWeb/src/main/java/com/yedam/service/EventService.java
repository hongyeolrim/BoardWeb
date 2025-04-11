package com.yedam.service;

import java.util.List;
import java.util.Map;

import com.yedam.vo.EventVO;


public interface EventService {
	List<EventVO> eventList();

	EventVO addEvent(EventVO evo);

	boolean removeEvent(int eventId);
	
	// 차트
	List<Map<String, Object>> cntPerWriter();
	
	// 로그 생성
	void logCreate(Map<String, String> map);
}
