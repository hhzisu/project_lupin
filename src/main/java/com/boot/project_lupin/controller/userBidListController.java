package com.boot.project_lupin.controller;


import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.UserBidListService;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Slf4j
public class userBidListController {

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private UserBidListService userBidListService;
	
	@RequestMapping("/userBidList")  
	public String getBidList(HttpServletRequest request, Model model) {
		log.info("userBidList");

		// HttpSession에서 사용자 정보 가져오기
		HttpSession session = request.getSession();
		CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");

		if (user != null) {
			log.info("@# loginUserName => " + user.getUsername());

			UserInfoDTO loginUser = userInfoService.selectUserInfo(user.getUsername());
			log.info("@# loginUser => " + loginUser);

			List<AuctionDTO> Bidlist = userBidListService.getBidList(loginUser.getId());
			log.info("@# Bidlist => " + Bidlist);

			model.addAttribute("Bidlist", Bidlist);
		} else {
			log.info("사용자 정보가 없습니다.");
		}

		return "userBidList";
	}


	@GetMapping("/getBidDetail")
	@ResponseBody
	public List<AuctionBidDTO> getBidDetail(@RequestParam("auctionId") int auctionId, @RequestParam("userId") int userId) {
		// auctionId와 userId로 응찰 내역 조회
		List<AuctionBidDTO> bidDetails = userBidListService.getBidDetail(auctionId, userId);
		return bidDetails;
	}
	
}
















