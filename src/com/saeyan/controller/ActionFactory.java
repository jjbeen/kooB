package com.saeyan.controller;

import com.saeyan.controller.action.Action;
import com.saeyan.controller.action.PostDeleteAction;
import com.saeyan.controller.action.PostListAction;
import com.saeyan.controller.action.PostUpdateAction;
import com.saeyan.controller.action.PostUpdateFormAction;
import com.saeyan.controller.action.PostViewAction;
import com.saeyan.controller.action.PostWriteAction;
import com.saeyan.controller.action.PostWriteFormAction;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	
	private ActionFactory() {
		super();
	}
	
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory : " + command);
		if(command.equals("post_list")) {
			action = new PostListAction();
		} else if(command.equals("post_write_form")) {
			action = new PostWriteFormAction();
		} else if(command.equals("post_write")) {
			action = new PostWriteAction();
		} else if(command.equals("post_view")) {
			action = new PostViewAction();
		} else if(command.equals("post_update_form")) {
			action = new PostUpdateFormAction();
		} else if(command.equals("post_update")) {
			action = new PostUpdateAction();
		} else if(command.equals("post_delete")) {
			action = new PostDeleteAction();
		}
		return action;
	}
}
