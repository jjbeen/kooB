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

@WebServlet("/bookList.do")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("value"); //소설, 시/에세이 등
		
		BookDAO bDao = BookDAO.getInstance();
		List<BookVO> bookList = bDao.selectBooks(category);
		
		request.setAttribute("bookList", bookList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("book/bookList.jsp");
		dispatcher.forward(request, response);
	}
}