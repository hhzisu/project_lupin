package com.boot.project_lupin.controller;

import com.boot.project_lupin.dao.ManagerDAO;
import com.boot.project_lupin.dto.*;
import com.boot.project_lupin.service.ManagerService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.*;

@Controller
@Slf4j
public class ManagerController {

	@Autowired
	private ManagerService managerService;
	@Autowired
	private ServletContext servletContext;

	@RequestMapping("/managerAuction")
	public String managerAuction(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerAuction");

		// 현재 시간 추가
		LocalDateTime now = LocalDateTime.now();
		model.addAttribute("currentDateTime", now);

		ArrayList<AuctionScheduleDTO> scheduleList = managerService.scheduleList();
		model.addAttribute("scheduleList", scheduleList);

		return "managerAuction";
	}

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

	@RequestMapping("/managerAuctionModify")
	public String managerAuctionModify(@RequestParam("auctionSchedule_id") String auctionSchedule_id, Model model) {
		log.info("@# managerAuctionModify auctionSchedule_id => {}", auctionSchedule_id);

		AuctionScheduleDTO auctionScheduleDTO = managerService.getScheduleById(auctionSchedule_id);
		model.addAttribute("auctionScheduleDTO", auctionScheduleDTO);

		int currentYear = Year.now().getValue();
		model.addAttribute("currentYear", currentYear);

		return "managerAuctionModify";
	}

	@PostMapping("/scheduleModify")
	public String modifyAuctionSchedule(AuctionScheduleDTO auctionScheduleDTO, Model model) {
		log.info("@# modifyAuctionSchedule auctionScheduleDTO => {}", auctionScheduleDTO);

		try {
			managerService.scheduleModify(auctionScheduleDTO);
			model.addAttribute("result", "success");
		} catch (Exception e) {
			model.addAttribute("result", "fail");
			log.error("경매 일정 수정 실패", e);
		}

		return "redirect:/managerAuction";
	}

	@RequestMapping("/deleteSchedule")
	public String deleteSchedule(String auctionSchedule_id) {
		log.info("@# deleteSchedule auctionSchedule_id => {}", auctionSchedule_id);

		try {
			managerService.scheduleDelete(auctionSchedule_id);
		} catch (Exception e) {
			log.error("일정 삭제 실패", e);
		}

		return "redirect:/managerAuction";
	}

	@RequestMapping("/managerAuctionRegist")
	public String managerAuctionRegist(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerAuctionRegist");

		// 현재 시간을 구하여 model에 추가
		LocalDateTime now = LocalDateTime.now();
		model.addAttribute("now", now);

		ArrayList<AuctionScheduleDTO> scheduleList = managerService.scheduleList();
		model.addAttribute("scheduleList", scheduleList);

		return "managerAuctionRegist";
	}

	@RequestMapping("/managerCommission")
	public String managerCommission(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerCommission");
		ArrayList<CommissionDTO> commissionList = managerService.commissionList();
		model.addAttribute("commissionList", commissionList);

		return "managerCommission";
	}

	@PostMapping("/insertAuction")
	public String insertAuction(AuctionDTO auctionDTO,
								@RequestParam("uploadFile1") MultipartFile uploadFile1,
								@RequestParam("uploadFile2") MultipartFile uploadFile2,
								Model model) {
		log.info("@# insertAuction");
		log.info("@# insertAuction auctionDTO => {}", auctionDTO);

		// 파일 업로드 후 DTO에 파일 정보 설정
		List<AuctionAttachDTO> attachList1 = new ArrayList<>();
		List<AuctionAttachDTO> attachList2 = new ArrayList<>();

		String uploadFolder = servletContext.getRealPath("/upload");
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		if (!uploadFile1.isEmpty()) {
			AuctionAttachDTO attachDTO1 = processUploadFile(uploadFile1, uploadPath, uploadFolderPath);
			attachList1.add(attachDTO1);
		}

		if (!uploadFile2.isEmpty()) {
			AuctionAttachDTO attachDTO2 = processUploadFile(uploadFile2, uploadPath, uploadFolderPath);
			attachList2.add(attachDTO2);
		}

		auctionDTO.setAuctionAttachList1(attachList1);
		auctionDTO.setAuctionAttachList2(attachList2);

		try {
			managerService.insertAuction(auctionDTO);
			model.addAttribute("result", "success");
		} catch (Exception e) {
			model.addAttribute("result", "fail");
			log.error("경매 항목 등록 실패", e);
		}

		return "redirect:/managerAuction";
	}

	private AuctionAttachDTO processUploadFile(MultipartFile multipartFile, File uploadPath, String uploadFolderPath) {
		AuctionAttachDTO attachDTO = new AuctionAttachDTO();

		String originalFileName = multipartFile.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString() + "_" + originalFileName;

		attachDTO.setUuid(uuid.toString());
		attachDTO.setUploadPath(uploadFolderPath);
		attachDTO.setFileName(uploadFileName);

		File saveFile = new File(uploadPath, uploadFileName);
		try {
			multipartFile.transferTo(saveFile);

			if (checkImageType(saveFile)) {
				attachDTO.setImage(true);
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
				Thumbnailator.createThumbnail(new FileInputStream(saveFile), thumbnail, 1200, 1200);
				thumbnail.close();
			} else {
				attachDTO.setImage(false);
			}

		} catch (Exception e) {
			log.error("파일 업로드 중 에러 발생: {}", e.getMessage());
		}

		return attachDTO;
	}

	@PostMapping("/auctionUploadAjaxAction1")
	public ResponseEntity<List<AuctionAttachDTO>> uploadAjaxPost1(MultipartFile[] uploadFile1) {
		return uploadFiles(uploadFile1);
	}

	@PostMapping("/auctionUploadAjaxAction2")
	public ResponseEntity<List<AuctionAttachDTO>> uploadAjaxPost2(MultipartFile[] uploadFile2) {
		return uploadFiles(uploadFile2);
	}

	private ResponseEntity<List<AuctionAttachDTO>> uploadFiles(MultipartFile[] uploadFiles) {
		List<AuctionAttachDTO> list = new ArrayList<>();

		String uploadFolder = servletContext.getRealPath("/upload");
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFiles) {
			if (!multipartFile.isEmpty()) {
				AuctionAttachDTO attachDTO = processUploadFile(multipartFile, uploadPath, uploadFolderPath);
				list.add(attachDTO);
			}
		}

		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	public boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			if (contentType == null) {
				return false;
			}
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@PostMapping("/auctionDeleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("@# deleteFile fileName => " + fileName);

		File file;

		try {
			file = new File(servletContext.getRealPath("/upload/") + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();

			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName => " + largeFileName);

				file = new File(largeFileName);
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>("deleted", HttpStatus.OK);
	}

	// 이미지 파일을 받아서 화면에 출력 (byte 배열 타입)
	@GetMapping("/auctionListAdminDisplay")
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
	@GetMapping(value = "/auctionListAdminGetFileList1")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList1(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList1(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
	@GetMapping(value = "/auctionListAdminGetFileList2")
	public ResponseEntity<List<AuctionAttachDTO>> auctionListGetFileList2(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionListGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList2(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}

	@GetMapping(value = "/managerCommissionGetFileList")
	public ResponseEntity<List<CommissionAttachDTO>> commissionGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# commissionGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('question_id') => " + param.get("commission_id"));

		return new ResponseEntity<>(managerService.commissionGetFileList(Integer.parseInt(param.get("commission_id"))), HttpStatus.OK);
	}
}
