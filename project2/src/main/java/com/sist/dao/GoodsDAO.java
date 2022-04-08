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
	
	/*  ------- 리스트 페이지 -------  */
	public int goodsMaxPrice(String cid) {
		return mapper.goodsMaxPrice(cid);
	}

	public List<GoodsVO> goodsList(Map map) {
		return mapper.goodsList(map);
	}

	public int goodsListTotalpage(Map map) {
		return mapper.goodsListTotalpage(map);
	}
	
	public List<String> brandList(String cid) {
		return mapper.brandList(cid);
	}
	/*  --------------------------  */
	
	public List<GoodsVO> goodsTotalList(Map map) {
		return mapper.goodsTotalList(map);
	}

	public int goodsTotalPage(Map map) {
		return mapper.goodsTotalPage(map);
	}

	public int goodsCount() {
		return mapper.goodsCount();
	}

	public GoodsVO goodsDetail(String gid) {
		return mapper.goodsDetail(gid);
	}
	
	public void goodsEventInsert(EventGoodsVO vo) {
		mapper2.goodsEventInsert(vo);
	}
	
	public void goodsInsert(GoodsVO vo) {
		mapper.goodsInsert(vo);
	}

	public List<GoodsVO> adminGoodsFind(Map map) {
		return mapper.adminGoodsFind(map);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void goodsUpdate(GoodsVO vo, int e_id) {
		mapper.goodsupdate(vo);
		int g_id = vo.getG_id();

		if (e_id != 0) {
			EventGoodsVO evo = new EventGoodsVO();
			evo.setE_id(e_id);
			evo.setG_id(g_id);
			int eg_id = mapper2.goodsEGidData(evo);
			mapper2.goodsEventUpdate(evo, eg_id);
		}
	}
	
	public int goodsEidData(String g_id) {
		return mapper2.goodsEidData(g_id);
	}
}