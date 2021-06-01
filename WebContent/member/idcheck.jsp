<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 아이디 중복 확인</title>
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
	margin-top : 25px;
}
.ui.container {
	margin-bottom : 25px;
}
</style>
</head>
<body>
<div class="ui container">
	<div class="ui large header">아이디 중복 확인</div>
	
	<form class="ui large form" action="idCheck.do" method="get" name="frm">
		<div class="ui stacked segment">
			<div class="ui action input">
				<input type="text" name="userid" value="${userid}" placeholder="아이디">
				<button type="submit" class="ui right floated submit button">중복 체크</button>
			</div>
			
			<c:if test="${result == 1}">
				<script type="text/javascript">
					opener.document.frm.userid.value = "";
				</script>
				<div class="ui negative message">
					${userid}는 이미 사용 중인 아이디입니다.
				</div>
			</c:if>
			<c:if test="${result == -1}">
				<div class="ui positive compact message">
					${userid}는 사용 가능한 아이디입니다.&nbsp;&nbsp;
					<div class="ui basic button" onclick="idok()">사용</div>
				</div>
			</c:if>
		</div>
	</form>
</div>
</body>
</html>