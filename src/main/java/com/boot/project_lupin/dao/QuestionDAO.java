package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.QuestionAttachDTO;
import com.boot.project_lupin.dto.QuestionDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;


@Mapper
public interface QuestionDAO {
	public void insertQuestion(QuestionDTO questionDTO);
	public ArrayList<QuestionDTO> questionList();

	//파일 업로드
	public void questionInsertFile(QuestionAttachDTO vo);  // 파라미터가 QuestionAttachDTO / 파일추가
	public List<QuestionAttachDTO> questionGetFileList(int question_id); // int타입 question_id파라미터를 list타입 <QuestionAttachDTO> getFileList로 사용하려함 / 파일열람
	public void questionDeleteFile(String question_id);  // question_id 맞춰서 파일삭제로직
}
