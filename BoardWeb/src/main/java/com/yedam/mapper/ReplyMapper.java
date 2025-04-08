package com.yedam.mapper;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> selectList(SearchDTO search); // 댓글 목록

	int insertReply(ReplyVO rvo); // 댓글 등록

	int deleteReply(int replyNo); // 댓글 삭제

	ReplyVO selectReply(int replyNo); // 단건 조회
	
	int selectReplyCnt(int boardNo); // 댓글의 건수 가져오기
}
