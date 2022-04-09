package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderVO;

public interface AdminService {
	
	public List<GoodsVO> goodsTotalList(Map map);
	
	public List<OrderVO> orderList(Map map);
	public int orderTotalPage();
	public List<OrderDetailVO> orderDetailList(Map map);
	public List<OrderDetailVO> orderListDetail();
	List<OrderDetailVO> orderDetail(String oid);
	public List<Map<String,Object>> orderFullList(Map map);
}
