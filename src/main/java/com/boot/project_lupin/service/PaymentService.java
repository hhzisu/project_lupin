package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionBidDAO;
import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dao.PaymentDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.PaymentDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;

@Slf4j
@Service("PaymentService")
public class PaymentService {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PaymentDAO dao;

	@Autowired
	private AuctionBidDAO auctionBidDAO;

	//결제 목록
	public ArrayList<PaymentDTO> payListbyId(int user_id){
		log.info("PaymentService payListbyId");
		dao = sqlSession.getMapper(PaymentDAO.class);
		ArrayList<PaymentDTO> list = dao.payListbyId(user_id);
		return list;
	}

	//결제 상태, 시간 업데이트
	public void updateBuyState(PaymentDTO paymentDTO){
		log.info("PaymentService updateBuyState");
		dao = sqlSession.getMapper(PaymentDAO.class);
		dao.updateBuyState(paymentDTO);
	}


//	@Scheduled(fixedRate = 1000)  // 1초마다 실행
//	public void checkAuctionEndTime() {
//		LocalDateTime now = LocalDateTime.now();
//		List<Auction> endedAuctions = auctionRepository.findEndedAuctions(now);
//
//		for (Auction auction : endedAuctions) {
//			// 최고 입찰자 조회
//			AuctionBidDTO highestBid = auctionBidDAO.selectHighestBid(auction.getAuctionId());
//
//			if (highestBid != null) {
//				// 낙찰자 정보 저장
//				BuyDTO buy = new BuyDTO();
//				buy.setUserId(highestBid.getUserId());
//				buy.setAuctionId(highestBid.getAuctionId());
//				buy.setBidId(highestBid.getBidId());
//				buyDAO.insertBuyInfo(buy);
//			}
//		}
//	}

}

