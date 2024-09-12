package com.boot.project_lupin.service;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("AuctionService")
public class AuctionService {
	@Autowired
	private SqlSession sqlSession;
}

