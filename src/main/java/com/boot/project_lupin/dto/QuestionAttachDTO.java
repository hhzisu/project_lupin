package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionAttachDTO {
    // 파일업로드
    private int question_id;
    private String uuid; // uuid
    private String uploadPath;  // 경로
    private String fileName; // 파일이름
    private boolean image; // 이미지구분여부 (필요x)

}
