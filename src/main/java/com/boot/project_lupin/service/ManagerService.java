package com.boot.project_lupin.service;

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
        ArrayList<AuctionScheduleDTO> scheduleList = dao.scheduleList();
        return scheduleList;
    }

    // 일정 삭제 메서드
    public void scheduleDelete(String auctionSchedule_id) {
        log.info("@# ManagerService scheduleDelete");
        log.info("@# ManagerService auctionSchedule_id => {}", auctionSchedule_id);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        dao.scheduleDelete(auctionSchedule_id);
        log.info("@# ManagerService 일정 삭제 성공");
    }

    // 위탁 리스트 조회 메서드
    public ArrayList<CommissionDTO> commissionList() {
        log.info("@# ManagerService commissionList");
        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        ArrayList<CommissionDTO> commissionList = dao.commissionList();
        return commissionList;
    }

    public void insertAuction(AuctionDTO auctionDTO) {
        log.info("@# ManagerService insertAuction");

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);

        // 1. 경매 항목을 auction_tb에 먼저 삽입
        dao.insertAuction(auctionDTO);
        log.info("@# ManagerService 경매 항목 삽입 성공");

        // 2. MyBatis가 설정한 자동 증가된 auction_id 가져오기
        int auctionId = auctionDTO.getAuction_id(); // MyBatis가 자동으로 생성한 값을 가져옴
        log.info("@# 생성된 auction_id => {}", auctionId);

        // 3. auctionAttachList1(파일 리스트 1)이 있는지 확인하고 첨부파일 삽입
        if (auctionDTO.getAuctionAttachList1() != null && !auctionDTO.getAuctionAttachList1().isEmpty()) {
            auctionDTO.getAuctionAttachList1().forEach(attach -> {
                attach.setAuction_id(auctionId); // 생성된 auction_id 설정
                dao.auctionInsertFile1(attach);  // 첨부 파일을 auction_attach1 테이블에 삽입
            });
        }

        // 4. auctionAttachList2(파일 리스트 2)가 있는지 확인하고 첨부파일 삽입
        if (auctionDTO.getAuctionAttachList2() != null && !auctionDTO.getAuctionAttachList2().isEmpty()) {
            auctionDTO.getAuctionAttachList2().forEach(attach -> {
                attach.setAuction_id(auctionId); // 생성된 auction_id 설정
                dao.auctionInsertFile2(attach);  // 첨부 파일을 auction_attach2 테이블에 삽입
            });
        }
    }




    //AuctionAttach1DTO 리스트 가져오기
    public List<AuctionAttach1DTO> auctionGetFileList1(int auction_id){
        log.info("@# ManagerService auctionGetFileList1");

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);

        return dao.auctionGetFileList1(auction_id);
    }

    //AuctionAttach2DTO 리스트 가져오기
    public List<AuctionAttach2DTO> auctionGetFileList2(int auction_id){
        log.info("@# ManagerService auctionGetFileList2");

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);

        return dao.auctionGetFileList2(auction_id);
    }

    //파일 삭제
    public void auctionDeleteFile1(List<AuctionAttach1DTO> fileList) {
        if (fileList == null || fileList.size() == 0) {
            return;
        }

        fileList.forEach(attach -> {
            try {
                // 프로젝트 내부의 업로드 경로 설정
                Path file = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/"
                        + attach.getUuid() + "_" + attach.getFileName());
                Files.deleteIfExists(file);  // 파일이 있으면 삭제

                // 이미지 파일이면 썸네일도 삭제
                if (Files.probeContentType(file).startsWith("image")) {
                    Path thumbNail = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/s_"
                            + attach.getUuid() + "_" + attach.getFileName());
                    Files.deleteIfExists(thumbNail);  // 썸네일 삭제
                }
            } catch (Exception e) {
                log.error("delete file error: " + e.getMessage());
            }
        });
    }
    //파일 삭제
    public void auctionDeleteFile2(List<AuctionAttach2DTO> fileList) {
        if (fileList == null || fileList.size() == 0) {
            return;
        }

        fileList.forEach(attach -> {
            try {
                // 프로젝트 내부의 업로드 경로 설정
                Path file = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/"
                        + attach.getUuid() + "_" + attach.getFileName());
                Files.deleteIfExists(file);  // 파일이 있으면 삭제

                // 이미지 파일이면 썸네일도 삭제
                if (Files.probeContentType(file).startsWith("image")) {
                    Path thumbNail = Paths.get(servletContext.getRealPath("/upload/") + attach.getUploadPath() + "/s_"
                            + attach.getUuid() + "_" + attach.getFileName());
                    Files.deleteIfExists(thumbNail);  // 썸네일 삭제
                }
            } catch (Exception e) {
                log.error("delete file error: " + e.getMessage());
            }
        });
    }
}
