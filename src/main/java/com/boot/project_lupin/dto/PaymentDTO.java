package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
    private int buy_id;
    private int user_id;
    private int auction_id;
    private int bid_id;
    private String buy_date;
    private String buy_state;

    private String bid_money;  // 결제 금액
    private String bid_time;  // 결제 금액
}
