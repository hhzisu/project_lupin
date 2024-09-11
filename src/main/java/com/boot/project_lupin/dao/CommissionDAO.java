package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.CommissionDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommissionDAO {
	public void insertCommission(CommissionDTO commissionDTO);
}
