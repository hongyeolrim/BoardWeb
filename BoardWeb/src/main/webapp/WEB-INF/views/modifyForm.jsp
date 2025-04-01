<%@page import="com.yedam.common.PageDTO"%>
<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />
<h3>수정화면</h3>

<%
BoardVO board = (BoardVO) request.getAttribute("board");
String cpage = (String) request.getAttribute("page");
%>
<form action="modifyBoard.do" method="post">
	<input type="hidden" name="bno" value="<%=board.getBoardNo()%>">
	<input type="hidden" name="page" value="<%=cpage%>">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td><%=board.getBoardNo()%></td>
			<th>작성자</th>
			<td><%=board.getWriter()%></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><input type="text" name="title" class="form-control"
				value="<%=board.getTitle()%>"></td>
		</tr>

		<tr>
			<th>내 용</th>
			<td colspan="4"><textarea name="content" class="form-control"
					cols="30" rows="3"><%=board.getContent()%></textarea></td>
		</tr>
		<tr>
			<td colspan="4"><button type="submit" class="btn btn-warning">수정</button></td>
		</tr>
	</table>
</form>

<jsp:include page="includes/footer.jsp" />
