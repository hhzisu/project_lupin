package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.*;
import com.boot.project_lupin.service.PaymentService;
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
public class PaymentController {

	@Autowired
	private PaymentService service;

	@Autowired
	private UserInfoService userService;


	@RequestMapping("/userBuyList")
	public String userBuyList(HttpServletRequest httpServletRequest, Model model) {
		log.info("userBuyList");

		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = httpServletRequest.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");
		UserInfoDTO loginUser = userService.selectUserInfo(user.getUsername());

		model.addAttribute("loginUser", loginUser);

		ArrayList<PaymentDTO> buyList = service.payListbyId(Integer.parseInt(String.valueOf(loginUser.getId())));
		model.addAttribute("buyList", buyList);

		return "userBuyList";
	}

}
