package com.boot.project_lupin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class PageController {


	@RequestMapping("/main")
	public String main() {
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
