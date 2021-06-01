<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 로그인</title>
<script type = "text/javascript" src = "script/member.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
}
body > .grid {
	height: 100%;
}
.image {
	margin-top: -100px;
	color : #94B6D2;
}
.column {
	max-width: 450px;
}
.button {
	background-color : #94B6D2;
}
</style>
</head>
<body>

<div class="ui middle aligned center aligned grid">
	<div class="column">
		<h2 class="ui image header">
			<a class="ui image" href="index.jsp">
				<img src="images/logo.jpg">
			</a>
			로그인
		</h2>
		<form class="ui large form" action="login.do" method="post" name="frm">
			<input type="hidden" name="prev_url" value="${prev_url}">
			<div class="ui stacked segment">
				<div class="field"> <!-- 아이디 넣는곳 -->
					<div class="ui left icon input">
						<i class="user icon"></i>
						<input type="text" name="userid" value="${userid}" placeholder="아이디">
					</div>
				</div>
				<div class="field"> <!-- 비밀번호 넣는곳 -->
					<div class="ui left icon input">
						<i class="lock icon"></i>
						<input type="password" name="pwd" placeholder="비밀번호">
					</div>
				</div>
				<div class="ui fluid large submit blue button">로그인</div>
			</div>
			
			<div class="ui error message"></div>
			
			<c:if test="${!empty message}">
				<c:choose>
					<c:when test="${check eq 'success'}">
						<div class="ui positive message">
							<ul class="list">
								<li>${message}</li>
							</ul>
						</div>
					</c:when>
					<c:otherwise>
						<div class="ui negative message">
							<ul class="list">
								<li>${message}</li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
		</form>
		
		<div class="ui message">
			처음 오셨나요? <a href="join.do">&nbsp;&nbsp;회원가입</a>
		</div>
		<div class="ui message">
			<a href="searchId.do">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;|
			<a href="searchPwd.do">&nbsp;&nbsp;&nbsp;비밀번호 찾기</a>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	$('.ui.form').form({
		fields: {
			id: {
				ientifier : 'userid',
				rules: [
					{
						type: 'empty',
						prompt : '아이디를 입력해주세요!'
					}
				]
			},
			password: {
				identifier: 'pwd',
				rules: [
					{
						type: 'empty',
						prompt: '비밀번호를 입력해주세요!'
					}
				]
			}
		}
	});
});
</script> 

</body>
</html>