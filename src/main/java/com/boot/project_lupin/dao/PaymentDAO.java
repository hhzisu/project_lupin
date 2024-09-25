package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Mapper
public interface PaymentDAO {
	public ArrayList<PaymentDTO> payListbyId(int user_id); //결제 정보 목록
	public void  updateBuyState(PaymentDTO paymentDTO); //결제 완료 후 buy_state와 buy_date 업데이트

	public AuctionBidDTO selectHighestBid(int auctionId); // 낙찰자 정보
	public void insertBuyInfo(PaymentDTO buy); // 낙찰자 데이터 입력
	public int[] selectEndedAuctions(LocalDateTime now); // 경매 종료된 모든 물품 조회
}
