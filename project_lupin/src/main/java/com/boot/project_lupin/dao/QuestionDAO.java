package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface QuestionDAO {
	public void insertQuestion(QuestionDTO questionDTO);
}
