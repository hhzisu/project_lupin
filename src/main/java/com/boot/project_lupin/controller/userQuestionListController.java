package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.QuestionDTO;
import com.boot.project_lupin.service.QuestionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;

@Controller
@Slf4j
public class userQuestionListController {
	@Autowired
	private QuestionService service;
	
	@RequestMapping("/userQuestionList")  
	public String userQuestionList(HttpServletRequest httpServletRequest, Model model) {
		log.info("userQuestionList");

		ArrayList<QuestionDTO> questionList = service.questionList();
		model.addAttribute("questionList", questionList);

		return "userQuestionList";
	}

	@RequestMapping("/managerQuestion")
	public String managerQuestion(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerQuestion");

		ArrayList<QuestionDTO> questionList = service.questionList();
		model.addAttribute("questionList", questionList);

		return "managerQuestion";
	}

	@RequestMapping("/questionAnswer")
	public String questionAnswer(HttpServletRequest httpServletRequest, QuestionDTO questionDTO) {
		log.info("managerQuestion");

		service.questionAnswer(questionDTO);

		httpServletRequest.setAttribute("msg", "답변을 등록하였습니다.");
		httpServletRequest.setAttribute("url", "/managerQuestion");
		return "/alert";
	}

}
















