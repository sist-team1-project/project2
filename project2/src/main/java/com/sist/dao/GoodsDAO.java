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

	@Autowired
	private EventGoodsMapper mapper2;

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
		mapper.goodsInsert(vo);
		int g_id = mapper.goodsCount();

		if (e_id != 0) {
			EventGoodsVO evo = new EventGoodsVO();
			evo.setE_id(e_id);
			evo.setG_id(g_id);
			mapper2.goodsEventInsert(evo);
		}
	}

	public List<GoodsVO> adminGoodsFind(Map map) {
		return mapper.adminGoodsFind(map);
	}

	//	public GoodsVO goods_UpdateData(int no) {
	//		return "";
	//	}

}