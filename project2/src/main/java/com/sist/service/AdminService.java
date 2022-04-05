package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderVO;

public interface AdminService {
	
	public List<GoodsVO> goodsTotalList(Map map);
	public int goodsTotalPage();
	
	public List<OrderVO> orderList(Map map);
	public int orderTotalPage();
	public List<OrderDetailVO> orderDetailList(Map map);
	List<OrderDetailVO> orderDetail(String oid);
	List<String> nameData(String oid);
}
