package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.UseruserDAO;
import com.saeyan.dto.UseruserVO;

@WebServlet("/memberUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String userid = ((UseruserVO) request.getSession().getAttribute("loginUser")).getUserid(); 		
 		
		// String userid = request.getParameter("userid");
		
		UseruserDAO uDao = UseruserDAO.getInstance();
		UseruserVO uVo = uDao.getMember(userid);
		
		request.setAttribute("uVo", uVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/memberUpdate.jsp");
		dispatcher.forward(request, response);
 	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글 깨짐을 방지
		
		//폼에서 입력한 회원 정보 얻어오기
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String[] bookArray = request.getParameterValues("books");

		String books = null;
		StringBuilder sb = new StringBuilder();

		for(String book : bookArray) {
		  sb.append(book).append(", ");
		}

		sb.deleteCharAt(sb.length()-1);
		sb.deleteCharAt(sb.length()-1);

		books = sb.toString();
		
		//회원 정보를 저장할 객체 생성
		UseruserVO uVo = new UseruserVO();
		uVo.setUserid(userid);
		uVo.setPwd(pwd);
		uVo.setGender(gender);
		uVo.setAge(Integer.parseInt(age));
		uVo.setPhone(phone);
		uVo.setEmail(email);
		uVo.setBooks(books);
		
		UseruserDAO uDao = UseruserDAO.getInstance();
		
		uDao.updateMember(uVo);
		response.sendRedirect("index.jsp");
	}
}