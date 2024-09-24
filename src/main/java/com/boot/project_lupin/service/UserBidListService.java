package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionBidDAO;
import com.boot.project_lupin.dao.UserBidListDAO;
import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AutoBidDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class UserBidListService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserBidListDAO userBidListDAO;

    public List<AuctionDTO> getBidList(int userId) {
        log.info("@# AuctionBidService getAuctionById");
        log.info("@# userId=>"+userId);

        userBidListDAO = sqlSession.getMapper(UserBidListDAO.class);

        // 경매 정보 가져오기
        List<AuctionDTO> auctions = userBidListDAO.getUserBidList(userId);
        log.info("@# auctions => " + auctions);

        // 해당 경매의 입찰 내역 가져오기
        for (int i = 0; i < auctions.size(); i++) {
            List<AuctionBidDTO> bidInfo = userBidListDAO.getUserBidInfo2(userId, auctions.get(i).getAuction_id());
            log.info("@# bidInfo => " + bidInfo);

            auctions.get(i).setBidHistory(bidInfo);
        }


        return auctions;
    }


    public List<AuctionBidDTO> getBidDetail(int auctionId, int userId) {
        return userBidListDAO.getUserBidInfo(userId, auctionId);
    }

}
