<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB - 도서 상세정보</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
}
#container {
	background: linear-gradient(#94b6d2, #9198e5);
}
.ui.container {
	padding : 0em 6em;
}
.ui.blue.button {
	border-radius : 2em;
}
.ui.selection.dropdown {
	border-color : #FFFFFF;
	margin-right : 2em;
}
.ui.segment {
	background-color : #F9FAFB;
}
.ui.segment h3 {
	font-size : 1.8em;
}
.ui.segment p {
	font-size : 1.2em;
	line-height : 1.8em;
}
.description {
	margin-top : 1.5em;
}
#main {
	padding-bottom : 3em;
}
.footer.segment {
	padding: 2em 0em;	
}
.footer.segment p {
	font-size : 1em;
	line-height : 1.5em;
}

#passage {
	margin-top: 1.5em;
	margin-right: 10em;
	margin-left: 10em;
	font-family: Nanum Myeongjo;
	font-size: 18pt;
	text-align: center;
	color: white;
}
</style>
</head>
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
	
	<!-- 문구 출력 segment -->
	<c:if test="${bVo.categoryName eq '소설'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #bbd2c5, #536976, #292e49);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '시/에세이'}">
   	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #0f77a6, #714755, #ebd8e1);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '예술/대중문화'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #7f7fd5, #86a8e7, #91eae4);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '사회과학'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #cc95c0, #dbd4b4, #7aa1d2);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '역사와 문화'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#00f260, #0575e6);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '잡지'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#22c1c3, #fdbb2d);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '만화/라이트노벨'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #5433ff, #20bdff, #a5fecb);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '어린이'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #12c2e9, #c471ed, #f64f59);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '가정과 생활'}">
   	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #00416a, #799f0c, #ffe000);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '청소년'}">
   	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#e65c00, #f9d423);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '자연과 과학'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#191654, #43c6ac);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '경제경영'}">
   	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#cc2b5e, #753a88);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '자기계발'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#3494e6, #ec6ead);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '인문'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#e8cbc0, #636fa4);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '종교/역학'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#67b26f, #4ca2cd);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '컴퓨터/인터넷'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#4ecdc4, #556270);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '취미/레저'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(#c2e59c, #64b3f4);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '건강/뷰티'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #feac5e, #c779d0, #4bc0c8);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>
	<c:if test="${bVo.categoryName eq '여행'}">
	<div class="ui placeholder segment" id="container" style="background: linear-gradient(0.25turn, #77a1d3, #79cbca, #e684ae);">
		<h4 id="passage">
		${result}
		</h4>
	</div></c:if>

	<!-- 도서 정보 -->
	<div class="ui middle aligned container" id="main">
		<div class="ui items">
			<div class="item">
				<div class="image">
					<img src="${bVo.coverLargeUrl}">
				</div>
				<div class="content">
					<br>
					<h2 class="ui header">${bVo.title}</h2>
					<div class="meta">
						<span><c:if test="${!empty bVo.author}">${bVo.author} · </c:if>${bVo.categoryName}</span>
					</div>
					<br>
					<div class="ui divider"></div>
					<div class="description">
						<h3 class="ui header">
							<i class="blue star icon"></i>${bVo.customerReviewRank}&nbsp;(${bVo.reviewCount}명)
						</h3>
						
						<div class="ui divider"></div>
						<h3 class="ui header">평가하기<br></h3>
						
						<c:if test="${empty loginUser}">
							<div class="ui massive star rating" id="nonlogin_rate" data-rating="0" data-max-rating="5"></div>
						</c:if>
						<c:if test="${!empty loginUser}">
							<div class="ui massive star rating" id="login_rate" data-rating="0" data-max-rating="5"></div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 로그인 없이 평가하기를 눌렀을 경우 뜨는 modal(팝업) -->
		<div class="ui basic modal">
			<div class="ui middle aligned center aligned container">
				<div class="ui icon header">
					<i class="inverted star outline icon"></i>
					<span style="color:white;">로그인이 필요해요.</span>
				</div>
				<br>
				<div class="center aligned content">
					<p>평가하시려면 로그인이 필요해요. 회원가입 또는 로그인하고 별점을 기록해보세요.</p>
				</div>
				<br><br>
				<div class="actions">
					<div class="ui red basic cancel inverted button">
						<i class="remove icon"></i>
						뒤로가기
					</div>
					<div class="ui green ok inverted button" onclick="location.href='login.do?prev_url=${prev_url}'">
						<i class="checkmark icon"></i>
						로그인하기
					</div>
				</div>
			</div>
		</div>
		
		<div class="ui segment">
			<!-- 기본 정보 -->
			<h3 class="ui header">기본 정보</h3>
			<p>
			${bVo.title}<br>
			<c:if test="${!empty bVo.author}">${bVo.author} · </c:if>${bVo.categoryName} · ${bVo.publisher}<br>
			${bVo.pubDate} 발행
			</p>
			<div class="ui divider"></div>
			
			<!-- 책 소개(너무 길다 싶으면 '더보기' 기능을 통해 처리) -->
			<h3 class="ui header">책 소개</h3>
			<p>
			${bVo.description}<br><br>
			</p>
			<div class="ui divider"></div>
			
			<!-- 저자/역자 -->
			<h3 class="ui header">저자/역자</h3>
			<div class="ui middle aligned equal width stackable internally celled grid">
				<!-- 저자 -->
				<c:if test="${!empty bVo.author}">
					<div class="column">
						<div class="ui items">
							<div class="ui item">
								<div class="ui tiny image">
									<img src="images/empty_user.png">	
								</div>
								<div class="content">
									<div class="header">${bVo.author}</div>
									<div class="meta">저자</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				
				<!-- 역자 -->
				<c:if test="${!empty bVo.translator}">
					<div class="column">
						<div class="ui items">
							<div class="ui item">
								<div class="ui tiny image">
									<img src="images/empty_user.png">
								</div>
								<div class="content">
									<div class="header">${bVo.translator}</div>
									<div class="meta">역자</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div class="ui divider"></div>
			
			<!-- 비슷한 도서 -->
			<h3 class="ui header">비슷한 도서</h3>
			<div class="ui container" id="list">
				<div class="ui link four stackable cards">
					<c:forEach var="book" items="${similarBookList}">
						<div class="ui centered card" onclick="location.href='bookDetail.do?itemid=${book.itemid}'">
							<div class="ui fluid image">
								<img src="${book.coverLargeUrl}">
							</div>
							<div class="center aligned content">
								<b>${book.title}</b>
							</div>
							<div class="center aligned extra content">
								<i class="basic star icon"></i>&nbsp;${book.customerReviewRank}
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
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
	$(document).ready(function() {
		$('#menu').click(function() {
			$('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
		});
		
		$('.ui.dropdown').dropdown();

		$('#nonlogin_rate').rating();		
		$('#nonlogin_rate').click(function() {
			$('.ui.modal').modal('show');	
		});
		
		$('#login_rate').rating();
		
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
	});
</script>
</body>
</html>