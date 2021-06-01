package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.PostDAO;
import com.saeyan.dto.PostVO;


public class PostUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/post/postUpdate.jsp";
		
		String num = request.getParameter("num");
		
		PostDAO pDao = PostDAO.getInstance();
		
		pDao.updateReadCount(num);
		
		PostVO pVo = pDao.selectOnePostByNum(num);
		
		request.setAttribute("post", pVo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
