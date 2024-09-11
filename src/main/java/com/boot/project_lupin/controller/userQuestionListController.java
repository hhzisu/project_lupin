package com.boot.project_lupin.controller;

import com.boot.project_lupin.service.QuestionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class userQuestionListController {
	@Autowired
	private QuestionService service;
	
	@RequestMapping("/userQuestionList")  
	public String question(HttpServletRequest httpServletRequest, Model model) {
		log.info("userQuestionList");
		return "userQuestionList";
	}
	
}
















