package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionScheduleDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import com.boot.project_lupin.service.ManagerService;
import com.boot.project_lupin.service.QuestionService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
@Slf4j
public class ManagerController {

	@Autowired
	private ManagerService managerService;

	@RequestMapping("/managerAuction")
	public String managerAuction(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerAuction");

		ArrayList<AuctionScheduleDTO> scheduleList = managerService.scheduleList();
		model.addAttribute("scheduleList", scheduleList);

		return "managerAuction";
	}

//	@PostMapping("/insertSchedule")
//	public String insertSchedule(@RequestBody AuctionScheduleDTO auctionScheduleDTO) {
//		log.info("@# insertSchedule");
//		log.info("@# insertSchedule auctionScheduleDTO=>"+auctionScheduleDTO);
//
//		managerService.insertSchedule(auctionScheduleDTO);
//
//		return "redirect:managerAuction";
//	}
@PostMapping("/insertSchedule")
public String insertSchedule(AuctionScheduleDTO auctionScheduleDTO, Model model) {
	log.info("@# insertSchedule");
	log.info("@# insertSchedule auctionScheduleDTO => " + auctionScheduleDTO);

	try {
		managerService.insertSchedule(auctionScheduleDTO);
		model.addAttribute("result", "success");  // 성공 시
	} catch (Exception e) {
		model.addAttribute("result", "fail");  // 실패 시
		log.error("일정 등록 실패", e);
	}

	return "redirect:managerAuction";
}


}
















