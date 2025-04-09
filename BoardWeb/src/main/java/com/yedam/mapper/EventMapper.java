package com.yedam.mapper;

import java.util.List;

import com.yedam.vo.EventVO;

public interface EventMapper {

	List<EventVO> getALLEvents();
	int insertEvent(EventVO evo);
	int deleteEvent(int eventId);
}
