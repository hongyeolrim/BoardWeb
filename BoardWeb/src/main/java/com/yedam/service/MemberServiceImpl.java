package com.yedam.service;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.MemberMapper;
import com.yedam.vo.MemberVO;

public class MemberServiceImpl implements MemberService {

	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);

	@Override
	public MemberVO login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
	public boolean addMember(MemberVO member) {
		return mapper.insertMember(member) == 1;
	}
}
