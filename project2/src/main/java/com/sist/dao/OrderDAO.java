package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class OrderDAO {

    @Autowired
    private OrderMapper mapper;
    
    @Autowired
    private OrderDetailMapper mapper2;
    
    public int orderTotalPage(Map map) {
    	return mapper.orderTotalPage(map);
    }
    public int orderCount(Map map) {
    	return mapper.orderCount(map);
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
    
    /* 유저 주문정보 */
    public List<OrderVO> orderInfoList(Map map) {
    	return mapper.orderInfoList(map);
    }
    
    public int userOrderTotalPage(Map map) {
    	return mapper.orderTotalPage(map);
    }
    
    public int userOrderCount() {
    	return mapper.userOrderCount();
    }
    public int userOrderCancel(Map map) {
    	return mapper.userOrderCancel(map);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void orderInsert(OrderVO ovo, OrderDetailVO list) {
        mapper.orderInsert(ovo);
        
        for (int i = 0; i < list.getOrderDetailVOList().size(); i++) {
            OrderDetailVO odvo = new OrderDetailVO();
            odvo.setO_id(ovo.getO_id());
            odvo.setG_id(list.getOrderDetailVOList().get(i).getG_id());
            odvo.setG_name(list.getOrderDetailVOList().get(i).getG_name());
            odvo.setG_price(list.getOrderDetailVOList().get(i).getG_price());
            odvo.setG_sale(list.getOrderDetailVOList().get(i).getG_sale());
            odvo.setG_quantity(list.getOrderDetailVOList().get(i).getG_quantity());
            mapper2.orderDetailInsert(odvo);
        }
    }
}