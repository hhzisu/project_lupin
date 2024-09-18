package com.boot.project_lupin.controller;

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

	@PostMapping("/insertAuction")
	public String insertAuction(AuctionDTO auctionDTO,
								MultipartFile[] uploadFile,
								Model model) {
		log.info("@# insertAuction");
		log.info("@# insertAuction auctionDTO => {}", auctionDTO);

		// 파일 업로드 후 DTO에 파일 정보 설정
		List<AuctionAttachDTO> attachList = new ArrayList<>();

		// 프로젝트 내부에 upload 폴더 경로를 설정
		String uploadFolder = servletContext.getRealPath("/upload");
		String uploadFolderPath = getFolder();  // 날짜별 폴더 생성
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();  // 폴더가 존재하지 않으면 생성
		}

		for (MultipartFile multipartFile : uploadFile) {
			if (!multipartFile.isEmpty()) {
				AuctionAttachDTO attachDTO = new AuctionAttachDTO();

				// 업로드된 파일 정보 설정
				String originalFileName = multipartFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();  // UUID 생성
				String uploadFileName = uuid.toString() + "_" + originalFileName;  // 파일 이름에 UUID 추가

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(uploadFolderPath);
				attachDTO.setFileName(uploadFileName);  // 변경된 파일 이름 설정

				File saveFile = new File(uploadPath, uploadFileName);
				try {
					multipartFile.transferTo(saveFile);  // 파일 저장

					// 이미지 파일일 경우 썸네일 생성
					if (checkImageType(saveFile)) {
						attachDTO.setImage(true);  // 이미지 여부 저장
						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
						Thumbnailator.createThumbnail(new FileInputStream(saveFile), thumbnail, 1200, 1200);
						thumbnail.close();
					} else {
						attachDTO.setImage(false);  // 이미지가 아니면 0으로 설정
					}

					attachList.add(attachDTO);
				} catch (Exception e) {
					log.error("파일 업로드 중 에러 발생: {}", e.getMessage());
				}
			}
		}

		// 파일 리스트를 auctionDTO에 설정
		auctionDTO.setAuctionAttachList(attachList);

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


	// 파일 업로드를 처리하는 메서드
	@PostMapping("/auctionUploadAjaxAction")
	public ResponseEntity<List<AuctionAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post...");

		List<AuctionAttachDTO> list = new ArrayList<>();

		// 프로젝트 내부에 upload 폴더 경로를 설정
		String uploadFolder = servletContext.getRealPath("/upload"); // 실제 경로로 변환
		String uploadFolderPath = getFolder().replace("\\", "/");  // 슬래시 문제 해결
		File uploadPath = new File(uploadFolder, uploadFolderPath); // 날짜별 폴더 포함한 전체 경로
		log.info("@# uploadPath => " + uploadPath);

		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // 폴더가 존재하지 않으면 생성
		}

		for (MultipartFile multipartFile : uploadFile) {
			log.info("==============================");
			// getOriginalFilename : 업로드 되는 파일 이름
			log.info("@# 업로드 되는 파일 이름 => " + multipartFile.getOriginalFilename());
			// getSize : 업로드 되는 파일 크기
			log.info("@# 업로드 되는 파일 크기 => " + multipartFile.getSize());

			String originalFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  // UUID 생성
			String uploadFileName = uuid.toString() + "_" + originalFileName;  // 파일 이름에 UUID 추가
			log.info("@# uuid => " + uuid);

			// DTO에 파일 정보 저장
			AuctionAttachDTO auctionAttachDTO = new AuctionAttachDTO();
			auctionAttachDTO.setFileName(uploadFileName);  // 변경된 파일 이름 설정
			auctionAttachDTO.setUuid(uuid.toString());
			auctionAttachDTO.setUploadPath(uploadFolderPath);
			log.info("@# auctionAttachDTO 01 => " + auctionAttachDTO);

			// 저장할 파일 객체 생성 (경로 + 파일명)
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;

			try {
				// transferTo : 파일 저장
				multipartFile.transferTo(saveFile);

				// 이미지 파일일 경우 썸네일 생성
				if (checkImageType(saveFile)) {
					auctionAttachDTO.setImage(true);  // 이미지 여부 저장

					try (FileInputStream thumbFis = new FileInputStream(saveFile);
						 FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName))) {

						// 썸네일 크기 설정 (1200x1200)
						Thumbnailator.createThumbnail(thumbFis, thumbnail, 1200, 1200);
						log.info("썸네일 생성 완료: s_" + uploadFileName);
					} catch (Exception e) {
						log.error("썸네일 생성 중 오류 발생: " + e.getMessage(), e);
					}
				} else {
					auctionAttachDTO.setImage(false);  // 이미지가 아니면 0으로 설정
				}

				list.add(auctionAttachDTO);
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

		// 파일 정보 리스트와 상태값 200 OK 리턴
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

		if (!file.exists()) {
			log.error("@# file does not exist: " + file.getAbsolutePath());
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();

		try {
			// 파일의 Content-Type을 헤더에 추가
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			// 파일을 byte 배열로 복사하여 리턴
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			log.error("파일을 불러오는 중 오류 발생: " + e.getMessage());
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
	@GetMapping(value = "/auctionGetFileList")
	public ResponseEntity<List<AuctionAttachDTO>> auctionGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# auctionGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('auction_id') => " + param.get("auction_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(managerService.auctionGetFileList(Integer.parseInt(param.get("auction_id"))), HttpStatus.OK);
	}
}



















