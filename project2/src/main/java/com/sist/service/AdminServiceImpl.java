package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.*;
import com.sist.vo.*;

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

	@Override
	public List<OrderVO> orderTotalList(Map map) {
		return odao.orderTotalList(map);
	}

	@Override
	public int orderTotalPage() {
		return odao.orderTotalPage();
	}

	@Override
	public List<OrderDetailVO> orderDetailList(Map map) {
		return oddao.orderDetailList(map);
	}

	@Override
	public List<OrderDetailVO> orderDetail(OrderDetailVO vo, int o_id) {
		return oddao.orderDetail(vo, o_id);
	}
	
}
