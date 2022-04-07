package com.sist.service;

import java.util.*;

import com.sist.vo.*;
import com.sist.dao.*;

public interface ListService {
    
    public int goodsMaxPrice(String cid);
    public List<GoodsVO> goodsList(Map map);
    public int goodsListTotalpage(Map map);
    public List<String> brandList(String cid);
    public List<CategoryVO> categoryList_1();
    public List<CategoryVO> categoryList_2();
    public String categoryName(String cid);
}