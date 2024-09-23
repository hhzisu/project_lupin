package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service("AuctionService")
public class AuctionService {
	@Autowired
	private SqlSession sqlSession;

	public AuctionDTO selectAuction(int auction_lot, int auctionSchedule_id){
		log.info("AuctionService selectAuction");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		AuctionDTO auctionDTO = dao.selectAuction(auction_lot, auctionSchedule_id);
		return auctionDTO;
	}

	//진행 경매 목록
	public ArrayList<AuctionDTO> auctionProgressList(){
		log.info("AuctionService auctionProgressList");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		ArrayList<AuctionDTO> list = dao.auctionProgressList();
		return list;
	}

	//예정 경매 목록
	public ArrayList<AuctionDTO> auctionScheduledList(){
		log.info("AuctionService auctionScheduledList");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		ArrayList<AuctionDTO> list = dao.auctionScheduledList();
		return list;
	}

	//경매 결과 목록
	public ArrayList<AuctionDTO> auctionResultList(){
		log.info("AuctionService auctionResultList");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		ArrayList<AuctionDTO> list = dao.auctionResultList();
		return list;
	}

	// 경매 lot 수
	public int auctionCount(int auctionSchedule_id) {
		log.info("AuctionService auctionCount");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		return dao.auctionCount(auctionSchedule_id);
	}

	public List<AuctionDTO> auctionProgressSearch(String searchTerm){
		log.info("AuctionService auctionProgressSearch");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		List<AuctionDTO> list = dao.auctionProgressSearch(searchTerm);
		return list;
	}
	public List<AuctionDTO> auctionScheduledSearch(String searchTerm){
		log.info("AuctionService auctionScheduledSearch");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		List<AuctionDTO> list = dao.auctionScheduledSearch(searchTerm);
		return list;
	}
	public List<AuctionDTO> auctionResultSearch(String searchTerm){
		log.info("AuctionService auctionResultSearch");
		AuctionDAO dao = sqlSession.getMapper(AuctionDAO.class);
		List<AuctionDTO> list = dao.auctionResultSearch(searchTerm);
		return list;
	}
}

