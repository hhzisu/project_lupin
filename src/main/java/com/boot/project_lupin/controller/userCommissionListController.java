package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CommissionDTO;
import com.boot.project_lupin.service.CommissionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;

@Controller
@Slf4j
public class userCommissionListController {
	@Autowired
	private CommissionService service;
	
	@RequestMapping("/userCommissionList")  
	public String question(HttpServletRequest httpServletRequest, Model model) {
		log.info("userCommissionList");

		ArrayList<CommissionDTO> commissionList = service.commissionList();
		model.addAttribute("commissionList", commissionList);

		return "userCommissionList";
	}
	
}
















