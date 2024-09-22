package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionAttachDTO;
import com.boot.project_lupin.dto.AuctionDTO;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@Slf4j
public class PageController {

	@Autowired
	private AuctionService auctionService;

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ManagerService managerService;

	@RequestMapping("/main")
	public String main(Model model) {
		// 진행 중인 경매 리스트를 가져옴
		ArrayList<AuctionDTO> list = auctionService.auctionProgressList();
		// 예정 경매 목록
		ArrayList<AuctionDTO> list2 = auctionService.auctionScheduledList();

		// 각 경매 항목에 대한 이미지 파일 리스트 추가
		for (AuctionDTO auction : list) {
			// auction_id에 해당하는 첨부파일 리스트를 가져와서 설정
			List<AuctionAttachDTO> attachList = managerService.auctionGetFileList1(auction.getAuction_id());
			auction.setAuctionAttachList1(attachList);
		}

		for (AuctionDTO auction : list2) {
			// auction_id에 해당하는 첨부파일 리스트를 가져와서 설정
			List<AuctionAttachDTO> attachList = managerService.auctionGetFileList1(auction.getAuction_id());
			auction.setAuctionAttachList1(attachList);
		}


		// 모델에 경매 리스트와 이미지 파일 리스트를 추가
		model.addAttribute("list", list);

		// 모델에 예정 경매 리스트와 이미지 파일 리스트를 추가
		model.addAttribute("list2", list2);

		return "main";  // main.jsp 또는 main.html 페이지로 이동
	}



	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
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

	@RequestMapping("/guideAuction")
	public String guideAuction() {
		return "guideAuction";
	}

	// 이미지 파일을 받아서 화면에 출력 (byte 배열 타입)
	@GetMapping("/auctionListMainDisplay")
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
	@GetMapping(value = "/auctionListMainGetFileList1")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList1(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList1(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
	@GetMapping(value = "/auctionListMainGetFileList2")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList2(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList2(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}

}
