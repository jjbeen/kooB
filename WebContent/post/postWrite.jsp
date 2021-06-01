<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 감상</title>
<script type="text/javascript" src="script/post.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
}
body:not(.ui.container){
	background-color : #94b6d2;
}
.ui.button {
	border-radius : 2em;
}
.ui.selection.dropdown {
	border-color : #FFFFFF;
	margin-right : 2em;
}
#list {
	padding : 6em 0em;
}
.footer.segment {
	padding: 2em 0em;	
}
.footer.segment p {
	font-size : 1em;
	line-height : 1.5em;
}

</style>
<body>
	<!-- 메뉴 바 -->
	<div class="ui pointing fixed menu">
		<div class="ui container">
			<a class="item" href="index.jsp">
				<i class="blue home icon"></i> kooB
			</a>
			<a class="pusher item" id="menu">
				<i class="blue grid layout icon"></i> 카테고리
			</a>
			<a class="item" href='PostServlet?command=post_list'>
						<i class="blue quote left icon"></i> 감상
			</a>
			<div class="right item">
				<div class="ui inverted action input">
					<select id="condition" class="ui compact selection dropdown">
						<option value="1" <c:if test="${condition eq '1'}"> selected </c:if>>도서명</option>
						<option value="2" <c:if test="${condition eq '2'}"> selected </c:if>>주제어</option>
						<option value="3" <c:if test="${condition eq '3'}"> selected </c:if>>저자·역자</option>
						<option value="4" <c:if test="${condition eq '4'}"> selected </c:if>>출판사</option>
					</select>
					<input type="text" id="query" name="query" value="${query}" placeholder="검색..." style="width: 200px;">
					<button class="ui inverted basic icon button" onclick="search()">
  						<i class="search blue icon"></i>
					</button>
				</div>
			</div>
			<c:if test="${empty loginUser}">
				<button class="ui right floated compact blue button" onclick="location.href='login.do'">
					로그인
				</button>
			</c:if>
			<c:if test="${!empty loginUser}">
				<div class="ui right floated compact basic buttons">
					<button class="ui button">${loginUser.name}</button>
					<button class="ui floating dropdown icon button">
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" onclick="location.href='memberUpdate.do'">
								<i class="edit icon"></i>프로필 편집
							</div>
							<div class="item" onclick="location.href='PostServlet?command=post_write_form'">
								<i class="pencil alternate icon"></i>글쓰기
							</div>
							<div class="item" onclick="location.href='logout.do'">
								<i class="power off icon"></i>로그아웃
							</div>
						</div>
					</button>
				</div>
			</c:if>
		</div>
	</div>
	
	<!-- 게시글 등록  -->
	<div class="ui container" id="list">
		<div class="ui huge breadcrumb">
			<a class="section">글쓰기</a>
		</div>
		<br><br>
		
		<form name="frm" method="post" action="PostServlet">
			<input type="hidden" name="command" value="post_write">
			<input type="hidden" name="id"  value="${loginUser.userid}">
			<div class="ui form">
				<div class="field">
					<input type="text" name="title" size="50" placeholder="제목을 입력하세요">
				</div>
				<div class="field">
					<textarea name="content" placeholder="내용을 입력하세요"></textarea>
				</div>
				<button class="ui primary button" onclick="return postCheck()">  등록</button>
				<button class="ui button" onclick="location.href='PostServlet?command=post_list'">  취소</button>
			</div>
		</form>

	</div>

	<!-- footer -->
	<div class="ui inverted vertical footer segment">
		<div class="ui container">
			<h4 class="ui inverted header">About Us</h4>
			<div class="ui stackable inverted divided stackable grid">
				<div class="nine wide column">
					<p style="color: gray;">
						(주)쿱&nbsp;&nbsp;|&nbsp;&nbsp;대표자: 김재빈&nbsp;&nbsp;|&nbsp;&nbsp;사업자등록번호: 111-222-3333<br>
						주소: 서울시 마포구 잔다리로&nbsp;&nbsp;|&nbsp;&nbsp;TEL: 02-777-888&nbsp;&nbsp;|&nbsp;&nbsp;FAX: 02-777-889<br>
						E-MAIL: koob@koob.co.kr<br>
						<b>Copyright ⓒ kooB Corp. All Rights Reserved.</b></p>
				</div>
				<div class="ui center aligned three wide column">
					<div class="ui inverted link list">
						<a href="#Redirect" class="item">회사소개</a>
						<a href="#Redirect" class="item">고객센터</a>
						<a href="#Redirect" class="item">공지사항</a>
						<a href="#Redirect" class="item">제휴문의</a>
					</div>
				</div>
				<div class="ui center aligned three wide column">
					<div class="ui inverted link list">
						<a href="#Redirect" class="item">이용안내</a>
						<a href="#Redirect" class="item">이용약관</a>
						<a href="#Redirect" class="item">개인정보취급방침</a>
						<a href="#Redirect" class="item">사업자정보확인</a>
					</div>
				</div>
			</div>
			<div class="ui inverted section divider"></div>
			
			<div class="ui center aligned container">
				<div class="ui horizontal inverted small divided link list">
					<a class="item" href="#Redirect">Site Map</a>
					<a class="item" href="#Redirect">Contact Us</a>
					<a class="item" href="#Redirect">Terms and Conditions</a>
					<a class="item" href="#Redirect">Privacy Policy</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 카테고리 목록을 볼 수 있는 사이드바 메뉴 -->
	<div class="ui sidebar inverted vertical menu">
		<a class="item" href="bookList.do?value=전체"><b style="font-size: 24px;">전체</b></a>
		<a class="item" href="bookList.do?value=소설" style="font-size: 16px;">&nbsp; 소설</a>
		<a class="item" href="bookList.do?value=시/에세이" style="font-size: 16px;">&nbsp; 시/에세이</a>
		<a class="item" href="bookList.do?value=예술/대중문화" style="font-size: 16px;">&nbsp; 예술/대중문화</a>
		<a class="item" href="bookList.do?value=사회과학" style="font-size: 16px;">&nbsp; 사회과학</a>
		<a class="item" href="bookList.do?value=역사와 문화" style="font-size: 16px;">&nbsp; 역사와 문화</a>
		<a class="item" href="bookList.do?value=잡지" style="font-size: 16px;">&nbsp; 잡지</a>
		<a class="item" href="bookList.do?value=만화/라이트노벨" style="font-size: 16px;">&nbsp; 만화/라이트노벨</a>
		<a class="item" href="bookList.do?value=어린이" style="font-size: 16px;">&nbsp; 어린이</a>
		<a class="item" href="bookList.do?value=가정과 생활" style="font-size: 16px;">&nbsp; 가정과 생활</a>
		<a class="item" href="bookList.do?value=청소년" style="font-size: 16px;">&nbsp; 청소년</a>
		<a class="item" href="bookList.do?value=자연과 과학" style="font-size: 16px;">&nbsp; 자연과 과학</a>
		<a class="item" href="bookList.do?value=경제경영" style="font-size: 16px;">&nbsp; 경제경영</a>
		<a class="item" href="bookList.do?value=자기계발" style="font-size: 16px;">&nbsp; 자기계발</a>
		<a class="item" href="bookList.do?value=인문" style="font-size: 16px;">&nbsp; 인문</a>
		<a class="item" href="bookList.do?value=종교/역학" style="font-size: 16px;">&nbsp; 종교/역학</a>
		<a class="item" href="bookList.do?value=컴퓨터/인터넷" style="font-size: 16px;">&nbsp; 컴퓨터/인터넷</a>
		<a class="item" href="bookList.do?value=취미/레저" style="font-size: 16px;">&nbsp; 취미/레저</a>
		<a class="item" href="bookList.do?value=건강/뷰티" style="font-size: 16px;">&nbsp; 건강/뷰티</a>
		<a class="item" href="bookList.do?value=여행" style="font-size: 16px;">&nbsp; 여행</a>
	</div>
<script>
	$('#menu').click(function() {
		$('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
	});
	
	$('.ui.dropdown').dropdown();
	
	$('input[name=query]').keydown(function(key) {
		if(key.keyCode == 13) { //엔터의 keyCode = 13
			search();
		}
	});

	function search() {
		var	condition = document.getElementById("condition").value;
		var query = document.getElementById("query").value;
	   
		if(query == "") {
			alert('검색어를 입력해주세요!');
			return false;
		}
		
		location.href = "search.do?condition=" + condition + "&query=" + query;
	}
</script>
</body>
</html>