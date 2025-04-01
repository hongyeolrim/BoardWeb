<%@page import="com.yedam.common.PageDTO"%>
<%@page import="com.yedam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="includes/header.jsp" />
<%
List<BoardVO> list = (List<BoardVO>) request.getAttribute("blist");
PageDTO pageDto = (PageDTO) request.getAttribute("paging");
String sc = (String) request.getAttribute("searchCondition");
String kw = (String) request.getAttribute("keyword");
%>
<h3>게시글 목록</h3>

<!-- 검색조건 -->
<form action="boardList.do">
	<div class="row">
		<div class="col-sm-2">
			<select name="searchCondition" class="form-control">
				<option>선택하세요</option>
				<option value="T" <%=("T".equals(sc)) ? "selected" : "" %>>제목</option>
				<option value="W" <%= ("W".equals(sc)) ? "selected" : "" %>>작성자</option>
				<option value="TW" <%=("TW".equals(sc)) ? "selected" : "" %>>제목&작성자</option>
			</select>
		</div>
		<div class="col-sm-4">
			<input type="text" name="keyword" class="form-control"
				value="<%=kw != null ? kw : ""%>">
		</div>
		<div class="col-sm-2">
			<button type="submit" class="btn btn-info">검색</button>
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
		<%
		for (BoardVO board : list) {
		%>
		<tr>
			<td><%=board.getBoardNo()%></td>
			<td><a
				href='board.do?page=<%=pageDto.getCurrentPage()%>&bno=<%=board.getBoardNo()%>'><%=board.getTitle()%></a></td>
			<td><%=board.getWriter()%></td>
			<td><%=board.getWriteDate()%></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>
<nav aria-label="...">
	<ul class="pagination">

		<!-- 이전 10개 페이지 여부 -->
		<%
		if (pageDto.isPrev()) {
		%>
		<li class="page-item"><a class="page-link"
			href="boardList.do?page=<%=pageDto.getStartPage() - 1%>">Previous</a></li>
		<%
		} else {
		%>
		<li class="page-item disabled"><span class="page-link">Previous</span>
		</li>
		<%
		}
		%>

		<%
		for (int p = pageDto.getStartPage(); p <= pageDto.getEndPage(); p++) {
		%>
		<%
		if (pageDto.getCurrentPage() == p) {
		%>
		<li class="page-item active" aria-current="page"><span
			class="page-link"><%=p%></span></li>
		<%
		} else {
		%>
		<li class="page-item"><a class="page-link"
			href="boardList.do?page=<%=p%>&searchCondition=<%=sc%>&keyword=<%=kw%>"><%=p%></a></li>
		<%
		}
		}
		%>

		<!-- 이후 10개 페이지 여부 -->
		<%
		if (pageDto.isNext()) {
		%>
		<li class="page-item"><a class="page-link"
			href="boardList.do?page=<%=pageDto.getEndPage() + 1%>">Next</a></li>
		<%
		} else {
		%>
		<li class="page-item disabled"><span class="page-link">Next</span>
		</li>
		<%
		}
		%>
	</ul>
</nav>
<jsp:include page="includes/footer.jsp" />