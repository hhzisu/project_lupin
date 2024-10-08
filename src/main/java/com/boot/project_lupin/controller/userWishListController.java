package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.UserInfoService;
import com.boot.project_lupin.service.UserWishListService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Controller
@Slf4j
public class userWishListController {

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private UserWishListService userWishListService;
	
	@RequestMapping("/userWishList")  
	public String question(HttpServletRequest request, Model model) {
		log.info("userWishList");

		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = request.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");

		if (user != null) {
			log.info("@# loginUserName => " + user.getUsername());

			UserInfoDTO loginUser = userInfoService.selectUserInfo(user.getUsername());
			log.info("@# loginUser => " + loginUser);

			List<AuctionDTO> Wishlist = userWishListService.getUserWishList(loginUser.getId());
			log.info("@# Wishlist => " + Wishlist);

			model.addAttribute("Wishlist", Wishlist);
		} else {
			log.info("사용자 정보가 없습니다.");
		}

		return "userWishList";
	}
	
}
















