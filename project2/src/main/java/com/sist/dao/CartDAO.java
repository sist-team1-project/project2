package com.sist.dao;

import java.util.List;
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
	
	@Autowired
	private GoodsMapper gmapper;
	
	public void cartInsert(CartVO vo) {
	    int stock = gmapper.checkCart(vo.getG_id());
	    
	    if(stock == 0) mapper.cartInsert(vo);
	    else mapper.cartUpdate(vo);
	}
	
	public void cartDelete(int cid) {
	    mapper.cartDelete(cid);
	}
	
	public int countCart(String uid) {
	    return mapper.countCart(uid);
	}
	
	public List<Map<String,Object>> cartList(String uid) {
	    return mapper.cartList(uid);
	}
}