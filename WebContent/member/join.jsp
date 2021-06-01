<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 회원가입</title>
<script type="text/javascript" src="script/member.js"></script>
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
	margin-top : 50px;
}
.ui.container {
	margin-bottom : 50px;
}

input[type=button] {
	vertical-align: middle;
}
#check {
	margin-top : 30px;
	padding-top : 12.5px;
	align-items : center;
}
.ui .grid {
	margin-bottom : 1px;
}
div .field > .ui.selection.dropdown {
	margin-top : 25px;
	padding-top : 12.5px;
	align-items : center;
}
div .field > .ui.search.dropdown {
	margin-top : 3px;
	padding-top : 3px;
}
</style>
</head>
<body>
<div class="ui text container">
	<div class="column">
		<h1 class="ui center aligned header">
			회원 가입<br><br>
		</h1>
		
		<form class="ui large form" action="join.do" method="post" name="frm">
			<div class="ui raised stacked segment">
			
				<!-- 아이디 -->
				<div class="ui grid">
					<div class="thirteen wide column">
						<div class="required field">
							<label><a class="ui black ribbon label">아이디</a></label>
							<input type="text" name="userid" placeholder="아이디를 입력하세요">
							<input type="hidden" name="reid">
						</div>	
					</div>
					<div class="three wide column">
						<div class="ui left fluid button" id="check" onclick="idCheck()">중복체크</div>	
					</div>
				</div>
				
				<!-- 비밀번호 -->
				<div class="required field">
					<label><a class="ui black ribbon label">비밀번호</a></label>					
					<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요">
				</div>
				
				<!-- 비밀번호 확인 -->
				<div class="required field">
					<label><a class="ui black ribbon label">비밀번호 확인</a></label>
					<input type="password" name="pwd_check" placeholder="비밀번호 확인">
				</div>
				
				<!-- 이름 -->
				<div class="field">
					<a class="ui black ribbon label">이름</a>
					<input type="text" name="name" placeholder="이름을 입력하세요">
				</div>
				
				<!-- 나이 & 성별-->
				<div class="ui two fields">
					<div class="field">
						<a class="ui black ribbon label">나이 &amp; 성별</a>
						<input type="text" name="age" placeholder="나이를 입력하세요">
					</div>
					<div class="field">
						<div class="ui selection dropdown">
							<input type="hidden" name="gender">
						 	<i class="dropdown icon"></i>
						  	<div class="default text">성별을 선택하세요</div>
						  	<div class="menu">
							    <div class="item" data-value="남자">남자</div>
						    	<div class="item" data-value="여자">여자</div>
						  	</div>
						</div>
					</div>
				</div>				
				
				<!-- 휴대전화 -->
				<div class="field">
					<a class="ui black ribbon label">휴대전화 번호</a>
					<input type="text" name="phone" placeholder="휴대전화 번호를 입력하세요 (010-1234-5678)">
				</div>
				
				<!-- 이메일 -->
				<div class="field">
					<a class="ui black ribbon label">이메일</a>
					<input type="text" name="email" placeholder="이메일을 입력하세요 (java@sun.com)">
				</div>
				
				<!-- 선호도서 카테고리 1안 -->
				<a class="ui black ribbon label">선호도서 카테고리</a><br><br>
				<div class="field">
					<div class="ui four column grid">
						<div class="column">
							<div class="ui checkbox">
								<input type="checkbox" name="books" value="101">
								<label>&nbsp;&nbsp;소설</label>
							</div>
						</div>
						<div class="column">
							<div class="ui checkbox">
								<input type="checkbox" name="books" value="102">
								<label>&nbsp;&nbsp;시/에세이</label>
							</div>
						</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="103">
	      						<label>&nbsp;&nbsp;예술/대중문화</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="104">
	      						<label>&nbsp;&nbsp;사회과학</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="105">
	      						<label>&nbsp;&nbsp;역사와 문화</label>
	      					</div>
	      				</div>
      					<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="107">
	      						<label>&nbsp;&nbsp;잡지</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="108">
	      						<label>&nbsp;&nbsp;만화</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="109">
	      						<label>&nbsp;&nbsp;어린이</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="111">
	      						<label>&nbsp;&nbsp;가정과 생활</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="112">
	      						<label>&nbsp;&nbsp;청소년</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="116">
	      						<label>&nbsp;&nbsp;자연과 과학</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="117">
	      						<label>&nbsp;&nbsp;경제경영</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="118">
	      						<label>&nbsp;&nbsp;자기계발</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="119">
	      						<label>&nbsp;&nbsp;인문</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="120">
	      						<label>&nbsp;&nbsp;종교/역학</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="122">
	      						<label>&nbsp;&nbsp;컴퓨터/인터넷</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="124">
	      						<label>&nbsp;&nbsp;취미/레저</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="126">
	      						<label>&nbsp;&nbsp;건강/뷰티</label>
	      					</div>
	      				</div>
	      				<div class="column">
	      					<div class="ui checkbox">
	      						<input type="checkbox" name="books" value="128">
	      						<label>&nbsp;&nbsp;여행</label>
	      					</div>
	      				</div>
					</div>
				</div>
								
				<!-- 제출/취소 버튼 -->
				<button class="ui large primary submit button" type="submit">회원가입</button>
				<div class="ui large clear button">초기화</div>
				<div class="ui right floated large button" onclick="location.href='login.do'">뒤로가기</div>
			</div>
			
			<div class="ui error message"></div>
		</form>
	</div>
</div>

<!-- ui 작동을 위한 script 및 form 데이터 검증을 위한 script -->
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
							type: 'checked',
							prompt: '최소한 한 개의 선호도서 카테고리를 선택해야 합니다!'
						}
					]
				}
			}
		});
		
		$('form').form('clear');
	});
</script>
</body>
</html>