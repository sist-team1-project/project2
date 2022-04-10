package com.sist.service;

import java.util.*;

import com.sist.vo.*;

public interface GoodsService {
    
	public Map<String,Object> goodsDetail(Map map);
    public List<ReviewGoodsVO> reviewList(Map map);
    public int reviewListTotalpage(int gid);
}