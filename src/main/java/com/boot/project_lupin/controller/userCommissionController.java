package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CommissionDTO;
import com.boot.project_lupin.service.CommissionService;
import com.boot.project_lupin.service.QuestionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class userCommissionController {
	@Autowired
	private CommissionService service;
	
	@RequestMapping("/userCommission")  
	public String question(HttpServletRequest httpServletRequest, Model model) {
		log.info("@# userCommission");
		return "userCommission";
	}

	@PostMapping("/insertCommission")
	public String insertCommission(CommissionDTO commissionDTO) {
		log.info("@# insertCommission");
		log.info("@# insertCommission commissionDTO=>"+commissionDTO);

		service.insertCommission(commissionDTO);

		return "redirect:userCommissionList";
	}
}
















