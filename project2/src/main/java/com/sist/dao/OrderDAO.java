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
    
    public List<OrderVO> orderTotalList(Map map){
    	return mapper.orderTotalList(map);
    }
    public int orderTotalPage() {
    	return mapper.orderTotalPage();
    }
    public int orderCount() {
    	return mapper.orderCount();
    }
}