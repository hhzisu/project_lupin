package com.boot.project_lupin.controller;


import com.boot.project_lupin.dto.QuestionDTO;
import com.boot.project_lupin.service.QuestionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class QuestionController {
	@Autowired
	private QuestionService service;
	
	
	@RequestMapping("/question")  
	public String question() {
		return "question";
	}
	
	@RequestMapping("/questionPost")  
	public String questionPost(HttpServletRequest httpServletRequest, QuestionDTO questionDTO) {
		log.info("questionPost");
		
		service.insertQuestion(questionDTO);
		
		httpServletRequest.setAttribute("msg", "문의를 등록하였습니다.");
		httpServletRequest.setAttribute("url", "/question");
		return "/alert";
	}
	
	
}
















