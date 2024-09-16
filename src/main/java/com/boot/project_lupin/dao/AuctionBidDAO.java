package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;


@Mapper
public interface AuctionBidDAO {
    public void updateBid(AuctionBidDTO auctionBidDTO);
    public AuctionBidDTO getLatestBidInfo(int auctionId); //진행 경매 목록
}
