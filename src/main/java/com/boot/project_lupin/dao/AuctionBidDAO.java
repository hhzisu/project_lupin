package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface AuctionBidDAO {
    public void insertBid(AuctionBidDTO auctionBidDTO);
    public AuctionDTO getAuctionById(int auctionId); // 응찰 팝업 경매 정보
    public List<AuctionBidDTO> getLatestBidInfo(int auctionId); // 경매 응찰 목록
}
