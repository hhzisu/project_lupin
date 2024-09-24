package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AutoBidDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;


@Mapper
public interface UserBidListDAO {
    public void insertBid(AuctionBidDTO auctionBidDTO);

    public List<AuctionDTO> getUserBidList(int userId); // 응찰 작품 정보
    public List<AuctionBidDTO> getUserBidInfo(@Param("userId") int userId, @Param("auctionId") int auctionId); // 응찰 상세 정보
    public List<AuctionBidDTO> getUserBidInfo2(@Param("userId") int userId, @Param("auctionId") int auctionId); // 응찰 상세 정보
}
