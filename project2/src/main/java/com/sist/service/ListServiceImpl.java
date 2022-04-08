package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.vo.*;
import com.sist.dao.*;

@Service
public class ListServiceImpl implements ListService {
    
    @Autowired
    private GoodsDAO gdao;
    
    @Autowired
    private CategoryDAO cdao;
    
    @Autowired
    private LikeDAO ldao;
    
    @Override
    public int goodsMaxPrice(String cid) {
        return gdao.goodsMaxPrice(cid);
    }
    
    @Override
    public List<Map<String,Object>> goodsList(Map map) {
        // TODO Auto-generated method stub
        return gdao.goodsList(map);
    }
    
    @Override
    public int goodsListTotalpage(Map map) {
        return gdao.goodsListTotalpage(map);
    }
    
    @Override
    public List<String> brandList(String cid) {
        return gdao.brandList(cid);
    }
    
    @Override
    public String categoryName(String cid) {
        return cdao.categoryName(cid);
    }
    
    @Override
    public void likeInsert(LikeVO vo) {
        ldao.likeInsert(vo);
    }
    
    @Override
    public void likeDelete(LikeVO vo) {
        ldao.likeDelete(vo);
    }
}