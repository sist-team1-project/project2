package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class OrderDetailDAO {
    @Autowired
    private OrderDetailMapper mapper;
    
    public List<OrderDetailVO> orderDetailList(Map map) {
    	return mapper.orderDetailList(map);
    }
    public List<OrderDetailVO> orderListDetail() {
    	return mapper.orderListDetail();
    }
    public List<String> nameData(String oid) {
    	return mapper.nameData(oid);
    }
    public List<OrderDetailVO> orderDetail(String oid){
    	return mapper.orderDetail(oid);
    }

}
