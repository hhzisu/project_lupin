package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.QuestionAttachDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.QuestionService;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
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
public class QuestionController {

	@Autowired
	private QuestionService service;
	@Autowired
	private UserInfoService userService;

	@Autowired
	private ServletContext servletContext;  // 프로젝트 경로를 얻기 위한 ServletContext

	// 문의 화면으로 이동하는 메서드
	@RequestMapping("/question")
	public String question(HttpServletRequest httpServletRequest, Model model) {
		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = httpServletRequest.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");
		UserInfoDTO loginUser = userService.selectUserInfo(user.getUsername());

		model.addAttribute("loginUser", loginUser);

		log.info("@@@@loginUser=>"+loginUser);
		return "question";
	}

	// 문의 내용을 등록하는 메서드
	@RequestMapping("/questionPost")
	public String questionPost(HttpServletRequest httpServletRequest, QuestionDTO questionDTO) {
		log.info("questionPost");

		// 문의 사항 저장
		service.insertQuestion(questionDTO);

		httpServletRequest.setAttribute("msg", "문의를 등록하였습니다.");
		httpServletRequest.setAttribute("url", "/userQuestionList");
		return "/alert";
	}

	//문의 목록
	@RequestMapping("/userQuestionList")
	public String userQuestionList(HttpServletRequest httpServletRequest, Model model) {
		log.info("userQuestionList");
		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = httpServletRequest.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");
		UserInfoDTO loginUser = userService.selectUserInfo(user.getUsername());

		model.addAttribute("loginUser", loginUser);

		ArrayList<QuestionDTO> questionList = service.questionListbyId(loginUser.getId());
		model.addAttribute("questionList", questionList);

		return "userQuestionList";
	}

	//관리자 1:1문의
	@RequestMapping("/managerQuestion")
	public String managerQuestion(HttpServletRequest httpServletRequest, Model model) {
		log.info("managerQuestion");

		ArrayList<QuestionDTO> questionList = service.questionList();
		model.addAttribute("questionList", questionList);

		return "managerQuestion";
	}

	//관리자 1:1문의 답변 등록
	@RequestMapping("/questionAnswer")
	public String questionAnswer(HttpServletRequest httpServletRequest, QuestionDTO questionDTO) {
		log.info("managerQuestion");

		service.questionAnswer(questionDTO);

		httpServletRequest.setAttribute("msg", "답변을 등록하였습니다.");
		httpServletRequest.setAttribute("url", "/managerQuestion");
		return "/alert";
	}





	// 파일 업로드를 처리하는 메서드
	@PostMapping("/questionUploadAjaxAction")
	public ResponseEntity<List<QuestionAttachDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		log.info("upload ajax post...");

		List<QuestionAttachDTO> list = new ArrayList<>();

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
			QuestionAttachDTO questionAttachDTO = new QuestionAttachDTO();
			questionAttachDTO.setFileName(uploadFileName);
			questionAttachDTO.setUuid(uuid.toString());
			questionAttachDTO.setUploadPath(uploadFolderPath);
			log.info("@# questionAttachDTO 01 => " + questionAttachDTO);

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
					questionAttachDTO.setImage(true);  // 이미지 여부 저장

					fis = new FileInputStream(saveFile);

					// 썸네일 파일은 s_ 를 앞에 추가
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

					// 썸네일 크기 설정 (1200x1200)
					Thumbnailator.createThumbnail(fis, thumbnail, 1200, 1200);

					thumbnail.close();
				}

				list.add(questionAttachDTO);
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
	@GetMapping("/questionDisplay")
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
	@PostMapping("/questionDeleteFile")
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
	@GetMapping(value = "/questionGetFileList")
	public ResponseEntity<List<QuestionAttachDTO>> questionGetFileList(@RequestParam HashMap<String, String> param) {
		log.info("@# questionGetFileList()");
		log.info("@# param => " + param);
		log.info("@# param.get('question_id') => " + param.get("question_id"));

		// 질문 ID로 파일 목록을 조회하여 리턴
		return new ResponseEntity<>(service.questionGetFileList(Integer.parseInt(param.get("question_id"))), HttpStatus.OK);
	}
}
