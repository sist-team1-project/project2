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
    
    public List<OrderVO> orderList(Map map){
    	return mapper.orderList(map);
    }
    public int orderTotalPage(Map map) {
    	return mapper.orderTotalPage(map);
    }
    public int orderCount() {
    	return mapper.orderCount();
    }
    public OrderVO order(String oid){
    	return mapper.order(oid);
    }
}