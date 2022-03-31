package com.sist.service;

import java.util.*;

import com.sist.vo.*;
import com.sist.dao.*;

public interface ListService {
    
    public List<GoodsVO> goodsList(Map map);
    public int goodsListTotalpage(String keyword);
}