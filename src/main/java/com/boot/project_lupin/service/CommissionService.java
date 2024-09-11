package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.CommissionDAO;
import com.boot.project_lupin.dto.CommissionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class CommissionService {

    @Autowired
    private SqlSession sqlSession;

    public void insertCommission(CommissionDTO commissionDTO) {
        log.info("@# CommissionService insertCommission");
        log.info("@# CommissionService commissionDTO=>"+commissionDTO);

        CommissionDAO dao = sqlSession.getMapper(CommissionDAO.class);
        dao.insertCommission(commissionDTO);
    }
}
