package com.saeyan.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.PostDAO;
import com.saeyan.dto.PostVO;


public class PostListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/post/postList.jsp";
		
		PostDAO pDao = PostDAO.getInstance();
		
		List<PostVO> postList = pDao.selectAllPosts();
		
		request.setAttribute("postList", postList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
