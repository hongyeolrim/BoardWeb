<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>javascript 연습🍰</h3>
<div class="row">
 <div class="col-sm-6">
  <input class="form-control" type="text" id="userInput">
 </div>
 <div class="col-sm-4">
  <button id="addBtn" class="btn btn-primary">추가</button>
 </div>
</div>

<!-- <ul id="list">
  <li>apple</li>
  <li>banana</li>
</ul> -->

<select class="form-control" id="searchGender">
<option value="All">전체</option>
<option value="Male">남성</option>
<option value="Female">여성</option>
<option value="Androgynous">중성</option>
<option value="Alien">외계인</option>
</select>

<table class="table">
<thead>
<tr><th><input id="checkAll" type="checkbox"></th><th>id</th><th>first name</th><th>last name</th><th>gender</th><th>email</th><th>삭제</th></tr>
</thead>
<tbody id="target">
</tbody>
</table>
<script src ="js/ajax.js"></script>

