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

@WebServlet("/search.do")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("condition");
		String query = request.getParameter("query");
		
		BookDAO bDao = BookDAO.getInstance();
		List<BookVO> bookResult = bDao.searchBooks(condition, query);
		
		request.setAttribute("condition", condition);
		request.setAttribute("query", query);
		request.setAttribute("bookResult", bookResult);
		RequestDispatcher dispatcher=request.getRequestDispatcher("book/searchResult.jsp");
		dispatcher.forward(request, response);
	}
}