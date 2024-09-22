package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AutoBidDTO {
    private int autoBidId;
    private int userId;
    private int auctionId;
    private int maxBidLimit;
    private String bidStatus;  // 'ACTIVE' 또는 'FINISHED'
}