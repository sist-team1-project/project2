package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class OrderDAO {

    @Autowired
    private OrderMapper mapper;
    
    public int orderTotalPage() {
    	return mapper.orderTotalPage();
    }
    public int orderCount() {
    	return mapper.orderCount();
    }
	
	public OrderVO order(String oid){
		return mapper.order(oid);
	}
	 
    public List<Map<String,Object>> orderFullList(Map map) {
    	return mapper.orderFullList(map);
    }
    
    public int stateupdate(Map map) {
    	return mapper.stateupdate(map);
    }
    
}