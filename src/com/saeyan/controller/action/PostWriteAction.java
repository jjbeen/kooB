package com.saeyan.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.PostDAO;
import com.saeyan.dto.PostVO;

public class PostWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostVO pVo = new PostVO();
		
		pVo.setId(request.getParameter("id"));
		pVo.setTitle(request.getParameter("title"));
		pVo.setContent(request.getParameter("content"));
		
		PostDAO pDao = PostDAO.getInstance();
		pDao.insertPost(pVo);
		
		new PostListAction().execute(request, response);
	}
}
