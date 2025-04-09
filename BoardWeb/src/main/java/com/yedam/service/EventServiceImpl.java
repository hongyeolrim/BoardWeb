package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.EventMapper;
import com.yedam.vo.EventVO;

public class EventServiceImpl implements EventService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	EventMapper mapper = sqlSession.getMapper(EventMapper.class);
	
	@Override
	public List<EventVO> eventList() {
		return mapper.getALLEvents();
	}

	@Override
	public EventVO addEvent(EventVO evo) {
		mapper.insertEvent(evo);
		return evo;
	}

	@Override
	public boolean removeEvent(int eventId) {
		return mapper.deleteEvent(eventId) == 1;
	}

}
