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
    private int userId; // 응찰자 ID
    private String userName; // 응찰자 이름
    private int lateBidMoney; // 최신 응찰 금액
    private int bidMoney;  // 응찰 금액
//    private String bidTime; // 응찰 시간
    private Timestamp bidTime;  // 응찰 시간

    private String bidStatus; // 응찰 방법

}