package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.CommissionDAO;
import com.boot.project_lupin.dao.ManagerDAO;
import com.boot.project_lupin.dto.AuctionScheduleDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class ManagerService {

    @Autowired
    private SqlSession sqlSession;

    public void insertSchedule(AuctionScheduleDTO auctionScheduleDTO) {
        log.info("@# ManagerService insertSchedule");
        log.info("@# ManagerService auctionScheduleDTO=>"+auctionScheduleDTO);

        ManagerDAO dao = sqlSession.getMapper(ManagerDAO.class);
        dao.insertSchedule(auctionScheduleDTO);
    }

    public ArrayList<AuctionScheduleDTO> scheduleList() {
        log.info("@# ManagerService scheduleList");
     ManagerDAO dao =sqlSession.getMapper(ManagerDAO.class);
     ArrayList<AuctionScheduleDTO> scheduleList = dao.scheduleList();
     return scheduleList;
    }
}
