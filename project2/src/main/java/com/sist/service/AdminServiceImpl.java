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
	public int orderTotalPage(Map map) {
		return odao.orderTotalPage(map);
	}

	@Override
	public List<OrderDetailVO> orderListDetail() {
		return oddao.orderListDetail();
	}

	@Override
	public List<Map<String, Object>> orderFullList(Map map) {
		return odao.orderFullList(map);
	}
}