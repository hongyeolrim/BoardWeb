package com.yedam.service;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.ReplyVO;

public interface ReplyService {

	List<ReplyVO> replyList(SearchDTO search);

	boolean addReply(ReplyVO rvo);

	boolean removeReply(int replyNo);

	ReplyVO getReply(int replyNo);
	
	int getTotalCnt(int boardNo); // 페이징 계산

}
