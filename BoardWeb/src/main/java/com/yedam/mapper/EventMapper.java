package com.yedam.mapper;

import java.util.List;
import java.util.Map;

import com.yedam.vo.EventVO;

public interface EventMapper {

	List<EventVO> getALLEvents();
	int insertEvent(EventVO evo);
	int deleteEvent(int eventId);
	
	// 차트
	List<Map<String, Object>> selectWriter();
	
	// 로그
	int insertLogging(Map<String, String> map);
	
}
