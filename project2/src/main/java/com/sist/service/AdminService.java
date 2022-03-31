package com.sist.service;

import java.util.*;

import com.sist.vo.GoodsVO;

public interface AdminService {
	public List<GoodsVO> goodsTotalList(Map map);
	public int goodsTotalPage();
	
}
