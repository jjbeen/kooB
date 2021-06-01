<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 아이디 찾기</title>
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
	padding-top : 50px;
}
.container {
	margin-bottom : 50px;
}
.column {
	max-width : 450px;
}
</style>
</head>
<body>
<div class="ui center aligned grid">
	<div class="column">
		<div class="ui container">
			<form class="ui form" action="searchId.do" method="post">
				<h2 class="ui dividing center aligned header">아이디 찾기</h2>
				<div class="field">
					<div class="ui left icon input">
						<i class="address card icon"></i>
						<input type="text" name="name" placeholder="이름">
					</div>
				</div>
				<div class="field">
					<div class="ui left icon input">
						<i class="envelope icon"></i>
						<input type="text" name="email" placeholder="이메일">
					</div>
				</div>
				
				<div class="ui error message"></div>
				
				<button class="ui positive submit button" type="submit">제출</button>
				<div class="ui button" onclick="location.href='index.jsp'">뒤로가기</div> 
			</form>
		</div>
	</div>
</div>
</body>

<script>
	$(document).ready(function() {
		$('.ui.form').form({
			on: 'blur',
			fields: {
				name: {
					identifier : 'name',
					rules: [
						{
							type: 'empty',
							prompt: '이름을 입력해주세요!'
						}
					]
				},
				email: {
					identifier : 'email',
					rules: [
						{
							type: 'empty',
							prompt: '이메일을 입력해주세요!'
						},
						{
							type: 'email',
							prompt: '유효한 이메일 형식이 아닙니다!'
						}
					]
				}
			}
		});
	});
</script>
</html>