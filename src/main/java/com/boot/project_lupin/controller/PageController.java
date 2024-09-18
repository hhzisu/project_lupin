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

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
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
		ArrayList<AuctionDTO> list = auctionService.auctionProgressList();

		// 각 경매 항목에 대한 이미지 파일 리스트도 추가
		for (AuctionDTO auction : list) {
			List<AuctionAttachDTO> attachList = managerService.auctionGetFileList(auction.getAuction_id());
			auction.setAuctionAttachList(attachList);
		}

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

	// 이미지 파일을 받아서 화면에 출력 (byte 배열 타입)
	@GetMapping("/auctionMainDisplay")
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

}
