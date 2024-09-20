package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

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

    private List<AuctionAttachDTO> AuctionAttachList1;  // 파일업로드 attachDTO를 가져와서 attachList에 담음
    private List<AuctionAttachDTO> AuctionAttachList2;  // 파일업로드 attachDTO를 가져와서 attachList에 담음

    // 경매 입찰 내역
    private List<AuctionBidDTO> bidHistory;
}

