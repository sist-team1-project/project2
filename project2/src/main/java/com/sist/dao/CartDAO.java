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
	    String result = "";
	    int stock = gmapper.countGoodsStock(vo.getG_id());
	    int quantity = vo.getG_quantity();
	    System.out.println("수량: " + quantity);
	    if(quantity <= stock) {
	        int count = mapper.checkCart(vo);
	        if(count == 0) {
	            mapper.cartInsert(vo);
	            result = "YES";
	        } else {
	            if ((count + quantity) > stock) {
	                vo.setG_quantity(stock - count);
	                result = Integer.toString(stock - count);
	                mapper.cartUpdate(vo);
	            } else {
	                result = "YES";
	                mapper.cartUpdate(vo);
	            }
	        }
	    }
	    System.out.println(result);
	    return result;
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