package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionAttach1DTO;
import com.boot.project_lupin.dto.AuctionAttach2DTO;
import com.boot.project_lupin.dto.AuctionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface AuctionDAO {
    public AuctionDTO selectAuction(int auction_lot, int auctionSchedule_id);
    public ArrayList<AuctionDTO> auctionProgressList(); //진행 경매 목록
    public ArrayList<AuctionDTO> auctionScheduledList(); //예정 경매 목록
    public ArrayList<AuctionDTO> auctionResultList(); //경매 결과 목록
    public int auctionCount(int auctionSchedule_id); // 경매 lot 수

    //파일 업로드 1
    public void auctionInsertFile1(AuctionAttach1DTO vo);  // 파라미터가 AuctionAttach1DTO / 파일추가
    public List<AuctionAttach1DTO> auctionGetFileList1(int auction_id); // int타입 auction_id 파라미터를 list타입 <AuctionAttach1DTO> getFileList로 사용하려함 / 파일열람
    public void auctionDeleteFile1(String auction_id);  // question_id 맞춰서 파일삭제로직

    //파일 업로드 2
    public void auctionInsertFile2(AuctionAttach2DTO vo);  // 파라미터가 AuctionAttach2DTO / 파일추가
    public List<AuctionAttach2DTO> auctionGetFileList2(int auction_id); // int타입 auction_id 파라미터를 list타입 <AuctionAttach2DTO> getFileList로 사용하려함 / 파일열람
    public void auctionDeleteFile2(String auction_id);  // auction_id 맞춰서 파일삭제로직
}
