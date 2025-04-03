<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h3>회원가입</h3>
<form action="signUp.do" method="post" enctype="multipart/form-data">
    <table class="table">
        <tr>
            <th>아이디</th>
            <td><input class="form-control" type="text" name="userId"></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input class="form-control" type="password" name="userPw"></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input class="form-control" type="text" name="userName"></td>
        </tr>
        <tr>
            <th>이미지</th>
            <td><input class="form-control" type="file" name="userImg"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-success">회원가입</button>
                <button type="reset" class="btn btn-danger">초기화</button>
            </td>
        </tr>
    </table>
</form>
