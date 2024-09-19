package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserInfoDAO {

	public UserInfoDTO selectUserInfo(String username); // 로그인된 유저 정보 가져옴

}
