package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionBidDAO;
import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dao.PaymentDAO;
import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.PaymentDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;

@Slf4j
@Service("PaymentService")
@EnableScheduling
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


	@Scheduled(fixedRate = 1000)  // 1초마다 실행
	public void checkAuctionEndTime() {
//		log.info("@# 낙찰 물품 조회중");

		LocalDateTime now = LocalDateTime.now();
		int[] endedAuctions = dao.selectEndedAuctions(now);

		for (int auction : endedAuctions) {
			// 최고 입찰자 조회
			AuctionBidDTO highestBid = dao.selectHighestBid(auction);

			if (highestBid != null) {
				// 낙찰자 정보 저장
				PaymentDTO buy = new PaymentDTO();
				buy.setUser_id(highestBid.getUserId());
				buy.setAuction_id(highestBid.getAuctionId());
				buy.setBid_id(highestBid.getBidId());
				dao.insertBuyInfo(buy);
			}
		}
	}

}

