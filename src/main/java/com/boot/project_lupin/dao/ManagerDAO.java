package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ManagerDAO {

	// 경매 스케줄 삽입
	void insertSchedule(AuctionScheduleDTO auctionScheduleDTO);

	// 경매 스케줄 리스트 조회
	ArrayList<AuctionScheduleDTO> scheduleList();

	// 특정 auctionSchedule_id로 일정 조회
	AuctionScheduleDTO getScheduleById(@Param("auctionSchedule_id") String auctionSchedule_id);

	// 경매 스케줄 수정
	void scheduleModify(AuctionScheduleDTO auctionScheduleDTO);

	// 경매 스케줄 삭제
	void scheduleDelete(String auctionSchedule_id);

	// 특정 auctionSchedule_id에 따른 최대 auction_lot 값 조회
	Integer getMaxAuctionLotByScheduleId(@Param("auctionSchedule_id") int auctionSchedule_id);

	// 경매 항목의 lot 번호를 생성하고 해당 값을 반환
	void insertAuctionLot(@Param("auction_lot") int auction_lot, @Param("auctionSchedule_id") int auctionSchedule_id);

	// 경매 항목 삽입
	void insertAuction(AuctionDTO auctionDTO);

	// 경매 위탁 리스트 조회
	ArrayList<CommissionDTO> commissionList();

	// 파일 업로드 1
	void auctionInsertFile(AuctionAttachDTO vo);

	List<AuctionAttachDTO> auctionGetFileList(int auction_id);

	void auctionDeleteFile(String auction_id);

}
