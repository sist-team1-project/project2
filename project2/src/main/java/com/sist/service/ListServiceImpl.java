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
    
    @Override
    public List<GoodsVO> goodsList(Map map) {
        // TODO Auto-generated method stub
        return gdao.goodsList(map);
    }
    
    @Override
    public int goodsListTotalpage(Map map) {
        return gdao.goodsListTotalpage(map);
    }
    
    @Override
    public List<CategoryVO> categoryList_1() {
        return cdao.categoryList_1();
    }
    @Override
    public List<CategoryVO> categoryList_2() {
        return cdao.categoryList_2();
    }
}