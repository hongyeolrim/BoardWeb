package com.yedam.service;

import java.util.List;

import com.yedam.vo.EventVO;


public interface EventService {
	List<EventVO> eventList();

	EventVO addEvent(EventVO evo);

	boolean removeEvent(int eventId);
}
