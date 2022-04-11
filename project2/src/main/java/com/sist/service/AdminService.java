package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderVO;

public interface AdminService {
		
	public int orderTotalPage(Map map);
	public List<Map<String,Object>> orderFullList(Map map);
	public List<OrderDetailVO> orderDetailList(Map map);
	public List<OrderDetailVO> orderListDetail();
	List<OrderDetailVO> orderDetail(String oid);
}
