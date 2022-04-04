package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.dao.*;
import com.sist.vo.*;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private GoodsDAO gdao;
	
	@Autowired 
	private OrderDAO odao;

	@Autowired
	private OrderDetailDAO oddao;
	
	@Override
	public List<GoodsVO> goodsTotalList(Map map) {
		return gdao.goodsTotalList(map);
	}

	@Override
	public int goodsTotalPage() {
		return gdao.goodsTotalPage();
	}
	
	/*********************************************/
	@Override
	public List<OrderDetailVO> orderDetailList(Map map) {
		return oddao.orderDetailList(map);
	}
	
	@Override
	public List<OrderDetailVO> orderDetail(String oid) {
		return oddao.orderDetail(oid);
	}

	@Override
	public List<String> nameData(String oid) {
		return oddao.nameData(oid);
	}


	
}