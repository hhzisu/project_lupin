package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AuctionScheduleDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ManagerDAO {
	// 경매 스케줄 삽입
	public void insertSchedule(AuctionScheduleDTO auctionScheduleDTO);

	// 경매 스케줄 리스트 조회
	public ArrayList<AuctionScheduleDTO> scheduleList();

	public void scheduleDelete(String auctionSchedule_id);

	// 경매 항목 삽입
	void insertAuction(AuctionDTO auctionDTO);

	// 경매 위탁 리스트 조회
	public ArrayList<CommissionDTO> commissionList();
}
