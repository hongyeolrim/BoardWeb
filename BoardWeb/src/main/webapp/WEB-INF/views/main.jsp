<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Our Academy</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body {
	background-color: #fffafc;
	font-family: 'Segoe UI', sans-serif;
}

.welcome-container {
	text-align: center;
	padding: 80px 20px;
}

.welcome-img {
	max-width: 300px;
	margin-bottom: 30px;
}

.welcome-msg {
	font-size: 28px;
	font-weight: bold;
	color: #ff69b4;
}

.sub-msg {
	font-size: 18px;
	margin-top: 10px;
	color: #555;
}

.btn-group {
	margin-top: 40px;
}
</style>
</head>
<body>

    <div class="container welcome-container">
        <img src="${pageContext.request.contextPath}/assets/img/cute-welcome.png" alt="Welcome" class="welcome-img">

        <div class="welcome-msg">${sessionScope.logId}님,어서오세요!🌸</div>
        <div class="sub-msg">오늘도 즐거운 하루 되세요!</div>

        <div class="btn-group">
            <a href="boardList.do" class="btn btn-outline-primary btn-lg">📋 게시판 보기</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
