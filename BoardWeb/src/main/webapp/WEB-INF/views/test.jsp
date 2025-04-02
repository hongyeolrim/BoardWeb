<%@page import="com.yedam.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.yedam.mapper.BoardMapper"%>
<%@page import="com.yedam.common.DataSource"%>
<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//java영역이기 때문에 여기서도 이 코드를 쓸 수는 있음
	SqlSession sqlsession = DataSource.getInstance().openSession();
	BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
	List<BoardVO> list = mapper.selectBoard(null);
	%>
	<h3>글 목록</h3>
	<ul>
		<%
		for (BoardVO board : list) {
		%>
		<li>글 번호(<%=board.getBoardNo()%>) / 글 제목(<%=board.getTitle()%>)
		</li>
		<%
		}
		%>
	</ul>


	<%
	String msg = "Hello, World";
	System.out.println(msg); // 콘솔에 출력됨
	int age = 30;
	%>
	<p>저장 정보</p>
	<p>
		age에 저장된 값은
		<%=age%></p>
	<%
	if (age > 20) {
	%>
	<p>성인입니다</p>
	<%
	} else {
	%>
	<p>미성년입니다</p>
	<%
	}
	%>

</body>
</html>