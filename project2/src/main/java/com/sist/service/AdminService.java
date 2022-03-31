package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;
import com.sist.vo.OrderDetailVO;
import com.sist.vo.OrderVO;

public interface AdminService {
	public List<GoodsVO> goodsTotalList(Map map);
	public int goodsTotalPage();
	
	
	
	
	/* Order 영역  */
	public List<OrderVO> orderTotalList(Map map);
	public int orderTotalPage();
	public List<OrderDetailVO> orderDetailList(Map map);
    public List<OrderDetailVO> orderDetail(OrderDetailVO vo, int o_id);
	
	
}
