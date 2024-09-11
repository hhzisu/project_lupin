package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDTO {
	private int question_id;
	private String question_type;
	private String question_title;
	private String question_content;
	
	private String question_answer;
	
	private int user_id;
	
}

