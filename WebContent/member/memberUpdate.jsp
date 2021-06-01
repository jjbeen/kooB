<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 회원정보 수정</title>
<script type = "text/javascript" src = "script/member.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
	margin-top : 50px;
}
.ui.container {
	margin-bottom : 50px;
}
</style>
</head>
<body>
<div class="ui text container">
<form class="ui form" action="memberUpdate.do" method="post" name="frm">
	<h2 class="ui dividing header">회원정보 수정</h2>
	
	<div class="two fields">
		<div class="field">
			<label>이름</label>
			<input type="text" name="name" value="${uVo.name}" readonly>
		</div>
		<div class="field">
			<label>아이디</label>
			<input type="text" name="userid" value="${uVo.userid}" readonly>
		</div>
	</div>
	
	<div class="required field">
		<label>비밀번호</label>
		<input type="password" name="pwd">
	</div>
	
	<div class="required field">
		<label>비밀번호 확인</label>
		<input type="password" name="pwd_check">
	</div>
	
	<div class="ui two fields">
		<div class="field">
			<label>나이</label>
			<input type="text" name="age" value="${uVo.age}">
		</div>
		<div class="field">
			<label>성별</label>
			<div class="ui selection dropdown">
				<input type="hidden" name="gender" value="${uVo.gender}">
			 	<i class="dropdown icon"></i>
			 	<div class="default text">성별</div>
			  	<div class="menu">
				    <div class="item" data-value="남자" <c:if test="${uVo.gender eq '남자'}">selected</c:if>>남자</div>
			    	<div class="item" data-value="여자" <c:if test="${uVo.gender eq '여자'}">selected</c:if>>여자</div>
			  	</div>
			</div>
		</div>
	</div>				
				
	<div class="field">
		<label>휴대전화 번호</label>
		<input type="text" name="phone" value="${uVo.phone}">
	</div>
	
	<div class="field">
		<label>이메일</label>
		<input type="text" name="email" value="${uVo.email}">
	</div>
	
	<div class="field">
		<label>선호도서 카테고리</label>
		<select class="ui middle aligned fluid search dropdown" name="books" multiple="">
			<option value="">카테고리</option>
			<option value="101" <c:if test="${fn:contains(loginUser.books, '101')}">selected</c:if>>소설</option>
			<option value="102" <c:if test="${fn:contains(loginUser.books, '102')}">selected</c:if>>시/에세이</option>
			<option value="103" <c:if test="${fn:contains(loginUser.books, '103')}">selected</c:if>>예술/대중문화</option>
			<option value="104" <c:if test="${fn:contains(loginUser.books, '104')}">selected</c:if>>사회과학</option>
			<option value="105" <c:if test="${fn:contains(loginUser.books, '105')}">selected</c:if>>역사와 문화</option>
			<option value="107" <c:if test="${fn:contains(loginUser.books, '107')}">selected</c:if>>잡지</option>
			<option value="108" <c:if test="${fn:contains(loginUser.books, '108')}">selected</c:if>>만화</option>
			<option value="109" <c:if test="${fn:contains(loginUser.books, '109')}">selected</c:if>>어린이</option>
			<option value="111" <c:if test="${fn:contains(loginUser.books, '111')}">selected</c:if>>가정과 생활</option>
			<option value="112" <c:if test="${fn:contains(loginUser.books, '112')}">selected</c:if>>청소년</option>
			<option value="116" <c:if test="${fn:contains(loginUser.books, '116')}">selected</c:if>>자연과 과학</option>
			<option value="117" <c:if test="${fn:contains(loginUser.books, '117')}">selected</c:if>>경제경영</option>
			<option value="118" <c:if test="${fn:contains(loginUser.books, '118')}">selected</c:if>>자기계발</option>
			<option value="119" <c:if test="${fn:contains(loginUser.books, '119')}">selected</c:if>>인문</option>
			<option value="120" <c:if test="${fn:contains(loginUser.books, '120')}">selected</c:if>>종교/역학</option>
			<option value="122" <c:if test="${fn:contains(loginUser.books, '122')}">selected</c:if>>컴퓨터/인터넷</option>
			<option value="124" <c:if test="${fn:contains(loginUser.books, '124')}">selected</c:if>>취미/레저</option>
			<option value="126" <c:if test="${fn:contains(loginUser.books, '126')}">selected</c:if>>건강/뷰티</option>
			<option value="128" <c:if test="${fn:contains(loginUser.books, '128')}">selected</c:if>>여행</option>
		</select>
	</div>
	
	<div class="ui error message"></div>
	
	<button class="ui large primary submit button" type="submit">회원정보 수정</button>
	<div class="ui right floated large button" onclick="location.href='index.jsp'">뒤로가기</div>
</form>
</div>
<script>
	$('.ui.dropdown').dropdown();
	$('.ui.checkbox').checkbox();
	
	$(document).ready(function() {
		$('.ui.form').form({
			inline: true,
			on: 'blur',
			fields: {
				userid: {
					identifier : 'userid',
					rules: [
						{
							type: 'empty',
							prompt: '아이디를 입력해주세요!'
						},
						{
							type: 'minLength[4]',
							prompt: '아이디는 {ruleValue}자리 이상이어야 합니다!'
						}
					]
				},
				pwd: {
					identifier: 'pwd',
					rules: [
						{
							type: 'empty',
							prompt: '비밀번호를 입력해주세요!'
						},
						{
							type: 'minLength[4]',
							prompt: '비밀번호는 {ruleValue}자리 이상이어야 합니다!'
						}
					]
				},
				pwd_check: {
					identifier: 'pwd_check',
					rules: [
						{
							type: 'empty',
							prompt: '비밀번호를 다시 입력해주세요!'
						},
						{
							type: 'minLength[4]',
							prompt: '비밀번호는 {ruleValue}자리 이상이어야 합니다!'
						},
						{
							type: 'match[pwd]',
							prompt: '비밀번호가 서로 일치하지 않습니다!'
						}
					]
				},
				age: {
					idenfitier: 'age',
					rules: [
						{
							type: 'integer',
							prompt: '숫자를 입력해주세요!'
						}
					]
				},
				gender: {
					identifier: 'gender',
					rules: [
						{
							type: 'empty',
							prompt: '성별을 선택해주세요!'
						}
					]
				},
				checkbox: {
					identifier: 'books',
					rules: [
						{
							type: 'minCount[1]',
							prompt: '최소한 한 개의 선호도서 카테고리를 선택해야 합니다!'
						}
					]
				}
			}
		});
	});
</script>
</body>
</html>