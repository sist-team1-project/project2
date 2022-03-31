package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;
import com.sist.vo.OrderVO;

public interface AdminService {
	public List<GoodsVO> goodsTotalList(Map map);
	public int goodsTotalPage();
	public List<OrderVO> orderTotalList(Map map);
	public int orderTotalPage();
	
}
