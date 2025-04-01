<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="includes/header.jsp" />

<%
BoardVO board = (BoardVO) request.getAttribute("board");
String cpage = (String) request.getAttribute("page");
%>

<h3>게시글 상세보기</h3>
<form action="modifyForm.do">
	<input type="hidden" name="bno" value="<%=board.getBoardNo()%>">
	<input type="hidden" name="page" value="<%=cpage%>">
	<table class="table">
		<tr>
			<th>글번호</th>
			<th>제 목</th>
			<th>작성자</th>
			<th>작성일시</th>
		</tr>
		<tr>
			<td><%=board.getBoardNo()%></td>
			<td><%=board.getTitle()%></td>
			<td><%=board.getWriter()%></td>
			<td><%=board.getWriteDate()%></td>
		</tr>
		<tr>
			<th colspan="4">내 용</th>
		</tr>
		<tr>
			<td colspan="4"><textarea class="form-control" cols="30"
					rows="3"><%=board.getContent()%></textarea></td>
		</tr>
		<tr>
			<td colspan="4">
				<button type="submit" class="btn btn-warning">수정</button>
				<button type="button" class="btn btn-danger">삭제</button>
			</td>
		</tr>
	</table>
</form>
<a href='boardList.do'>게시글 목록으로 이동</a>
<script>
	//삭제 버튼에 이벤트 등록
	const deleteBtn = document.querySelector('button.btn.btn-danger');
	deleteBtn.addEventListener('click', deleteFnc);

	//삭제함수
	function deleteFnc() {
		location.href = 'deleteForm.do?bno=<%=board.getBoardNo()%>'; //삭제 화면으로 이동
	}
</script>
<jsp:include page="includes/footer.jsp" />