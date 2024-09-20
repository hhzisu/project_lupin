package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuctionBidDTO {

    private int auctionId; // 경매 ID
    private String userId; // 응찰자 ID
    private String userName; // 응찰자 이름
    private String lateBidMoney; // 최신 응찰 금액
    private String bidMoney;  // 응찰 금액
//    private String bidTime; // 응찰 시간
    private Timestamp bidTime;  // 응찰 시간

}