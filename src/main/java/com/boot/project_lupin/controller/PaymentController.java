package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.PaymentDTO;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.PaymentService;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Map;

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

	@PostMapping("/api/payment/complete")
	public ResponseEntity<String> completePayment(@RequestBody Map<String, Object> paymentData) {
		try {
			log.info("Received paymentData: {}", paymentData);

			// paymentData에서 값을 추출
			String buyIdStr = paymentData.get("buy_id").toString();  // toString()으로 변경
			String auctionIdStr = paymentData.get("auction_id").toString();  // toString()으로 변경
			String bidIdStr = paymentData.get("bid_id").toString();  // toString()으로 변경
			String payState = (String) paymentData.get("pay_state");  // pay_state는 여전히 String일 수 있음

			log.info("Buy ID: {}", buyIdStr);
			log.info("Auction ID: {}", auctionIdStr);
			log.info("Bid ID: {}", bidIdStr);
			log.info("Pay State: {}", payState);

			PaymentDTO paymentDTO = new PaymentDTO();
			paymentDTO.setBuy_id(Integer.parseInt(buyIdStr));
			paymentDTO.setAuction_id(Integer.parseInt(auctionIdStr));
			paymentDTO.setBid_id(Integer.parseInt(bidIdStr));
			paymentDTO.setBuy_state(payState);

			service.updateBuyState(paymentDTO);

			return new ResponseEntity<>("Payment completed successfully", HttpStatus.OK);
		} catch (Exception e) {
			log.error("Payment update failed", e);
			return new ResponseEntity<>("Payment failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}




}
