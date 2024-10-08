package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.CommissionDAO;
import com.boot.project_lupin.dao.ManagerDAO;
import com.boot.project_lupin.dao.QuestionDAO;
import com.boot.project_lupin.dto.*;
import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class ManagerService {

    @Autowired
    private SqlSession sqlSession;
    @Autowired
    private ServletContext servletContext;

    // 일정 등록 메서드
    public void insertSchedule(AuctionScheduleDTO auctionScheduleDTO) {
        log.info("@# ManagerService insertSchedule");
        log.info("@# ManagerService auctionScheduleDTO => {}", auctionScheduleDTO);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        dao.insertSchedule(auctionScheduleDTO);
    }

    // 일정 리스트 조회 메서드
    public ArrayList<AuctionScheduleDTO> scheduleList() {
        log.info("@# ManagerService scheduleList");
        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        return dao.scheduleList();
    }

    // 경매 일정 조회 메서드 (auctionSchedule_id로 조회)
    public AuctionScheduleDTO getScheduleById(String auctionSchedule_id) {
        log.info("@# ManagerService getScheduleById auctionSchedule_id => {}", auctionSchedule_id);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        AuctionScheduleDTO auctionScheduleDTO = dao.getScheduleById(auctionSchedule_id);

        if (auctionScheduleDTO == null) {
            log.warn("@# ManagerService 해당 ID로 경매 일정 조회 실패");
        } else {
            log.info("@# ManagerService 경매 일정 조회 성공: {}", auctionScheduleDTO);
        }

        return auctionScheduleDTO;
    }

    // 일정 수정
    public void scheduleModify(AuctionScheduleDTO auctionScheduleDTO) {
        log.info("@# ManagerService scheduleModify auctionScheduleDTO => {}", auctionScheduleDTO);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        try {
            dao.scheduleModify(auctionScheduleDTO);
            log.info("@# ManagerService 경매 일정 수정 성공");
        } catch (Exception e) {
            log.error("@# ManagerService 경매 일정 수정 실패", e);
            throw e;
        }
    }

    // 일정 삭제 메서드
    public void scheduleDelete(String auctionSchedule_id) {
        log.info("@# ManagerService scheduleDelete auctionSchedule_id => {}", auctionSchedule_id);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        dao.scheduleDelete(auctionSchedule_id);
        log.info("@# ManagerService 일정 삭제 성공");
    }

    // 위탁 리스트 조회 메서드
    public ArrayList<CommissionDTO> commissionList() {
        log.info("@# ManagerService commissionList");
        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        return dao.commissionList();
    }

    // CommissionAttachDTO 리스트 가져오기
    public List<CommissionAttachDTO> commissionGetFileList(int commission_id) {
        log.info("@# ManagerService commissionGetFileList commission_id => {}", commission_id);

        CommissionDAO dao = sqlSession.getMapper(CommissionDAO.class);
        return dao.commissionGetFileList(commission_id);
    }

    // 경매 항목 삽입 (트랜잭션 적용)
    @Transactional
    public void insertAuction(AuctionDTO auctionDTO) {
        log.info("@# ManagerService insertAuction auctionDTO => {}", auctionDTO);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);

        // auctionSchedule_id에 대한 최대 auction_lot 값을 조회
        Integer maxAuctionLot = dao.getMaxAuctionLotByScheduleId(auctionDTO.getAuctionSchedule_id());

        // 새로운 auction_lot 값 계산 (최대 값 + 1, 없으면 1로 시작)
        int newAuctionLot = (maxAuctionLot == null || maxAuctionLot == 0) ? 1 : maxAuctionLot + 1;
        auctionDTO.setAuction_lot(newAuctionLot);

        // auction_lot 삽입
        dao.insertAuctionLot(newAuctionLot, auctionDTO.getAuctionSchedule_id());
        log.info("@# 새로운 auction_lot 값: {}", newAuctionLot);

        // auction 삽입
        dao.insertAuction(auctionDTO);
        log.info("@# ManagerService 경매 항목 삽입 성공");

        // 첨부파일 리스트 1 처리 (AuctionAttachList1)
        if (auctionDTO.getAuctionAttachList1() != null && !auctionDTO.getAuctionAttachList1().isEmpty()) {
            log.info("@# auctionDTO.getAuctionAttachList1() => {}", auctionDTO.getAuctionAttachList1());
            auctionDTO.getAuctionAttachList1().forEach(attach -> {
                attach.setAuction_id(auctionDTO.getAuction_id());
                dao.auctionInsertFile1(attach);  // auction_attach1 테이블에 삽입
            });
        } else {
            log.info("@# AuctionAttachList1에 첨부 파일이 없습니다.");
        }

        // 첨부파일 리스트 2 처리 (AuctionAttachList2)
        if (auctionDTO.getAuctionAttachList2() != null && !auctionDTO.getAuctionAttachList2().isEmpty()) {
            log.info("@# auctionDTO.getAuctionAttachList2() => {}", auctionDTO.getAuctionAttachList2());
            auctionDTO.getAuctionAttachList2().forEach(attach -> {
                attach.setAuction_id(auctionDTO.getAuction_id());
                dao.auctionInsertFile2(attach);  // auction_attach2 테이블에 삽입
            });
        } else {
            log.info("@# AuctionAttachList2에 첨부 파일이 없습니다.");
        }
    }

    // AuctionAttachDTO 리스트 가져오기
    public List<AuctionAttachDTO> auctionGetFileList1(int auction_id) {
        log.info("@# ManagerService auctionGetFileList1 auction_id => {}", auction_id);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        return dao.auctionGetFileList1(auction_id);
    }

    public List<AuctionAttachDTO> auctionGetFileList2(int auction_id) {
        log.info("@# ManagerService auctionGetFileList2 auction_id => {}", auction_id);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        return dao.auctionGetFileList2(auction_id);
    }

    // 파일 삭제 메서드
    public void auctionDeleteFile(List<AuctionAttachDTO> fileList) {
        if (fileList == null || fileList.isEmpty()) {
            log.info("@# 삭제할 파일이 없습니다.");
            return;
        }

        for (AuctionAttachDTO attach : fileList) {
            try {
                // 파일 경로 설정
                Path file = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/"
                        + attach.getUuid() + "_" + attach.getFileName());
                // 파일 삭제
                Files.deleteIfExists(file);
                log.info("@# 파일 삭제 성공: {}", file);

                // 이미지 파일일 경우 썸네일 삭제
                if (Files.probeContentType(file).startsWith("image")) {
                    Path thumbNail = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/s_"
                            + attach.getUuid() + "_" + attach.getFileName());
                    Files.deleteIfExists(thumbNail);
                    log.info("@# 썸네일 삭제 성공: {}", thumbNail);
                }
            } catch (Exception e) {
                log.error("@# 파일 삭제 실패: {}", attach, e);
            }
        }
    }
}
