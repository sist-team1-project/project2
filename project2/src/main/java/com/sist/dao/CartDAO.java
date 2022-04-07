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

	public void cartInsert(CartVO vo) {
	    
	    int count = mapper.checkCart(vo);
	    if(count == 0) {
	        mapper.cartInsert(vo);
	    } else {
	        mapper.cartUpdate(vo.getG_quantity());
	    }
	}
	
	public int countCart(String uid) {
	    return mapper.countCart(uid);
	}
	
	public List<Map<String,Object>> cartList(String uid) {
	    return mapper.cartList(uid);
	}
}