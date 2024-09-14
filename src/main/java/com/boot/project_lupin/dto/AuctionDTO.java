package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuctionDTO {
    private int auction_id;
    private int auction_lot;
    private String auction_author;
    private String auction_title;
    private String auction_size;
    private String auction_madeDate;
    private String auction_materials;
    private String auction_authorExp;
    private String auction_startPrice;
    private String auction_guessPrice;

    private int auctionSchedule_id;
    private String auctionSchedule_start;
    private String auctionSchedule_end;


}

