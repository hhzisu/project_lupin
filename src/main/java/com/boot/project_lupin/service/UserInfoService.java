package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.AuctionDAO;
import com.boot.project_lupin.dao.UserInfoDAO;
import com.boot.project_lupin.dto.AuctionDTO;
import com.boot.project_lupin.dto.UserInfoDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class UserInfoService {

	@Autowired
	private SqlSession sqlSession;

//	로그인 유저 정보 가져옴
	public UserInfoDTO selectUserInfo(String username){
		log.info("@# UserInfoService selectUserInfo");
		log.info("@# username=>"+username);
		log.info("@# username => {}", username);

		try {
			UserInfoDAO dao = sqlSession.getMapper(UserInfoDAO.class);
			return dao.selectUserInfo(username);
		} catch (Exception e) {
			log.error("Error fetching user info for username: {}", username, e);
			return null; // 또는 기본 값을 반환하거나 적절한 예외 처리를 진행
		}
	}
}

