package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommissionDTO {

	private int user_id;

	private int commission_id;
	private String commission_email;
	private String commission_phone;
	private String commission_title;
	private String commission_author;
	private String commission_size;
	private String purchasePrice;
	private String commission_collection;
	private String wishPrice;
	private String commission_etc;
	private Date commission_date;

	private List<CommissionAttachDTO> commissionAttachList;  // 파일업로드 attachDTO
}

