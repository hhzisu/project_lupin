package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;


@Mapper
public interface AuctionBidDAO {
    public AuctionDTO selectAuction(int auction_lot, int auctionSchedule_id);
    public ArrayList<AuctionDTO> auctionProgressList(); //진행 경매 목록
    public ArrayList<AuctionDTO> auctionScheduledList(); //예정 경매 목록
    public ArrayList<AuctionDTO> auctionResultList(); //경매 결과 목록
}
