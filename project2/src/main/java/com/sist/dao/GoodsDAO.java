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
	public String goodsMaxPrice(String cid) {
		return mapper.goodsMaxPrice(cid);
	}

	public List<Map<String, Object>> goodsList(Map map) {
		return mapper.goodsList(map);
	}

	public int goodsListTotalpage(Map map) {
		return mapper.goodsListTotalpage(map);
	}

	public List<String> brandList(String cid) {
		return mapper.brandList(cid);
	}
	/*  --------------------------  */

	/*  ------- 제품 상세 -------  */
	public int goodsStatus(int gid) {
		return mapper.goodsStatus(gid);
	}

	public Map<String, Object> goodsDetail(Map map) {
		return mapper.goodsDetail(map);
	}
	/*  --------------------------  */

	/*  ------- 관리자  -------  */
	public List<Map<String, Object>> adminGoodsFind(Map map) {
		return mapper.adminGoodsFind(map);
	}

	public int adminGoodsTotalPage(Map map) {
		return mapper.adminGoodsTotalPage(map);
	}

	public int adminGoodsCount() {
		return mapper.adminGoodsCount();
	}

	/*  --------------------------  */
	public GoodsVO adminGoodsDetail(int gid) {
		return mapper.adminGoodsDetail(gid);
	}

	/*  ------- 상품 등록 -------  */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void goodsInsert(GoodsVO vo, String eid) {

		mapper.goodsInsert(vo); // Insert하고 SelectKey로 vo.g_id에 시퀀스 값을 넣어줌
		
		int gid = vo.getG_id();
		
		if (eid != "") {
            StringTokenizer st = new StringTokenizer(eid, ",");
            while (st.hasMoreTokens()) {
                EventGoodsVO evo = new EventGoodsVO();
                evo.setE_id(Integer.parseInt(st.nextToken()));
                evo.setG_id(gid);
                
                mapper2.goodsEventInsert(evo);
            }
        }
	}

	/* ---------------------- 관리자 상품 수정  ----------------------------  */
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void goodsUpdate(GoodsVO vo, List<Integer> eid) {
		mapper.goodsupdate(vo);
        int gid = vo.getG_id();
        
        if (mapper2.countEvent(gid) > 0) {
            mapper2.goodsEventDelete(gid);
        }
        
        if (eid != null) {
        	for(int i : eid) {
        	    EventGoodsVO evo = new EventGoodsVO();
                evo.setE_id(i);
                evo.setG_id(gid);
                
                mapper2.goodsEventInsert(evo);
        	}
        }
	}

	public List<EventGoodsVO> goodsEidData(int g_id) {
		return mapper2.goodsEidData(g_id);
	}

	/* ---------------------- 결제 페이지  ----------------------------  */
	public List<Map<String, Object>> checkOutGoodsDetail(Map map) {
		return mapper.checkOutGoodsDetail(map);
	}
}