package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class userInfoController {

	@Autowired
	private UserInfoService service;

	@RequestMapping("/userInfo")
	public String userInfo(HttpServletRequest httpServletRequest, Model model) {
		log.info("@# userInfo");

		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = httpServletRequest.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");
		log.info("@# loginUserName=>"+user.getUsername());

		if (user != null) {
			UserInfoDTO loginUser = service.selectUserInfo(user.getUsername());
			log.info("@# loginUser=>"+loginUser);

			model.addAttribute("loginUser", loginUser);
//			model.addAttribute("loginUserName", user.getUsername());
		} else {
			log.info("사용자 정보가 없습니다.");
		}

		return "userInfo";
	}


	@PostMapping("/updateInfo")
	public String updateInfo(UserInfoDTO userInfoDTO, HttpServletRequest httpServletRequest) {
		log.info("@# updateInfo");

		// 주소 업데이트 서비스 호출
		service.updateAddress(userInfoDTO);

		// 알림 메시지 설정
		httpServletRequest.setAttribute("msg", "주소를 변경하였습니다.");
		httpServletRequest.setAttribute("url", "/userInfo");
		return "/alert";
	}

}