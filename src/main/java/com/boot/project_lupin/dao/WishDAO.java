package com.boot.project_lupin.dao;

import com.boot.project_lupin.dto.WishDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface WishDAO {
    public void wishInsert(WishDTO wishDTO);
    public void wishDelete(WishDTO wishDTO);
    public int wishState(WishDTO wishDTO);
}
