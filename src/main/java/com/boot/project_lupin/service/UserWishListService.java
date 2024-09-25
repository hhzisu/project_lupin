package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.UserWishListDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class UserWishListService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserWishListDAO userWishListDAO;

    public List<AuctionDTO> getUserWishList(int userId) {
        log.info("@# AuctionBidService getAuctionById");
        log.info("@# userId=>"+userId);

        userWishListDAO = sqlSession.getMapper(UserWishListDAO.class);

        // 경매 정보 가져오기
        List<AuctionDTO> auctions = userWishListDAO.getUserWishList(userId);
        log.info("@# auctions => " + auctions);

        return auctions;
    }

}
