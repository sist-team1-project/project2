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
    
    @Autowired
    private GoodsMapper gmapper;
    
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
    
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void stateupdate(int state, String oid) {
        
        int dbState = omapper.getDBOrderState(oid);
        
        // 상태가 -1이면 판매량 감소, 취소에서 복구됐으면 판매량 다시 증가
        if(state == -1) {
            List<Map<String,Object>> list = odmapper.getGidsFromOrder(oid);
            for(Map<String,Object> i : list) {
                Map map2 = new HashMap();
                map2.put("g_id", i.get("G_ID"));
                map2.put("g_quantity", i.get("G_QUANTITY"));
                gmapper.decreaseSold(map2);
            }
        } else if (dbState == -1) {
            List<Map<String,Object>> list = odmapper.getGidsFromOrder(oid);
            for(Map<String,Object> i : list) {
                Map map2 = new HashMap();
                map2.put("g_id", i.get("G_ID"));
                map2.put("g_quantity", i.get("G_QUANTITY"));
                gmapper.increaseSold(map2);
            }
        }
        Map map = new HashMap();
        map.put("state",state);
        map.put("oid",oid);
        omapper.stateupdate(map);
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
    
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void userOrderCancel(Map map) {
        
        // 판매량 감소
        List<Map<String,Object>> list = odmapper.getGidsFromOrder((String)map.get("oid"));
        for(Map<String,Object> i : list) {
            Map map2 = new HashMap();
            map2.put("g_id", i.get("G_ID"));
            map2.put("g_quantity", i.get("G_QUANTITY"));
            gmapper.decreaseSold(map2);
        }
        // 주문 취소
    	omapper.userOrderCancel(map);
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
            // 판매량 증가
            Map map2 = new HashMap();
            map2.put("g_id", list.getOrderDetailVOList().get(i).getG_id());
            map2.put("g_quantity", list.getOrderDetailVOList().get(i).getG_quantity());
            gmapper.increaseSold(map2);
            
            map.put("gid", list.getOrderDetailVOList().get(i).getG_id());
            cmapper.cartDeleteByGidAndUid(map);
        }
    }
}