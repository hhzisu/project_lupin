package com.boot.project_lupin.controller;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.service.AuctionBidService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
@Slf4j
public class AuctionBidController {

    @Autowired
    private AuctionBidService bidService; // BidService를 통해 DB에 저장

    // 클라이언트가 응찰할 때
    @MessageMapping("/bid")
    @SendTo("/sub/auctionUpdates")
    public AuctionBidDTO insertBid(AuctionBidDTO bid) throws Exception {
        log.info("@# AuctionBidController insertBid");
        log.info("@# auctionBidDTO=>"+bid);

        bidService.insertBid(bid);  // 데이터베이스에 저장

        // 모든 클라이언트에 최신 경매 상태 브로드캐스트
        AuctionBidDTO update = bidService.getLatestBidInfo(bid.getAuctionId());
        log.info("@# update=>"+update);
        return update;
    }
}
