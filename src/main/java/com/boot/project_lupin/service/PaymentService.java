package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dao.PaymentDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.PaymentDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service("PaymentService")
public class PaymentService {
	@Autowired
	private SqlSession sqlSession;

	//결제 목록
	public ArrayList<PaymentDTO> payListbyId(int user_id){
		log.info("PaymentService payListbyId");
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		ArrayList<PaymentDTO> list = dao.payListbyId(user_id);
		return list;
	}

	//결제 상태, 시간 업데이트
	public void updateBuyState(PaymentDTO paymentDTO){
		log.info("PaymentService updateBuyState");
		PaymentDAO dao = sqlSession.getMapper(PaymentDAO.class);
		dao.updateBuyState(paymentDTO);
	}

}

