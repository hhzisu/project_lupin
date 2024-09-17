package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;

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

	//파일 업로드 1
	public void auctionInsertFile1(AuctionAttach1DTO vo);  // 파라미터가 AuctionAttach1DTO / 파일추가
	public List<AuctionAttach1DTO> auctionGetFileList1(int auction_id); // int타입 auction_id 파라미터를 list타입 <AuctionAttach1DTO> getFileList로 사용하려함 / 파일열람
	public void auctionDeleteFile1(String auction_id);  // question_id 맞춰서 파일삭제로직

	//파일 업로드 2
	public void auctionInsertFile2(AuctionAttach2DTO vo);  // 파라미터가 AuctionAttach2DTO / 파일추가
	public List<AuctionAttach2DTO> auctionGetFileList2(int auction_id); // int타입 auction_id 파라미터를 list타입 <AuctionAttach2DTO> getFileList로 사용하려함 / 파일열람
	public void auctionDeleteFile2(String auction_id);  // auction_id 맞춰서 파일삭제로직
}
