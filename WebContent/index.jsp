<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kooB</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
<script type="text/javascript" src="script/member.js"></script>
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
<style>
/*
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
	font-family: Nanum Gothic;
}
*/
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
body {
	font-family: 'Noto Sans kr';
}
.fixed.menu {
	background: #FFFFFF;
	border-color: #FFFFFF;
}
.ui.button {
	border-radius : 2em;
}
.ui.selection.dropdown {
	border-color : #FFFFFF;
	margin-right : 2em;
}
.ui.placeholder.segment {
	background-color: #06213E;
	margin-top : 3.66em;
}
.header.divider {
	padding: 2em 0em;
}
.ui.vertical.stripe {
	padding: 4em 0em;
}
img {
	margin-right : 1em;
}
#banner {
	margin-top : 1em;
}
.ui.vertical.stripe h3 {
	font-size: 2em;
}
.ui.vertical.stripe .button + h3,
.ui.vertical.stripe p + h3 {
	margin-top: 3em;
}
.ui.vertical.stripe .floated.image {
	clear: both;
}
.ui.vertical.stripe p {
	font-size: 1.33em;
}
.ui.vertical.stripe.quote {
	padding : 1em;
}

.footer.segment {
	padding: 2em 0em;	
}
.footer.segment p {
	line-height : 1.5em;
}

#gradient {
	background: linear-gradient(#94b6d2, #9198e5);
	color : white;
}

#banner {
	margin-top : 1em;
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
						<option value="1" selected>도서명</option>
						<option value="2">주제어</option>
						<option value="3">저자·역자</option>
						<option value="4">출판사</option>
					</select>
					<input type="text" id="query" name="query" placeholder="검색..." style="width: 200px;">
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
		
	<!-- 메인_배너 -->
	<div class="ui main placeholder segment">
		<div class="ui image">
			<img src="images/main_banner.png">
		</div>
	</div>
		
	<!-- 베스트셀러 1위 도서('오늘의 책') 소개 -->
	<div class="ui vertical stripe segment">
		<div class="ui middle aligned stackable grid container">
			<div class="row">
				<h1 class="ui header">
					<i class="book icon"></i>
					<div class="content">
						오늘의 책 : 애쓰지 않고 편안하게
						<div class="sub header">김수현 | 놀(다산북스)</div>
					</div>
				</h1>
			</div>
			<div class="ui divider"></div>
			<div class="row">
				<div class="ten wide column">
					<h3 class="ui header">“어떤 순간에도 만만하지 않은 평화주의자가 될 것!”<br>[나는 나로 살기로 했다] 김수현 작가 4년 만의 신작</h3>
					<p style="font-family: Nanum Gothic; font-size: 16px;">
					100만 독자에게 사이다 같은 통찰과 단단한 위로를 전해준 김수현 작가의 신작.<br>
					당당하게 “나로 살기로 했다”고 외치던 저자는 4년 만에 한층 성숙해진 모습으로 돌아와<br>
					“나를 지키는 관계 맺기”를 이야기한다.<br>
					어느 날 완벽하다고 믿어 의심치 않았던 관계를 상대는 전혀 다르게 생각하고 있었다는 사실을<br>
					깨닫고 관계에 대한 고민을 시작했고 오랜 시간 고민한 나름의 결과를 이 책에 담았다.
					</p>
					<br>
					<div class="ui divider"></div>
					<h3 class="header">공감 × 솔루션 = 김수현 에세이<br>에세이 독자들이 4년간 기다려온 바로 그 책</h3>
					<p style="font-family: Nanum Gothic; font-size: 16px;">
					100만 독자가 열광한 김수현 에세이의 가장 큰 매력은 단연 공감과 솔루션의 적절한 조화이다. <br>
					읽는 이의 마음을 찰떡같이 알아주는 것에서 한발 더 나아가 분명한 해결책까지 제안한다.
					</p>
				</div>
				<div class="five wide right floated column">
					<img src="http://bimage.interpark.com/goods_image/1/3/7/3/332991373s.jpg" class="ui large bordered rounded image">
				</div>
			</div>
			<div class="row">
				<div class="center aligned column">
					<a class="ui huge inverted violet button" href="bookDetail.do?itemid=332991373">도서정보 확인하기</a>
				</div>
			</div>
		</div>
	</div> 
	
	<!-- 로그인 배너 -->
	<div class="ui container" id="banner">
		<c:if test="${empty loginUser}">
			<a href="login.do" class="ui fluid image">
				<img src="images/login_banner.png">
			</a>
		</c:if>
		<c:if test="${!empty loginUser}">
			<a href="#Redirect" class="ui fluid image" data-tooltip="로그인 되었습니다. kooB의 서비스를 마음껏 즐겨주세요!!" data-inverted>
				<img src="images/login_banner.png">
			</a>
		</c:if>
	</div>
	
	<div class="ui divider"></div>
	
	
	<!-- 지금, 이 책 소개 -->
	<div class="ui vertical stripe quote segment">
		<div class="ui middle aligned equal width stackable internally celled grid container">
			<div class="ui center aligned container">
				<h3 class="ui header">&lt; 지금, 이 책 &gt;<br><br></h3>
			</div>
			<div class="row">
				<!-- 지금, 이 책 1 -->
				<div class="column">
					<div class="ui middle aligned grid">
						<div class="six wide column">
							<div class="ui fluid image">
								<img src="http://bimage.interpark.com/goods_image/8/2/0/5/333228205s.jpg">
							</div>
						</div>
						<div class="nine wide column">
							<h3 class="header">시선으로부터,</h3>
							<div class="meta">정세랑 저 | 문학동네</div><br>
							<p><i class="red heart icon">&nbsp;629</i>
							<br>"이 소설은 무엇보다
							<br>20세기를 살아낸 여자들에게
							<br>바치는 21세기의 사랑이다."
							</p>
							<br><br>
							<a class="ui purple button" href="bookDetail.do?itemid=333228205">바로가기</a>
						</div>
					</div>
				</div>
				
				<!-- 지금, 이 책 2 -->
				<div class="column">
					<div class="ui middle aligned grid">
						<div class="right aligned nine wide column">
							<br><h3 class="header">랩걸</h3>
							<div class="meta">호프 자런 저 | 김희정 역 | 알마</div><br>
							<p><span style="color: green">556&nbsp;</span><i class="green thumbs up icon"></i>
							<br>'과학 하는 여자'로 살아온
							<br>자신의 삶을 나무의 성장에 빗대어
							<br>현실적이고 담담하게 털어놓는다.
							</p>
							<br><br>
							<a class="ui green button" href="bookDetail.do?itemid=265216467">바로가기</a>
						</div>
						<div class="six wide column">
							<div class="ui fluid image">
								<img src="http://bimage.interpark.com/goods_image/6/4/6/7/265216467s.jpg">
							</div>
						</div>
						<div class="nine wide column"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 수직배너 & 7월 문화달력 -->
	<div class="ui middle aligned center aligned grid container">
		
		<div class="twelve wide column">
			<div class="ui image">
				<img src="images/calendar.png">
			</div>
		</div>
		<div class="four wide column">
			<div class="ui image" id="banner">
				<img src="images/vertical_banner.png">
			</div>
		</div>
	</div>
	<div class="ui divider"></div>
	
	<!-- kooB's pick, 독서와 찰떡궁합 여름 간식 -->
	<div class="ui vertical stripe segment">
		<div class="ui middle aligned equal width stackable internally celled grid container">
			
			<!-- kooB's pick -->
			<div class="column">
				<div class="ui link items">
					<a class="item" href="bookDetail.do?itemid=310008890">
						<div class="image">
							<img src="http://bimage.interpark.com/goods_image/8/8/9/0/310008890s.jpg">
						</div>
						<div class="content">
							<h3 class="ui header">역사의 쓸모</h3>
							<div class="meta">최태성 저 | 다산초당</div>
							<div class="description" style="font-family: Nanum Gothic; font-size: 18px;">
								<br>수백 년 전 이야기로 오늘의 고민을
								<br>해결하는 방법을 알려주는 세상에서
								<br>가장 실용적인 역사 사용 설명서<br><br>
								<i class="blue star icon"></i>
								<i class="blue star icon"></i>
								<i class="blue star icon"></i>
								<i class="blue star icon"></i>
								<i class="blue star icon"></i>&nbsp;9.8<br>
							</div>
							<div class="extra">
								<div class="ui label">역사와 문화</div>
								<div class="ui label">2019 올해의 책</div>
								<div class="ui label">#쓸모없는역사는없다</div>
							</div>
						</div>
					</a>
					
					<div class="ui horizontal large header divider">kooB's pick</div>
					
					<a class="item" href="bookDetail.do?itemid=322398501">
						<div class="image">
							<img src="http://bimage.interpark.com/goods_image/8/5/0/1/322398501s.jpg">
						</div>
						<div class="content">
							<h3 class="ui header">지적 대화를 위한 넓고 얕은 지식 제로</h3>
							<div class="meta">채사장 저 | 웨일북</div>
							<div class="description" style="font-family: Nanum Gothic; font-size: 18px;">
								<br>현대인에게 광대한 영향을 
								<br>미치고 있는 거대 사상에 관한 
								<br>가장 쉽고 입체적인 안내서<br><br>
								<i class="brown star icon"></i>
								<i class="brown star icon"></i>
								<i class="brown star icon"></i>
								<i class="brown star icon"></i>
								<i class="brown star icon"></i>&nbsp;9.7<br>
							</div>
							<div class="extra">
								<div class="ui label">인문</div>
								<div class="ui label">#어디쓰는지식인고</div>
								<div class="ui label">#교양을쌓을교양</div>
							</div>
						</div>
					</a>
				</div>
			</div>
				
			<!-- 독서와 찰떡궁합 여름 간식 -->
			<div class="column">
				<div class="ui center aligned middle aligned segment">
					<a href="#Redirect" class="ui fluid image" id="callModal">
						<img src="images/cardnews1.png">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 카드뉴스 modal -->
	<div class="ui modal">
		<i class="close icon"></i>
		<div class="ui container">
			<div class="image content">
				<div class="ui image">
					<img src="images/cardnews1.png">
					<img src="images/cardnews2.png">
					<img src="images/cardnews3.png">
					<img src="images/cardnews4.png">
					<img src="images/cardnews5.png">
				</div>
			</div>
		</div>
		<div class="actions">
			<div class="ui deny button">Cancel</div>
			<div class="ui approve button">OK</div>
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
	$('#menu').click(function() {
		$('.ui.sidebar').sidebar('setting', 'transition', 'overlay').sidebar('toggle');
	});
	
	$('.ui.dropdown').dropdown();
	
	$('#callModal').click(function() {
		$('.ui.modal').modal('show');	
	});
	
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