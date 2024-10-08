package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
    private int buy_id;
    private int user_id;
    private int auction_id;
    private int bid_id;
    private Timestamp buy_date;
    private String buy_state;

    private int bid_money;  // 결제 금액
    private Timestamp bid_time;  // 결제 시간

    private String auction_title;  // 경매품 제목
    private String auction_author;  // 경매품 작가
    private int auction_lot;  // 경매 랏 번호
}
