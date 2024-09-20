package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionAttachDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.QuestionAttachDTO;
import com.boot.project_lupin.service.AuctionService;
import com.boot.project_lupin.service.ManagerService;
import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@Slf4j
public class AuctionController {

	@Autowired
	private AuctionService service;
	@Autowired
	private ManagerService managerService;

	@Autowired
	private ServletContext servletContext;  // 프로젝트 경로를 얻기 위한 ServletContext

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

	// 이미지 파일을 받아서 화면에 출력 (byte 배열 타입)
	@GetMapping("/auctionListDisplay")
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("@# display fileName => " + fileName);

		// 프로젝트 내부 경로로 파일을 찾기
		File file = new File(servletContext.getRealPath("/upload/") + fileName);  // 파일 경로 설정
		log.info("@# file => " + file);

		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();

		try {
			// 파일의 Content-Type을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			// 파일을 byte 배열로 복사하여 리턴
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}


	// 파일 목록을 JSON으로 가져오는 메서드
	@GetMapping(value = "/auctionListGetFileList1")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList1(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList1(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
	@GetMapping(value = "/auctionListGetFileList2")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList2(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList2(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
}
