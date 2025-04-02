package com.yedam.service;

import com.yedam.common.DataSource;
import com.yedam.vo.MemberVO;

// 업무 프로세스
public interface MemberService {
	// 로그인
	MemberVO login(String id, String pw);
}
