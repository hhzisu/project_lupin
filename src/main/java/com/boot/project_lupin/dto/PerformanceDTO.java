package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PerformanceDTO {

    private String title;       // 공연/전시 제목
    private String startDate;   // 시작일
    private String endDate;     // 종료일
    private String place;       // 장소
    private String thumbnail;   // 썸네일 이미지 URL
}
