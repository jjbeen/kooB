<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 비밀번호 찾기 결과</title>
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
.segment {
	height : 400px;
}
</style>
</head>
<body>
<!-- 입력한 정보에 해당하는 계정이 없는 경우 -->
<c:if test="${empty result}">
	<div class="ui placeholder segment">
		<div class="ui icon header">
			<i class="frown outline icon"></i>
			입력하신 정보와 일치하는 계정이 없습니다.
		</div>
		<div class="inline">
			<div class="ui button" onclick="location.href='login.do'">로그인 화면으로</div>
			<div class="ui button" onclick="location.href='searchId.do'">뒤로가기</div>
		</div>
	</div>
</c:if>
<!-- 입력한 정보에 해당하는 계정이 있는 경우 -->
<c:if test="${!empty result}">
	<div class="ui placeholder segment">
		<div class="ui icon header">
			<i class="lock icon"></i>
			개인정보 유출의 위험이 있으므로 비밀번호를 재설정합니다.
		</div>
		
		<div class="ui center aligned grid">
			<div class="column">
				<form class="ui form" action="resetPwd.do" method="post">
					<input type="hidden" name="userid" value="${userid}">
					<div class="field">
						<div class="ui left icon input">
							<i class="key icon"></i>
							<input type="password" name="pwd" placeholder="비밀번호">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="key icon"></i>
							<input type="password" name="pwd_check" placeholder="비밀번호 확인">
						</div>
					</div>
					
					<div class="ui center aligned grid">
						<div class="six wide column"></div>
						<div class="two wide column">
							<button class="ui fluid positive submit button" type="submit">제출</button>
						</div>
						<div class="two wide column">
							<button class="ui fluid button" onclick="location.href='index.jsp'">홈으로</button>
						</div>
						<div class="six wide column"></div>
					</div>			
				</form>
			</div>
		</div>
	</div>
</c:if>

<script>
	$(document).ready(function() {
		$('.ui.form').form({
			inline: true,
			on: 'blur',
			fields: {
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
				}
			}
		});
	});
</script>
</body>
</html>