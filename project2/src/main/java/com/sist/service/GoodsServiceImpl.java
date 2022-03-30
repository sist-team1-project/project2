package com.sist.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.GoodsDAO;
import com.sist.vo.GoodsVO;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO gdao;

	
	@Override
	public GoodsVO goodsDetail(Map map) {
		return gdao.goodsDetail(map);
	}



}
