package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionScheduleDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;


@Mapper
public interface ManagerDAO {
	public void insertSchedule(AuctionScheduleDTO auctionScheduleDTO);
	public ArrayList<AuctionScheduleDTO> scheduleList();
}
