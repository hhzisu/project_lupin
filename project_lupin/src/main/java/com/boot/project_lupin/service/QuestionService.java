package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.QuestionDAO;
import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("QuestionService")
public class QuestionService{
	@Autowired
	private SqlSession sqlSession;

	public void insertQuestion(QuestionDTO questionDTO) {
		log.info("@# QuestionServiceImpl insertQuestion");
		
		QuestionDAO dao = sqlSession.getMapper(QuestionDAO.class);
		dao.insertQuestion(questionDTO);

	}


}

