package com.saeyan.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.UseruserDAO;

@WebServlet("/resetPwd.do")
public class ResetPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
    	String userid = request.getParameter("userid");
    	String pwd = request.getParameter("pwd");
    	
		UseruserDAO uDao = UseruserDAO.getInstance();
		
		uDao.resetPwd(userid, pwd);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/resetPwdResult.jsp");
		dispatcher.forward(request, response);
	}
}