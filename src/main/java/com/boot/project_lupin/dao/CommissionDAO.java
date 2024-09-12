package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.CommissionAttachDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface CommissionDAO {
	public void insertCommission(CommissionDTO commissionDTO);
	public ArrayList<CommissionDTO> commissionList();

	//파일 업로드
	public void commissionInsertFile(CommissionAttachDTO attachDTO);
	public List<CommissionAttachDTO> commissionGetFileList(int commission_id);
}
