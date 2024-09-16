package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionBidDAO;
import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class AuctionBidService {

    @Autowired
    private SqlSession sqlSession;

    // 응찰 데이터를 DB에 저장
    public void updateBid(AuctionBidDTO auctionBidDTO) {
        log.info("@# AuctionBidService saveBid");
        AuctionBidDAO dao = sqlSession.getMapper(AuctionBidDAO.class);
        dao.insertBid(bid);
    }

    public AuctionBidDTO getLatestBidInfo(int auctionId) {
        // 경매의 최신 응찰 정보를 가져오는 로직
        return bidMapper.getLatestBid(auctionId);
    }
}
