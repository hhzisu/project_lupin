package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.AuctionBidDTO;
import com.boot.project_lupin.dto.AuctionDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface UserWishListDAO {

    public List<AuctionDTO> getUserWishList(int userId); // 응찰 작품 정보
}
