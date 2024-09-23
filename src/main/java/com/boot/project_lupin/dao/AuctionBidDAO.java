package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AutoBidDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Mapper
public interface AuctionBidDAO {

    public void insertBid(AuctionBidDTO auctionBidDTO);
    public AuctionDTO getAuctionById(int auctionId); // 응찰 팝업 경매 정보
    public List<AuctionBidDTO> getLatestBidInfo(int auctionId); // 경매 응찰 목록

    public void insertAutoBid(AutoBidDTO autoBid); // 자동응찰 저장
    public List<AutoBidDTO> getAutoBidsByAuctionId(int auctionId); // 특정 경매의 자동응찰 리스트 가져오기
    public void updateAutoBidStatus(int autoBidId, String bidStatus); // 자동응찰 상태 업데이트
    public void handleAutoBids(AuctionBidDTO currentBid); // 수동응찰 처리 후 자동응찰 로직 처리

    public int getAuctionStartPrice(int auctionId);

    // 작품 ID로 경매 종료 시간 조회
    public Date getAuctionEndTime(int auctionId);

    // 작품의 경매 종료 시간 업데이트
    public void updateAuctionEndTime(@Param("auctionId") int auctionId, @Param("newEndTime") Date newEndTime);
}
