package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class GoodsServiceImpl implements GoodsService{
    
	@Autowired
	private GoodsDAO gdao;
	
    @Autowired
    private ReviewGoodsDAO rgdao;
    
    
	@Override
	public GoodsVO goodsDetail(int gid) {
		return gdao.goodsDetail(gid);
	}
    
    @Override
    public List<ReviewGoodsVO> reviewList(Map map) {
        return rgdao.reviewList(map);
    }
    
    @Override
    public int reviewListTotalpage(int gid) {
        return rgdao.reviewListTotalpage(gid);
    }
}