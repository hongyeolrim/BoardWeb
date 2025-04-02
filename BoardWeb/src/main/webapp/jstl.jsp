<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/jstl.jsp</title>
</head>
<body>
    <%
    request.setAttribute("name", "Hong");
    List<String> list = new ArrayList<>();
    list.add("Hello");
    list.add("Nice");
    list.add("Goooooooooooooooood");
    list.add("Yoooooooooooooooooooo");
    list.add("WOOOOOOOOOOOOOW");
    list.add("LET'S GOOOOOOOOOOOO");
    request.setAttribute("list", list);
    request.setAttribute("today", new Date());
    %>

    <!-- fmt(포맷) -->
    <p><fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
    <c:set var="cnt" value="100000" />
    <fmt:formatNumber value="${cnt }" pattern="##,###"></fmt:formatNumber>



    <!-- jstl 변수초기화 -->
    <c:set var="msg" value="Hello" />
    <p>
        <c:out value="${msg}" />
    </p>
    <p>request 객체의 name attribute의 값은 ${name }</p>
    <p>session 객체의 logId attribute의 값은 ${name }</p>

    <!-- 조건문 -->
    <c:if test="${msg == 'Hello'}" />
    <c:out value="msg의 값이 Hello가 맞습니다" />

    <c:set var="age" value="20" />
    <c:choose>
        <c:when test="${age >= 20 }">
            <p>성인입니다</p>
        </c:when>
        <c:otherwise>
            <p>미성년자입니다</p>
        </c:otherwise>
    </c:choose>


    <!-- 반복문 -->
    <c:forEach var="i" begin="1" end="10" step="1">
        <p>2 x ${1 } = ${2 * i }</p>
    </c:forEach>

    <ul>
        <c:forEach var="str" items="${list }">
            <li><c:out value="${str }" /></li>
        </c:forEach>
    </ul>
</body>
</html>