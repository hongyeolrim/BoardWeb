package com.yedam.common;

import java.util.List;

import lombok.Data;
import lombok.Getter;

// 게시글 수에 따른 페이지 수
@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private int currentPage;
	private boolean prev, next;

	public PageDTO() {
	}

	public PageDTO(int totalCnt, int currentPage) {
		this.currentPage = currentPage;
		this.endPage = (int) Math.ceil(currentPage / 10.0) * 10;
		this.startPage = endPage - 9;
		int realEnd = (int) (Math.ceil(totalCnt / 5.0));
		endPage = (endPage > realEnd) ? realEnd : endPage; // 계산한 마지막 페이지? 실제 마지막 페이지

		this.prev = (startPage > 1) ? true : false;
		this.next = (endPage < realEnd) ? true : false;
	}
}
