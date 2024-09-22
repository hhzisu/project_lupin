package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionBidDAO;
import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AutoBidDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static org.springframework.data.projection.EntityProjection.ProjectionType.DTO;

@Slf4j
@Service
public class AuctionBidService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private AuctionBidDAO bidDAO;

    // 응찰 데이터를 DB에 저장
    public void insertBid(AuctionBidDTO auctionBidDTO) {
        log.info("@# AuctionBidService updateBid");
        log.info("@# auctionBidDTO=>"+auctionBidDTO);

        bidDAO = sqlSession.getMapper(AuctionBidDAO.class);
        bidDAO.insertBid(auctionBidDTO);
    }


    public AuctionDTO getAuctionById(int auctionId) {
        log.info("@# AuctionBidService getAuctionById");
        log.info("@# auctionId=>"+auctionId);

        bidDAO = sqlSession.getMapper(AuctionBidDAO.class);

        return bidDAO.getAuctionById(auctionId);
    }


    public List<AuctionBidDTO> getLatestBidInfo(int auctionId) {
        // 경매의 최신 응찰 정보를 가져오는 로직
        log.info("@# AuctionBidService getLatestBidInfo");
        log.info("@# auctionId=>"+auctionId);

        bidDAO = sqlSession.getMapper(AuctionBidDAO.class);
        List<AuctionBidDTO> dtos = bidDAO.getLatestBidInfo(auctionId);

        return dtos;
    }


    // 자동응찰 저장
    public void insertAutoBid(AutoBidDTO autoBid) {
        // 1. 자동응찰 정보 저장
        bidDAO.insertAutoBid(autoBid);

        // 2. 현재 경매의 최고 입찰 정보를 가져옴
        List<AuctionBidDTO> Bids = bidDAO.getLatestBidInfo(autoBid.getAuctionId());

        // List의 첫 번째 요소를 가져올 때는 get() 메서드를 사용
        AuctionBidDTO currentBid = (Bids != null && !Bids.isEmpty()) ? Bids.get(0) : null;

        // 3. 현재가에 따라 자동응찰 한도가 남아 있다면 최초 응찰을 진행
        int currentPrice = (currentBid != null) ? currentBid.getBidMoney() : getStartingPrice(autoBid.getAuctionId());
        int bidIncrement = getBidIncrement(currentPrice);
        int firstBidAmount = currentPrice + bidIncrement;

        if (firstBidAmount <= autoBid.getMaxBidLimit()) {
            // 4. 자동응찰자가 최초 응찰을 진행
            AuctionBidDTO firstAutoBid = new AuctionBidDTO();
            firstAutoBid.setAuctionId(autoBid.getAuctionId());
            firstAutoBid.setUserId(autoBid.getUserId());
            firstAutoBid.setBidMoney(firstBidAmount);

            // 5. DB에 첫 자동응찰 기록 저장
            bidDAO.insertBid(firstAutoBid);
        }
    }

    // 시작가 가져오기
    public int getStartingPrice(int auctionId) {
        return bidDAO.getAuctionStartPrice(auctionId);
    }


    // 특정 경매의 자동응찰 리스트 가져오기
    public List<AutoBidDTO> getAutoBidsByAuctionId(int auctionId) {
        return bidDAO.getAutoBidsByAuctionId(auctionId);
    }

    // 자동응찰 상태 업데이트
    public void updateAutoBidStatus(int autoBidId, String bidStatus) {
        bidDAO.updateAutoBidStatus(autoBidId, bidStatus);
    }

    // 수동응찰 처리 후 자동응찰 로직 처리
    public void handleAutoBids(AuctionBidDTO currentBid) {
        // 경매 ID에 대한 모든 활성화된 자동응찰 정보를 가져옴
        List<AutoBidDTO> autoBids = bidDAO.getAutoBidsByAuctionId(currentBid.getAuctionId());

        // 현재 입찰가와 각 자동응찰자의 한도를 비교
        for (AutoBidDTO autoBid : autoBids) {
            if (autoBid.getMaxBidLimit() > currentBid.getBidMoney()) {
                // 한도 내에서 자동응찰 가능, 자동으로 응찰 등록
                int newBidAmount = currentBid.getBidMoney() + getBidIncrement(currentBid.getBidMoney());

                if (newBidAmount <= autoBid.getMaxBidLimit()) {
                    AuctionBidDTO newAutoBid = new AuctionBidDTO();
                    newAutoBid.setAuctionId(currentBid.getAuctionId());
                    newAutoBid.setUserId(autoBid.getUserId());
                    newAutoBid.setBidMoney(newBidAmount);

                    // DB에 자동응찰 저장
                    bidDAO.insertBid(newAutoBid);

                    // 자동응찰자의 상태를 FINISHED로 변경할지 결정
                    if (newBidAmount == autoBid.getMaxBidLimit()) {
                        updateAutoBidStatus(autoBid.getAutoBidId(), "FINISHED");
                    }
                }
            }
        }
    }

    // 호가 단위 계산 함수 (기존 로직 재활용)
    private int getBidIncrement(int currentPrice) {
        if (currentPrice < 300000) {
            return 20000;
        } else if (currentPrice < 1000000) {
            return 50000;
        } else if (currentPrice < 3000000) {
            return 100000;
        } else if (currentPrice < 5000000) {
            return 200000;
        } else if (currentPrice < 10000000) {
            return 500000;
        } else {
            return 1000000;
        }
    }
}
