package com.boot.project_lupin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoDTO {

	private int id;
	private String birthday;
	private String birthyear;
	private String email;
	private String gender;
	private String mobile;
	private String name;
	private String role;

	private String username;

	private String postcode;
	private String roadAddress;
	private String detailAddress;

	private String adminPw;
}

