package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.*;
import com.boot.project_lupin.service.ManagerService;
import com.boot.project_lupin.service.QuestionService;
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

	// insertAuction 메서드
	@PostMapping("/insertAuction")
	public String insertAuction(AuctionDTO auctionDTO,
								@RequestParam("uploadFile1") MultipartFile[] uploadFile1,
								@RequestParam("uploadFile2") MultipartFile[] uploadFile2,
								Model model) {
		log.info("@# insertAuction");
		log.info("@# insertAuction auctionDTO => {}", auctionDTO);

		// 파일 리스트 1을 처리하고 auctionDTO에 설정
		List<AuctionAttach1DTO> attachList1 = new ArrayList<>();
		for (MultipartFile file : uploadFile1) {
			if (!file.isEmpty()) {
				AuctionAttach1DTO attachDTO = new AuctionAttach1DTO();
				attachDTO.setFileName(file.getOriginalFilename());
				attachDTO.setUuid(UUID.randomUUID().toString());
				attachDTO.setUploadPath("your-upload-path-here");  // 업로드 경로 설정
				attachDTO.setImage(file.getContentType().startsWith("image"));  // 이미지 여부 체크
				attachList1.add(attachDTO);
			}
		}
		auctionDTO.setAuctionAttachList1(attachList1);

		// 파일 리스트 2를 처리하고 auctionDTO에 설정
		List<AuctionAttach2DTO> attachList2 = new ArrayList<>();
		for (MultipartFile file : uploadFile2) {
			if (!file.isEmpty()) {
				AuctionAttach2DTO attachDTO = new AuctionAttach2DTO();
				attachDTO.setFileName(file.getOriginalFilename());
				attachDTO.setUuid(UUID.randomUUID().toString());
				attachDTO.setUploadPath("your-upload-path-here");  // 업로드 경로 설정
				attachDTO.setImage(file.getContentType().startsWith("image"));  // 이미지 여부 체크
				attachList2.add(attachDTO);
			}
		}
		auctionDTO.setAuctionAttachList2(attachList2);

		try {
			// 경매 항목을 삽입합니다.
			managerService.insertAuction(auctionDTO);
			model.addAttribute("result", "success");  // 성공 시
		} catch (Exception e) {
			model.addAttribute("result", "fail");  // 실패 시
			log.error("경매 항목 등록 실패", e);
		}

		// 성공 후 경매 관리 페이지로 리다이렉트
		return "redirect:managerAuction";
	}




	// 파일 업로드를 처리하는 메서드_1
	@PostMapping("/auctionUploadAjaxAction1")
	public ResponseEntity<List<AuctionAttach1DTO>> uploadAjaxPost1(@RequestParam("uploadFile1") MultipartFile[] uploadFile1) {
		log.info("upload ajax post... for uploadFile1");

		List<AuctionAttach1DTO> list = new ArrayList<>();

		// 프로젝트 내부에 upload 폴더 경로를 설정
		String uploadFolder = servletContext.getRealPath("/upload"); // 실제 경로로 변환
		String uploadFolderPath = getFolder();  // 날짜별 폴더 생성
		File uploadPath = new File(uploadFolder, uploadFolderPath); // 날짜별 폴더 포함한 전체 경로
		log.info("@# uploadPath => " + uploadPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 폴더가 존재하지 않으면 생성
		}

		for (MultipartFile multipartFile : uploadFile1) {  // 변경된 부분: uploadFile1 배열로 파일 처리
			log.info("==============================");
			log.info("@# 업로드 되는 파일 이름 => " + multipartFile.getOriginalFilename());
			log.info("@# 업로드 되는 파일 크기 => " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  // UUID 생성
			log.info("@# uuid => " + uuid);

			AuctionAttach1DTO auctionAttach1DTO = new AuctionAttach1DTO();
			auctionAttach1DTO.setFileName(uploadFileName);
			auctionAttach1DTO.setUuid(uuid.toString());
			auctionAttach1DTO.setUploadPath(uploadFolderPath);

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info("@# uuid uploadFileName => " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;

			try {
				multipartFile.transferTo(saveFile);

				if (checkImageType(saveFile)) {
					auctionAttach1DTO.setImage(true);

					fis = new FileInputStream(saveFile);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(fis, thumbnail, 1200, 1200);
					thumbnail.close();
				}

				list.add(auctionAttach1DTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			} finally {
				try {
					if (fis != null) fis.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 파일 업로드를 처리하는 메서드_2
	@PostMapping("/auctionUploadAjaxAction2")
	public ResponseEntity<List<AuctionAttach2DTO>> uploadAjaxPost2(@RequestParam("uploadFile2") MultipartFile[] uploadFile2) {
		log.info("upload ajax post... for uploadFile2");

		List<AuctionAttach2DTO> list = new ArrayList<>();

		// 동일한 로직을 uploadFile2에 대해 적용
		String uploadFolder = servletContext.getRealPath("/upload");
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("@# uploadPath => " + uploadPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile2) {  // 변경된 부분: uploadFile2 배열로 파일 처리
			log.info("==============================");
			log.info("@# 업로드 되는 파일 이름 => " + multipartFile.getOriginalFilename());
			log.info("@# 업로드 되는 파일 크기 => " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			log.info("@# uuid => " + uuid);

			AuctionAttach2DTO auctionAttach2DTO = new AuctionAttach2DTO();
			auctionAttach2DTO.setFileName(uploadFileName);
			auctionAttach2DTO.setUuid(uuid.toString());
			auctionAttach2DTO.setUploadPath(uploadFolderPath);

			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info("@# uuid uploadFileName => " + uploadFileName);

			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;

			try {
				multipartFile.transferTo(saveFile);

				if (checkImageType(saveFile)) {
					auctionAttach2DTO.setImage(true);

					fis = new FileInputStream(saveFile);

					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(fis, thumbnail, 1200, 1200);
					thumbnail.close();
				}

				list.add(auctionAttach2DTO);
			} catch (Exception e) {
				log.error(e.getMessage());
			} finally {
				try {
					if (fis != null) fis.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}


	// 날짜별 폴더 생성 메서드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();  // 현재 날짜를 기준으로 폴더 생성
		String str = sdf.format(date);
		return str.replace("-", File.separator);  // 날짜 형식의 폴더 경로 리턴
	}

	// 이미지 여부를 체크하는 메서드
	public boolean checkImageType(File file) {
		try {
			// probeContentType : 파일의 MIME 타입 확인
			String contentType = Files.probeContentType(file.toPath());
			if (contentType == null) {
				return false;
			}
			// 이미지 파일 여부 확인
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;  // 이미지 파일이 아니면 false 리턴
	}

	// 이미지 파일을 받아서 화면에 출력 (byte 배열 타입)
	@GetMapping("/auctionDisplay")
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

	// 파일 삭제 처리 메서드
	@PostMapping("/auctionDeleteFile")
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("@# deleteFile fileName => " + fileName);

		File file;

		try {
			// URLDecoder.decode : 서버에 올라간 파일을 삭제하기 위해 디코딩
			file = new File(servletContext.getRealPath("/upload/") + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();  // 파일 삭제

			// 이미지 파일이면 썸네일도 삭제
			if (type.equals("image")) {
				// getAbsolutePath : 절대경로 (full path)
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("@# largeFileName => " + largeFileName);

				file = new File(largeFileName);
				file.delete();  // 원본 파일 삭제
			}
		} catch (Exception e) {
			e.printStackTrace();
			// 예외 발생 시 404 Not Found 처리
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		// 삭제 성공 시 "deleted" 메시지와 상태값 200 OK 리턴
		return new ResponseEntity<>("deleted", HttpStatus.OK);
	}

	// 파일 목록을 JSON으로 가져오는 메서드
	@GetMapping(value = "/auctionGetFileList1")
	public ResponseEntity<List<AuctionAttach1DTO>> auctionGetFileList1(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionGetFileList1()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList1(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}

	// 파일 목록을 JSON으로 가져오는 메서드
	@GetMapping(value = "/auctionGetFileList2")
	public ResponseEntity<List<AuctionAttach2DTO>> auctionGetFileList2(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionGetFileList2()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList2(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
}



















