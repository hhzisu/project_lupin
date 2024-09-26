package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CommissionDTO;
import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.CommissionService;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;

@Controller
@Slf4j
public class userCommissionListController {

	@Autowired
	private UserInfoService infoService;

	@Autowired
	private CommissionService service;
	
	@RequestMapping("/userCommissionList")  
	public String question(HttpServletRequest httpServletRequest, Model model) {
		log.info("userCommissionList");

		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = httpServletRequest.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");
		log.info("@# loginUserName=>"+user.getUsername());

		if (user != null) {
			UserInfoDTO loginUser = infoService.selectUserInfo(user.getUsername());
			log.info("@# loginUser=>"+loginUser);

			model.addAttribute("loginUser", loginUser);

			ArrayList<CommissionDTO> commissionList = service.commissionList(loginUser.getId());
			model.addAttribute("commissionList", commissionList);
		} else {
			log.info("사용자 정보가 없습니다.");
		}


		return "userCommissionList";
	}
	
}
















