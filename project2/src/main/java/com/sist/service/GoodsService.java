package com.sist.service;

import java.util.*;

import com.sist.vo.*;

public interface GoodsService {
    
	public GoodsVO goodsDetail(int gid);
    public List<ReviewGoodsVO> reviewList(Map map);
    public int reviewListTotalpage(int gid);
}