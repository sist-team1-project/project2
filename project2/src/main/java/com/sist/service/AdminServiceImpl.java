package com.sist.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;

import com.sist.dao.*;
import com.sist.vo.*;

public class AdminServiceImpl implements AdminService {
	@Autowired
	private GoodsDAO gdao;

	@Override
	public List<GoodsVO> goodsTotalList(Map map) {
		return gdao.goodsTotalList(map);
	}

	@Override
	public int goodsTotalPage() {
		// TODO Auto-generated method stub
		return gdao.goodsTotalPage();
	}

}
