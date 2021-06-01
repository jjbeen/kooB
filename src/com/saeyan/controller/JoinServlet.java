package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saeyan.dao.UseruserDAO;
import com.saeyan.dto.UseruserVO;

@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/join.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String[] bookArray = request.getParameterValues("books");
		
		String books = null;
		StringBuilder sb = new StringBuilder();

		for(String book : bookArray) {
		  sb.append(book).append(", ");
		}

		sb.deleteCharAt(sb.length()-1);
		sb.deleteCharAt(sb.length()-1);
		
		books = sb.toString();
		
		UseruserVO uVo = new UseruserVO();
		uVo.setName(name);
		uVo.setUserid(userid);
		uVo.setPwd(pwd);
		uVo.setGender(gender);
		uVo.setAge(Integer.parseInt(age));
		uVo.setEmail(email);
		uVo.setPhone(phone);
		uVo.setBooks(books);
		
		UseruserDAO uDao = UseruserDAO.getInstance();
		int result = uDao.insertMember(uVo);
		
		HttpSession session = request.getSession();
		
		if(result == 1) {
			session.setAttribute("userid", uVo.getUserid());
			request.setAttribute("check", "success");
			request.setAttribute("message", "회원 가입에 성공했습니다.");
		} else {
			request.setAttribute("message", "회원 가입에 실패했습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");
		dispatcher.forward(request, response);
	}
}