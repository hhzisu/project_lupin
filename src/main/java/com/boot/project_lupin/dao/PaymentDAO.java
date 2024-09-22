package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.PaymentDTO;
import com.boot.project_lupin.dto.QuestionAttachDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface PaymentDAO {
	public ArrayList<PaymentDTO> payListbyId(int user_id); //결제 정보 목록
	public void  updateBuyState(PaymentDTO paymentDTO); //결제 완료 후 buy_state와 buy_date 업데이트
	public void  insertPayment(PaymentDTO paymentDTO); //결제 정보를 저장
	public String getMoneyByBidId(int bid_id); //입찰 정보로 금액 조회
}
