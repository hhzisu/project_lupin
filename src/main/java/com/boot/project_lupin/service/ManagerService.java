package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.ManagerDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.AuctionScheduleDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Slf4j
@Service
public class ManagerService {

    @Autowired
    private SqlSession sqlSession;

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
        ArrayList<AuctionScheduleDTO> scheduleList = dao.scheduleList();
        return scheduleList;
    }

    // 위탁 리스트 조회 메서드
    public ArrayList<CommissionDTO> commissionList() {
        log.info("@# ManagerService commissionList");
        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        ArrayList<CommissionDTO> commissionList = dao.commissionList();
        return commissionList;
    }

    /* 경매 항목 삽입 (auction_lot은 TRIGGER에서 자동 처리) */
    @Transactional(timeout = 30)
    public void insertAuction(AuctionDTO auctionDTO) {
        log.info("@# ManagerService insertAuction");
        log.info("@# ManagerService auctionDTO => {}", auctionDTO);

        try {
            ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);

            // TRIGGER가 auction_lot 값을 자동으로 처리하므로 추가 로직 불필요
            dao.insertAuction(auctionDTO);
            log.info("@# ManagerService 경매 항목 삽입 성공");
        } catch (Exception e) {
            log.error("경매 항목 삽입 중 오류 발생: {}", e.getMessage(), e);
            throw e; // 트랜잭션 롤백
        }
    }
}
