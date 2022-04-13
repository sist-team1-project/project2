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
    private OrderMapper omapper;
    
    @Autowired
    private OrderDetailMapper odmapper;
    
    @Autowired
    private CartMapper cmapper;
    
    public int orderTotalPage(Map map) {
    	return omapper.orderTotalPage(map);
    }
    public int orderCount(Map map) {
    	return omapper.orderCount(map);
    }
	
	public OrderVO order(String oid){
		return omapper.order(oid);
	}
	 
    public List<Map<String,Object>> orderFullList(Map map) {
    	return omapper.orderFullList(map);
    }
    
    public int stateupdate(Map map) {
    	return omapper.stateupdate(map);
    }
    
    /* 유저 주문정보 */
    public List<OrderVO> orderInfoList(Map map) {
    	return omapper.orderInfoList(map);
    }
    
    public int userOrderTotalPage(Map map) {
    	return omapper.userOrderTotalPage(map);
    }
    
    public int userOrderCount(Map map) {
    	return omapper.userOrderCount(map);
    }
    public int userOrderCancel(Map map) {
    	return omapper.userOrderCancel(map);
    }
    
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void orderInsert(OrderVO ovo, OrderDetailVO list) {
        omapper.orderInsert(ovo);
        
        Map map = new HashMap();
        map.put("uid", ovo.getU_id());
        
        for (int i = 0; i < list.getOrderDetailVOList().size(); i++) {
            OrderDetailVO odvo = new OrderDetailVO();
            odvo.setO_id(ovo.getO_id());
            odvo.setG_id(list.getOrderDetailVOList().get(i).getG_id());
            odvo.setG_name(list.getOrderDetailVOList().get(i).getG_name());
            odvo.setG_price(list.getOrderDetailVOList().get(i).getG_price());
            odvo.setG_sale(list.getOrderDetailVOList().get(i).getG_sale());
            odvo.setG_quantity(list.getOrderDetailVOList().get(i).getG_quantity());
            odmapper.orderDetailInsert(odvo);
            
            
            map.put("gid", list.getOrderDetailVOList().get(i).getG_id());
            cmapper.cartDeleteByGidAndUid(map);
        }
    }
}