<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>삭제화면</h3>

<%
BoardVO board = (BoardVO) request.getAttribute("board");
%>
<form action="deleteBoard.do">
	<input type="hidden" name="bno" value="<%=board.getBoardNo()%>">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><%=board.getBoardNo()%></td>
			<th>작성자</th>
			<td><%=board.getWriter()%></td>
			<th>작성일시</th>
			<td><%=board.getWriteDate()%></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td colspan="6"><%=board.getTitle()%></td>
		</tr>

		<tr>
			<th>내 용</th>
			<td colspan="6"><textarea name="content" class="form-control"
					cols="30" rows="3" readonly><%=board.getContent()%></textarea></td>
		</tr>
		<tr>
			<td colspan="6"><button type="submit" class="btn btn-danger">삭제</button></td>
		</tr>
	</table>
</form>
