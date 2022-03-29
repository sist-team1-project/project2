package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class GoodsDAO {

	@Autowired
	private GoodsMapper mapper;

	public List<GoodsVO> goodsTemp(Map map) {
		return mapper.goodsTemp(map);
	}

	public List<GoodsVO> goodsTotalList(Map map) {
		return mapper.goodsTotalList(map);
	}

	public int goodsTotalPage() {
		return mapper.goodsTotalPage();
	}

	public int goodsCount() {
		return mapper.goodsCount();
	}

}