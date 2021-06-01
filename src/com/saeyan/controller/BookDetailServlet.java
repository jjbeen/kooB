package com.saeyan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.BookDAO;
import com.saeyan.dto.BookVO;

@WebServlet("/bookDetail.do")
public class BookDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemid = Integer.parseInt(request.getParameter("itemid"));
		
		BookDAO bDao = BookDAO.getInstance();
		BookVO bVo = bDao.getBook(itemid);
		
		List<BookVO> similarBookList = bDao.selectSimilarBooks(itemid, bVo.getAuthor(), bVo.getCategoryName());
		
		request.setAttribute("bVo", bVo);
		request.setAttribute("similarBookList", similarBookList);
		
		String passages[] = {
				"나에겐 아몬드가 있다. 당신에게도 있다.<br>당신이 가장 소중하게 여기거나 가장 저주하는 누군가도 그것을 가졌다.<br>아무도 그것을 느낄 수는 없다. 그저 그것이 있음을 알고 있을 뿐이다.<br>&emsp;-〈아몬드〉중에서 -",
				"특별한 것과 소중한 것은 다르다.<br>우리의 가족, 친구, 연인이 특별하고 우월한 존재여서 소중한 게 아니라 우리가 마음을 주어 소중해지는 것처럼, 나 자신과 내가 가진 것을 그 자체로 소중하게 여길 수 있어야 한다.<br>그러면 자존감은 채워지기 시작한다.<br>&emsp;-〈애쓰지 않고 편안하게〉중에서 -",
				"새는 알에서 나오려고 투쟁한다.<br>알은 세계이다.<br>태어나려는 자는 하나의 세계를 깨뜨려야 한다.<br>&emsp;-〈데미안〉중에서 -",
				"있는 그대로의 모습으로 만인에게 사랑받을 수는 없다.<br>하지만 역으로 말하면, 있는 그대로의 모습을 받아들인 소수와의 관계는 견고한 것이다.<br>한 번도 실망시키지 않고서는, 나는 누군가와 진실로 가까울 자신이 없다.<br>우리, 마음껏 실망하자. 그리고 자유롭게 도란거리자.<br>&emsp;-〈보통의 언어들〉중에서 -",
				"어쩌면 우린 너무 많은 기적을 당연하게 생각하면서 사는지도 모르겠어.<br>엄마가 딸을 만나고, 가족이 함께 밥을 먹고, 울고 웃는 평범한 일상이 분명 누군가한테는 기적 같은 일일 거야.<br>그저 우리가 눈치채지 못하고 있을 뿐이지.<br>&emsp;-〈세계를 건너 너에게 갈게〉중에서 -",
				"똑같이 터미널에서 일한다 해도 터미널고속의 직원이냐, 파견 근로자냐에 따라 마시는 공기도 달랐다.<br>차량이 내뿜는 매연과 분진은 비정규직인 파견 노동자들이 마시고, 터미널고속 직원들은 신선한 공기를 마신다.<br>정규직은 공기 순환 장치가 달린 사무실에서 근무하고<br>용역인 경비원들은 매연으로 가득한 지하 주차장과 노상에서 일하기 때문이다.<br>&emsp;-〈임계장 이야기〉중에서 -",
				"조국은 언덕 위의 그 향기로운 덤불 속에, 바다 속에,<br>자유로운 고장들과 따뜻한 사랑의 무게 속에 있었다.<br>&emsp;-〈페스트〉중에서 -",
				"여러 조건이 잘 맞으면 이야기는 자연스레 생겨나고 사이를 오가게 된다.<br>“어디, 자네도 얘기 한번 해보게” 한다고 해서 소통이 일어나는 게 결코 아니다.<br>빛과 온도와 습도가 잘 맞으면 흙속의 씨앗들이 너도나도 싹트듯이,<br>편안하고 서로에게 집중할 수 있는 조건이 갖춰지면 이야기꽃이 피어나는 것이다.<br>‘이야기꽃’이라는 표현이 괜히 있는 게 아니구나 싶었다.<br>&emsp;-〈말하기를 말하기〉중에서 -",
				"사연을 아는 사람들은 내게 수십 년 동안 찾아와 위로의 말을 건넸다네.<br>그래도 당신들은 같은 우주 안에 있는 것이라고. 그 사실을 위안 삼으라고.<br>하지만 우리가 빛의 속도로 갈 수조차 없다면, 같은 우주라는 개념이 대체 무슨 의미가 있나?<br>&emsp;-〈우리가 빛의 속도로 갈 수 없다면〉중에서 -",
				"부탁하건대, 언젠가는 내가 당신의 자살을 막은 것을 용서해주면 좋겠다.<br>나는 그 순간 살아야 했고, 당신을 살려야만 내가 계속 살 수 있을 것만 같았다.<br>나는 아직 배에서 내리지 않았다. 우리는 여전히 함께 배를 타고 있다.<br>그것만큼은 오래도록 잊지 않을 것이다.<br>&emsp;-〈죽은 자의 집 청소〉중에서 -",
				"나는 그림을 왜 보는 걸까? 무엇을 위해 미술 관련 책을 읽고, 미술관에 갈까?<br>대답은 쉽게 나왔습니다. “감동하고 싶어서지.”<br>&emsp;-〈우리 각자의 미술관〉중에서 -",
	            "후회라는 감정에 지나치게 매몰돼서는 안 됩니다.<br>후회하는 대신 내가 저지른 잘못을 정확하게 인식하고 반성함으로써 다시 삶을 살아갈 힘을 얻어야 하는 거죠.<br>저 역시 잘못을 후회하고 반성할 때마다 철학자 키르케고르가 했던 말을 격언처럼 되새기곤 합니다.<br>“인생은 뒤돌아볼 때 비로소 이해되지만, 우리는 앞을 향해 살아야만 하는 존재다.”<br>&emsp;-〈내가 원하는 것을 나도 모를 때〉 중에서 -",
	            "“오늘을 살아가는 우리는 무한에 가까운 재료의 우주에서 극히 일부만을 바라보고 있을 뿐이다.”<br>&emsp;-〈세계사를 바꾼 12가지 신소재〉 중에서 -",
	            "“나는 나 자신에게 증명할 게 많다. 그 중 하나는 내가 두려움 없이 인생을 살 수 있다는 것이다.”<br>&emsp;-〈언제나 길은 있다〉 중에서 -",
	            "처음 해보는 일은 계획할 수 없습니다. 혁신은 계획으로 이루어지지 않습니다.<br>혁신은 다양한 시도를 하고 계획을 끊임없이 수정해나가는 과정에서 이루어집니다.<br>중요한 건 계획을 완수하는 것이 아니라 목표를 완수하는 것입니다.<br>우리는 목표를 완수하기 위해 계획을 끊임없이 수정하는 법을 배워야 합니다.<br>&emsp;-〈열두 발자국〉 중에서-",
	            "내게는 값진 보석이지만 타인에게는 발에 차이는 돌덩이가 될 수 있다는 것,<br>혹은 그 반대의 상황이 되기도 한다는 것을 받아들여야 한다.<br>그것을 알아야만 크고 작은 차이들을 조정하고 갈등을 통합해나갈 수 있다. 차이는 분명 갈등을 만들어낸다.<br>그러나 우리가 마주하는 수많은 공식의 차이가 결국 ‘인간성과 우열’의 차이가 아니라<br>‘경험과 공식’의 차이라는 것을 알면 한결 마음이 부드러워진다.<br>&emsp;-〈말 그릇〉 중에서 -",
	            "철학자 : 단적으로 말해 “자유란 타인에게 미움을 받는 것”일세.<br>청 년 : 네? 무슨 말씀이신지?<br>철학자 : 자네가 누군가에게 미움을 받는 것.<br>그것은 자네가 자유롭게 살고 있다는 증거이자 스스로의 방침에 따라 살고 있다는 증표일세.<br>&emsp;-〈미움받을 용기〉 중에서-",
	            "탐험의 욕구는 인간의 본성이다. 우리는 나그네로 시작했으며 나그네로 남아 있다.<br>인류는 우주의 해안에서 충분히 긴 시간을 꾸물대며 꿈을 키워 왔다.<br>이제야 비로소 별들을 향해 돛을 올릴 준비가 끝난 셈이다.<br>&emsp;-〈코스모스〉 중에서 -",
	            "인간은 발길 닿는 곳마다 엉망으로 만들어 놓는 존재다.<br>&emsp;-〈인간의 흑역사〉 중에서-",
	            "저는 시처럼 쓰지는 못합니다. 시인이 아니기 때문이지요.<br>글귀들을 멋지게 배치해서, 그늘과 빛이 피어나오게 할 수는 없습니다. 화가가 아니니까요.<br>손짓과 몸짓으로 기분과 생각을 나타낼 수조차 없습니다. 무용가가 아니니까요.<br>하지만 저는 소리를 가지고서라면 그렇게 할 수 있습니다. 저는 음악가입니다.<br>&emsp;-〈모차르트의 편지〉 중에서-"
		};
		
		int num = (int)(Math.random()*20);
		String result = passages[num];
		request.setAttribute("result", result);
				
		RequestDispatcher dispatcher = request.getRequestDispatcher("book/bookDetail.jsp");
		dispatcher.forward(request, response);
	}
}