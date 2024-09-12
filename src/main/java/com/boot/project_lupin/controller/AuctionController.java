package com.boot.project_lupin.controller;

import com.boot.project_lupin.service.AuctionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class AuctionController {

	@Autowired
	private AuctionService service;

	@RequestMapping("/auctionDetail")
	public String auctionDetail() {
		return "auctionDetail";
	}

	@RequestMapping("/auctionProgress")
	public String auctionProgress() {
		return "auctionProgress";
	}

	@RequestMapping("/auctionScheduled")
	public String auctionScheduled() {
		return "auctionScheduled";
	}

	@RequestMapping("/auctionResult")
	public String auctionResult() {
		return "auctionResult";
	}

}
