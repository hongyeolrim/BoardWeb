<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>게시글 상세보기</h3>
<form action="modifyForm.do">
    <input type="hidden" name="bno" value="${board.boardNo }"> <input type="hidden" name="page" value="${page }">
    <table class="table">
        <tr>
            <th>글번호</th>
            <th>제 목</th>
            <th>작성자</th>
            <th>작성일시</th>
        </tr>
        <tr>
            <td>${board.boardNo }</td>
            <td>${board.title }</td>
            <td>${board.writer }</td>
            <td><fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd" /></td>
        </tr>
        <tr>
            <th colspan="4">내 용</th>
        </tr>
        <tr>
            <td colspan="4"><textarea class="form-control" cols="30" rows="3" readonly>${board.content }</textarea></td>
        </tr>
        <tr>
            <td colspan="4">
                <button type="submit" class="btn btn-warning">수정</button> <c:choose>
                    <c:when test="${logId != null && logId == board.writer }">
                        <button type="button" class="btn btn-danger">삭제</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="btn btn-danger" disabled>삭제</button>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
        <tr>
        <c:if test="${msg != null }" />
        <td style="color: red" colspan="6">${msg }</td>
        </tr>
    </table>
</form>

<!-- 댓글 관련 -->
<style>
div.reply span {
	display: inline-block;
}

div.reply ul {
	list-style-type: none;
}

.content {
	margin-top: 20px;
}

  /* 페이지네이션 전체 - 왼쪽 정렬 유지 */
    .pagination {
        margin-top: 20px;
        padding-left: 0;
    }

    /* 각 버튼 */
    .page-link {
        background-color: #E6E6FA; /* 연보라 기본 */
        border: 1px solid #d8d8d8;
        color: #444;
        font-weight: bold;
        border-radius: 0; /* 네모 스타일 */
        padding: 6px 12px;
        transition: all 0.2s ease;
    }

    .page-link:hover {
        background-color: #D8BFD8; /* 진한 연보라 hover */
        color: #222;
    }

    /* 활성화된 페이지 */
    .page-item.active .page-link {
        background-color: #C8A2C8;
        color: white;
        border-color: #b07fb0;
    }

    /* 비활성 (disabled) */
    .page-item.disabled .page-link {
        background-color: #f5f5f5;
        color: #aaa;
        cursor: not-allowed;
    }
</style>

<div class="container reply">

    <!-- 등록 -->
    <div class="header">
        <input class="col-sm-8" id="reply">
        <button class="col-sm-2 btn btn-outline-secondary rounded-pill btn-sm addReply">댓글 등록✏️</button>
    </div>
    
    <!-- 목록 -->
    <div class="content">
        <ul>
            <li>
            <span class="col-sm-2">글번호🌷</span> 
            <span class="col-sm-5">내용💬</span> 
            <span class="col-sm-2">작성자👤</span> 
            <span class="col-sm-2">삭제🗑️</span>
            </li>
        </ul>
    </div>

    <!-- 페이징 -->
    <nav aria-label="...">
        <ul class="pagination pagination-sm">
            <li class="page-item disabled"><a class="page-link">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active" aria-current="page"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
</div>


<p><a href='boardList.do'>게시글 목록으로 이동</a></p>
<script>
    const bno = "${board.boardNo}";
    const replyer = "${logId}";
    
    //삭제 버튼에 이벤트 등록
    const deleteBtn = document.querySelector('button.btn.btn-danger');
    deleteBtn.addEventListener('click', deleteFnc);

    //삭제함수
    function deleteFnc() {
        location.href = 'deleteForm.do?bno=${board.boardNo}'; //삭제 화면으로 이동
    }
</script>
<script src="js/boardService.js"></script>
<script src="js/board1.js"></script>