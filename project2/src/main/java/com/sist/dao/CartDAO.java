package com.sist.dao;

import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class CartDAO {

	@Autowired
	private CartMapper mapper;

	
	public void cartInsert(CartVO vo) {
		mapper.cartInsert(vo);
	}
}