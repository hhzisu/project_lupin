package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.PaymentDTO;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.IamportService;
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
	private PaymentService paymentService;
	@Autowired
	private IamportService iamportService;

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

		ArrayList<PaymentDTO> buyList = paymentService.payListbyId(Integer.parseInt(String.valueOf(loginUser.getId())));
		model.addAttribute("buyList", buyList);

		return "userBuyList";
	}

	@PostMapping("/api/payment/complete")
	public ResponseEntity<String> completePayment(@RequestBody Map<String, Object> paymentData) {
		log.info("@# 결제 업데이트 정보 controller paymentData=>" + paymentData);
		try {
			String impUid = (String) paymentData.get("imp_uid");
			String buyIdStr = paymentData.get("buy_id").toString();
			String payState = (String) paymentData.get("pay_state");

			log.info("@# 결제 업데이트 정보 controller buyIdStr=>" + buyIdStr);
			log.info("@# 결제 업데이트 정보 controller payState=>" + payState);

			// 결제 검증
			boolean isPaymentSuccessful = iamportService.verifyPayment(impUid);
			if (!isPaymentSuccessful) {
				return new ResponseEntity<>("결제 검증 실패", HttpStatus.BAD_REQUEST);
			}

			// 결제 성공 후 DB 업데이트
			PaymentDTO paymentDTO = new PaymentDTO();
			paymentDTO.setBuy_id(Integer.parseInt(buyIdStr));
			paymentDTO.setBuy_state(payState);
			paymentService.updateBuyState(paymentDTO);

			return new ResponseEntity<>("Payment completed successfully", HttpStatus.OK);
		} catch (Exception e) {
			log.error("Payment update failed", e);
			return new ResponseEntity<>("Payment failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}




}
