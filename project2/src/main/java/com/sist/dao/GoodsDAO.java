package com.sist.dao;

import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class GoodsDAO {

	@Autowired
	private GoodsMapper mapper;

	public List<GoodsVO> goodsList() {
		return mapper.goodsList();
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

	public GoodsVO goodsDetail(Map map) {
		return mapper.goodsDetail(map);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void goodsInsert(GoodsVO vo, int e_id) {

		int g_id = vo.getG_id();
		if (e_id == 0) {
			mapper.goodsInsert(vo, e_id);
		} else {
			EventGoodsVO evo = mapper.eventGoodsData(g_id);
			mapper.goodsEventInsert(evo);
			mapper.goodsInsert(vo, e_id);
		}
	}

}