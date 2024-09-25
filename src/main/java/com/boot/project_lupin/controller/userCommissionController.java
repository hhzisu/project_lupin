package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.*;
import com.boot.project_lupin.service.CommissionService;
import com.boot.project_lupin.service.QuestionService;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import net.coobird.thumbnailator.Thumbnailator;
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
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Slf4j
public class userCommissionController {
	@Autowired
	private CommissionService service;

    @Autowired
    private ServletContext servletContext;

	@RequestMapping("/userCommission")
	public String question(HttpServletRequest httpServletRequest, Model model) {
		log.info("@# userCommission");

		return "userCommission";
	}

	@PostMapping("/insertCommission")
	public String insertCommission(CommissionDTO commissionDTO, HttpServletRequest httpServletRequest) {
		log.info("@# insertCommission");
		log.info("@# insertCommission commissionDTO=>"+commissionDTO);

		service.insertCommission(commissionDTO);

		httpServletRequest.setAttribute("msg", "문의를 등록하였습니다.");
		httpServletRequest.setAttribute("url", "/userCommission");
		return "/alert";
	}

	// 파일 업로드를 처리하는 메서드
	@PostMapping("/commissionUploadAjaxAction")
	public ResponseEntity<List<CommissionAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post...");

		List<CommissionAttachDTO> list = new ArrayList<>();

		// 프로젝트 내부에 upload 폴더 경로를 설정
		String uploadFolder = servletContext.getRealPath("/upload"); // 실제 경로로 변환
		String uploadFolderPath = getFolder();  // 날짜별 폴더 생성
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

			String uploadFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  // UUID 생성
			log.info("@# uuid => " + uuid);

			// DTO에 파일 정보 저장
			CommissionAttachDTO commissionAttachDTO = new CommissionAttachDTO();
			commissionAttachDTO.setFileName(uploadFileName);
			commissionAttachDTO.setUuid(uuid.toString());
			commissionAttachDTO.setUploadPath(uploadFolderPath);
			log.info("@# commissionAttachDTO => " + commissionAttachDTO);

			// 업로드 파일 이름에 UUID 추가
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			log.info("@# uuid uploadFileName => " + uploadFileName);

			// 저장할 파일 객체 생성 (경로 + 파일명)
			File saveFile = new File(uploadPath, uploadFileName);
			FileInputStream fis = null;

			try {
				// transferTo : 파일 저장
				multipartFile.transferTo(saveFile);

				// 이미지 파일일 경우 썸네일 생성
				if (checkImageType(saveFile)) {
					commissionAttachDTO.setImage(true);  // 이미지 여부 저장

					fis = new FileInputStream(saveFile);

					// 썸네일 파일은 s_ 를 앞에 추가
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					// 썸네일 크기 설정 (1200x1200)
					Thumbnailator.createThumbnail(fis, thumbnail, 1200, 1200);

					thumbnail.close();
				}

				list.add(commissionAttachDTO);
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


	// 파일 목록을 JSON으로 가져오는 메서드
	@GetMapping(value = "/commissionGetFileList")
	public ResponseEntity<List<CommissionAttachDTO>> commissionGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# commissionGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('question_id') => " + param.get("commission_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(service.commissionGetFileList(Integer.parseInt(param.get("commission_id"))), HttpStatus.OK);
	}
}
















