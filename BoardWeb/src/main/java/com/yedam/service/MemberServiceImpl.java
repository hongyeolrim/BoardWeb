package com.yedam.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.MemberMapper;
import com.yedam.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	@Override
	public MemberVO login(String id, String pw) {
		try (SqlSession session = DataSource.getInstance().openSession(true)) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			return mapper.selectMember(id, pw);
		}
	}
}
