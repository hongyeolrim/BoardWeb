<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="includes/header.jsp" />

<%
BoardVO board = (BoardVO) request.getAttribute("board");
%>

<h3>게시글 상세보기</h3>
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
		<td colspan="4"><textarea class="form-control" cols="30" rows="3"><%=board.getContent()%></textarea>
		</td>
	</tr>


</table>
<a href='boardList.do'>게시글 목록으로 이동</a>
<jsp:include page="includes/footer.jsp" />