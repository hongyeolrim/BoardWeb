
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
/* 전체 pagination 버튼 스타일 */
.page-link {
	background-color: #E6E6FA; /* 기본 연보라 */
	border: 1px solid #d8d8d8;
	color: #444;
	font-weight: bold;
	border-radius: 0; /* 각진 스타일 유지 */
	padding: 6px 12px;
	transition: all 0.2s ease;
}

/* hover 시 색상 변화 */
.page-link:hover {
	background-color: #D8BFD8; /* hover 연보라 */
	color: #222;
}

/* 활성 페이지 버튼 (currentPage) */
.page-item.active .page-link {
	background-color: #C8A2C8;
	color: white;
	border-color: #b07fb0;
}

/* 비활성(이전/다음 없는 경우) */
.page-item.disabled .page-link {
	background-color: #f5f5f5;
	color: #aaa;
	cursor: not-allowed;
}

.btn-soft-purple {
    background-color: #B57EDC;     /* 파스텔 보라색 */
    color: white;
    border: none;
    padding: 8px 20px;
    font-weight: bold;
    border-radius: 12px;           /* 살짝 둥글게 */
    box-shadow: 2px 2px 6px rgba(0, 0, 0, 0.1);
    transition: all 0.2s ease-in-out;
}

.btn-soft-purple:hover {
    background-color: #C8A2C8;     /* 살짝 진한 보라로 hover */
    transform: scale(1.05);
    color: white;
}
</style>

<h3>게시글 목록</h3>

<!-- 검색조건 -->
<form action="boardList.do">
    <div class="row">
        <div class="col-sm-2">
            <select name="searchCondition" class="form-control">
                <option>선택하세요</option>
                <option value="T" ${searchCondition == 'T' ? 'selected' : ''}>제목</option>
                <option value="W" ${searchCondition == 'W' ? 'selected' : '' }>작성자</option>
                <option value="TW" ${searchCondition == 'TW' ? 'selected' : '' }>제목&작성자</option>
            </select>
        </div>
        <div class="col-sm-4">
            <input type="text" name="keyword" class="form-control" value="${keyword != null && keyword != 'null' ? keyword : ''}">
        </div>
        <div class="col-sm-2">
            <button type="submit" class="btn-soft-purple">검색</button>
        </div>
    </div>
</form>
<table class="table">
    <thead>
        <tr>
            <th>글번호</th>
            <th>제 목</th>
            <th>작성자</th>
            <th>작성일시</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="board" items="${blist }">
            <tr>
                <td>${board.boardNo}</td>
                <td><a href='board.do?page=${paging.currentPage }&bno=${board.boardNo}'>${board.title }</a></td>
                <td>${board.writer}</td>
                <td><fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd" /></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<nav aria-label="...">
    <ul class="pagination">

        <!-- 이전 10개 페이지 여부 -->
        <c:choose>
            <c:when test="${paging.prev }">
                <li class="page-item"><a class="page-link" href="boardList.do?page=${paging.startPage - 1 }">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled"><span class="page-link">Previous</span></li>
            </c:otherwise>
        </c:choose>

        <c:forEach var="p" begin="${paging.startPage }" end="${paging.endPage }">
            <c:choose>
                <c:when test="${paging.currentPage  == p}">
                    <li class="page-item active" aria-current="page"><span class="page-link">${p }</span></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="boardList.do?page=${p }&searchCondition=${searchCondition }&keyword=${keyword }">${p }</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <!-- 이후 10개 페이지 여부 -->
        <c:choose>
            <c:when test="${paging.next }">
                <li class="page-item"><a class="page-link" href="boardList.do?page=${paging.endPage + 1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled"><span class="page-link">Next</span></li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>
