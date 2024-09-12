package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.CommissionDAO;
import com.boot.project_lupin.dto.CommissionAttachDTO;
import com.boot.project_lupin.dto.CommissionDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

        //첨부파일 있는지 체크
        log.info("@# questionDTO.getQuestionAttachList()=>"+commissionDTO.getCommissionAttachList());
        if (commissionDTO.getCommissionAttachList() == null || commissionDTO.getCommissionAttachList().size() == 0) {
            log.info("@# null");
            return;
        }

        //첨부파일이 있는 경우 처리
        commissionDTO.getCommissionAttachList().forEach(attach -> {
            attach.setCommission_id(commissionDTO.getCommission_id());
            dao.commissionInsertFile(attach);
        });
    }


    //파일 리스트 가져오기
    public List<CommissionAttachDTO> commissionGetFileList(int commission_id){
        log.info("@# QuestionService questionGetFileList");

        CommissionDAO dao = sqlSession.getMapper(CommissionDAO.class);

        return dao.commissionGetFileList(commission_id);
    }
}
