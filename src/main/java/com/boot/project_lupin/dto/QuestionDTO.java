package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDTO {
	private int question_id;
	private String question_type;
	private String question_title;
	private String question_content;
	private String question_date;

	private String question_answer;
	
	private int user_id;

	private int id;
	private String email;

	private List<QuestionAttachDTO> QuestionAttachList;  // 파일업로드 attachDTO를 가져와서 attachList에 담음
	
}

