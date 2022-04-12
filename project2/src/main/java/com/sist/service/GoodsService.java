package com.sist.service;

import java.util.*;

import com.sist.vo.*;

public interface GoodsService {
    
    public int goodsStatus(int gid);
	public Map<String,Object> goodsDetail(Map map);
    public List<ReviewGoodsVO> reviewList(Map map);
    public int reviewListTotalpage(int gid);
}