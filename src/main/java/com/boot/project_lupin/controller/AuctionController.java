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
public class AuctionController {

	@Autowired
	private AuctionService service;

	@RequestMapping("/auctionDetail")
	public String auctionDetail(int auction_lot, int auctionSchedule_id , Model model) {

		AuctionDTO dto = service.selectAuction(auction_lot, auctionSchedule_id);
		model.addAttribute("auction", dto);

		int totalLots = service.auctionCount(auctionSchedule_id);
		model.addAttribute("totalLots", totalLots);

		return "auctionDetail";
	}

	@RequestMapping("/auctionProgress")
	public String auctionProgress(Model model) {

		ArrayList<AuctionDTO> list = service.auctionProgressList();
		model.addAttribute("list", list);

		return "auctionProgress";
	}

	@RequestMapping("/auctionScheduled")
	public String auctionScheduled(Model model) {

		ArrayList<AuctionDTO> list = service.auctionScheduledList();
		model.addAttribute("list", list);

		return "auctionScheduled";
	}

	@RequestMapping("/auctionResult")
	public String auctionResult(Model model) {

		ArrayList<AuctionDTO> list = service.auctionResultList();
		model.addAttribute("list", list);

		return "auctionResult";
	}

}
