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
import java.util.List;

@Slf4j
@Service("PaymentService")
@EnableScheduling
public class PaymentService {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private PaymentDAO dao;

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
		log.info("@# 결제 업데이트 정보 service=>" + paymentDTO);
		dao = sqlSession.getMapper(PaymentDAO.class);
		dao.updateBuyState(paymentDTO);
	}


	@Scheduled(fixedRate = 60000)  // 1분마다 실행
	public void checkAuctionEndTime() {
//		log.info("@# 낙찰 물품 조회중");

//		LocalDateTime now = LocalDateTime.now();
//		int[] endedAuctions = dao.selectEndedAuctions(now);
		List<Integer> endedAuctions = dao.selectEndedAuctions();

		for (Integer auction : endedAuctions) {
//			log.info("@# auction 아이디 =>"+auction);

			// 최고 입찰자 조회
			AuctionBidDTO highestBid = dao.selectHighestBid(auction);
//			log.info("@# highestBid=>"+highestBid);

			Integer paymentExist = dao.checkPaymentExist(auction);
//			log.info("@# paymentExist=>"+paymentExist);

			if (highestBid != null && paymentExist == 0) {
				log.info("@# 낙찰자 정보 저장");
				// 낙찰자 정보 저장
				PaymentDTO buy = new PaymentDTO();
				buy.setUser_id(highestBid.getUserId());
				buy.setAuction_id(highestBid.getAuctionId());
				buy.setBid_id(highestBid.getBidId());

				log.info("@# buy=>"+buy);
				dao.insertBuyInfo(buy);
			}
		}
	}

}

