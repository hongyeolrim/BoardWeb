<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="includes/header.jsp" />



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
        <c:if test="${msg != null }" />
        <span style="color: red">${msg }</span>
    </table>
</form>
<a href='boardList.do'>게시글 목록으로 이동</a>
<script>
    //삭제 버튼에 이벤트 등록
    const deleteBtn = document.querySelector('button.btn.btn-danger');
    deleteBtn.addEventListener('click', deleteFnc);

    //삭제함수
    function deleteFnc() {
        location.href = 'deleteForm.do?bno=${board.boardNo}'; //삭제 화면으로 이동
    }
</script>
<jsp:include page="includes/footer.jsp" />