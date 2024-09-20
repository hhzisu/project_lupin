package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.CustomOAuth2User;
import com.boot.project_lupin.dto.UserInfoDTO;
import com.boot.project_lupin.service.UserInfoService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/auction")
public class headController {

    @Autowired
    private UserInfoService service;

    @GetMapping("/userInfo")
    public UserInfoDTO getUserInfo(HttpServletRequest httpServletRequest) {
        log.info("@# userInfo");

        // HttpSession에서 사용자 정보 가져오기
        HttpSession session = httpServletRequest.getSession();
        CustomOAuth2User user = (CustomOAuth2User) session.getAttribute("user");

        if (user != null) {
            log.info("@# loginUserName => " + user.getUsername());
            UserInfoDTO loginUser = service.selectUserInfo(user.getUsername());
            log.info("@# loginUser => " + loginUser);
            return loginUser;
        } else {
            log.info("사용자 정보가 없습니다.");
            return null;
        }
    }

    @GetMapping("/{auctionId}")
    public ResponseEntity<AuctionDTO> getAuction(@PathVariable int auctionId) {
        AuctionDTO auction = auctionService.getAuctionById(auctionId);
        return ResponseEntity.ok(auction);
    }
}
