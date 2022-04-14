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
	
	public String cartInsert(CartVO vo) {
	    int count = mapper.checkCart(vo);
	    String result = "";
	    if(count == 0) {
	        mapper.cartInsert(vo);
	        result = "ADD";
	    }
	    else {
	        mapper.cartUpdate(vo);
	        result = "UPDATE";
	    }
	    return result;
	}
	
	public void cartDelete(int cid) {
	    mapper.cartDelete(cid);
	}
	
	public int countCart(String uid) {
	    return mapper.countCart(uid);
	}
	
	public void cartNumUpdate(Map map) {
        mapper.cartNumUpdate(map);
    }
	
	public List<Map<String,Object>> cartList(String uid) {
	    return mapper.cartList(uid);
	}
}