package com.sist.dao;

import java.util.*;

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

	public List<GoodsVO> goodsList(Map map) {
		return mapper.goodsList(map);
	}

	public int goodsListTotalpage(Map map) {
		return mapper.goodsListTotalpage(map);
	}

	public List<String> brandList(Map map) {
		return mapper.brandList(map);
	}

	public List<GoodsVO> goodsTotalList(Map map) {
		return mapper.goodsTotalList(map);
	}

	public int goodsTotalPage(Map map) {
		return mapper.goodsTotalPage(map);
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

	public List<GoodsVO> adminGoodsFind(Map map) {
		return mapper.adminGoodsFind(map);
	}

}