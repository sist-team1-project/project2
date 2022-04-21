package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderDetailMapper {
	/* 주문상세 + 주문  */
    @Select("SELECT * FROM (SELECT order.o_id, u_id, o_receiver, o_phone, o_post, o_address1, o_address2, o_request, "
    		+"o_regdate, o_shipping, o_state, od_id, g_id, g_name, g_price, g_sale, g_quantity, rownum as num "
    		+"FROM order JOIN order_detail "
    		+"ON order.o_id = order_detail.o_id " 
    		+"WHERE o_id=#{oid})")
    public List<OrderDetailVO> orderDetailList(Map map);
    
    /* 주문목록 상세 */
    @Select("SELECT /*+ INDEX_ASC(order_detail od_od_id_pk)*/ o_id,g_name,g_price,g_quantity "
    		+"FROM order_detail ")
    public List<OrderDetailVO> orderListDetail(); 
    
    /* 상품명 */
    @Select("SELECT g_name "
    		+"FROM order_detail "
    		+"WHERE o_id=#{oid}")    
    public List<String> nameData(String oid);
    
    /* 주문 상세 - 사용 */
    @Select("SELECT /*+ INDEX_ASC(order_detail od_od_id_pk)*/* "
    		+"FROM order_detail "
    		+"WHERE o_id=#{oid}")
    public List<OrderDetailVO> orderDetail(String oid);
    
    @Insert("INSERT INTO order_detail VALUES(order_detail_id_seq.NEXTVAL,#{o_id},#{g_id},#{g_name},#{g_price},#{g_sale},#{g_quantity})")
    public void orderDetailInsert(OrderDetailVO vo);
    
    
    /* 주문 취소 */
    @Select("SELECT g_id,g_quantity FROM order_detail WHERE o_id=#{o_id}")
    public List<Map<String,Object>> getGidsFromOrder(String oid);
    
} 