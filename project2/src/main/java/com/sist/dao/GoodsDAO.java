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

    public List<Map<String,Object>> goodsList(Map map) {
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

    public GoodsVO goodsDetail(int gid) {
        return mapper.goodsDetail(gid);
    }

    public List<GoodsVO> adminGoodsFind(Map map) {
        return mapper.adminGoodsFind(map);
    }
    
    /*  ------- 상품 등록 -------  */
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void goodsInsert(GoodsVO vo, String eid) {
        
        mapper.goodsInsert(vo); // Insert하고 SelectKey로 vo.g_id에 시퀀스 값을 넣어줌
        
        int gid = vo.getG_id();
        
        if(eid != "") {
            StringTokenizer st = new StringTokenizer(eid,",");
            while(st.hasMoreTokens()){
                EventGoodsVO evo = new EventGoodsVO();
                evo.setE_id(Integer.parseInt(st.nextToken()));
                evo.setG_id(gid);
                
                mapper2.goodsEventInsert(evo);
            }
        }
    }
    
    /* ---------------------- 관리자 상품 수정  ----------------------------  */
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void goodsUpdate(GoodsVO vo, String eid) {
        mapper.goodsupdate(vo);
        int g_id = vo.getG_id();

        if (eid != "") {
        	StringTokenizer st = new StringTokenizer(eid,",");
            while(st.hasMoreTokens()){
                EventGoodsVO evo = new EventGoodsVO();
                evo.setE_id(Integer.parseInt(st.nextToken()));
                evo.setG_id(g_id);
                int eg_id = mapper2.goodsEGidData(evo);
                mapper2.goodsEventUpdate(evo, eg_id);
            }
        }
    }
    public List<EventGoodsVO> goodsEidData(int g_id) {
        return mapper2.goodsEidData(g_id);
    }
}