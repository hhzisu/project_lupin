package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.service.AuctionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
@Slf4j
public class PageController {

	@Autowired
	private AuctionService auctionService;

	@RequestMapping("/main")
	public String main(Model model) {
//		ArrayList<AuctionDTO> list = auctionService.auctionProgressList();
		ArrayList<AuctionDTO> list = auctionService.auctionScheduledList();
		model.addAttribute("list", list);
		return "main";
	}

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/faq")
	public String faq() {
		return "faq";
	}
	@RequestMapping("/guideCommission")
	public String guideCommission() {
		return "guideCommission";
	}

	@RequestMapping("/guideStorage")
	public String guideStorage() {
		return "guideStorage";
	}

}
