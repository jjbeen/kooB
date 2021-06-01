<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 아이디 찾기 결과</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
}
.segment {
	height : 400px;
}
</style>
<body>
<!-- 입력한 정보에 해당하는 아이디가 없는 경우 -->
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
<!-- 입력한 정보에 해당하는 아이디가 있는 경우 -->
<c:if test="${!empty result}">
	<div class="ui placeholder segment">
		<div class="ui icon header">
			<i class="user circle icon"></i>
			당신의 아이디는 [ ${result} ]입니다.
		</div>
		<div class="inline">
			<div class="ui positive button" onclick="location.href='login.do'">로그인 화면으로</div>
			<div class="ui button" onclick="location.href='searchId.do'">뒤로가기</div>
		</div>	
	</div>
</c:if>
</body>
</html>