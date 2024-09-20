package com.boot.project_lupin.service;

import com.boot.project_lupin.dao.WishDAO;
import com.boot.project_lupin.dto.WishDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("WishService")
public class WishService {
	@Autowired
	private SqlSession sqlSession;

	public void wishInsert(WishDTO wishDTO) {
		log.info("@# WishService wishInsert");
		WishDAO dao = sqlSession.getMapper(WishDAO.class);
		// 위시가 이미 눌려 있는지 확인
		if (dao.wishState(wishDTO) == 0) {
			dao.wishInsert(wishDTO);  // 위시 추가
		}
	}

	public void wishDelete(WishDTO wishDTO) {
		WishDAO dao = sqlSession.getMapper(WishDAO.class);
		// 위시가 눌려 있는 경우에만 삭제
		if (dao.wishState(wishDTO) > 0) {
			dao.wishDelete(wishDTO);  // 위시 삭제
		}
	}

	public boolean wishState(WishDTO wishDTO) {
		WishDAO dao = sqlSession.getMapper(WishDAO.class);
		return dao.wishState(wishDTO) > 0;  // 사용자가 위시를 눌렀는지 확인
	}

}

