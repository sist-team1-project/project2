package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderDetailMapper {
	/* 주문상세 + 주문 그냥 합쳐놓은거라 없앨수도 있음 */
    @Select("SELECT * FROM (SELECT order_1.o_id, u_id, o_receiver, o_phone, o_post, o_address1, o_address2, o_request, "
    		+"o_regdate, o_shipping, o_state, od_id, g_id, g_name, g_price, g_sale, g_quantity, rownum as num "
    		+"FROM order_1 JOIN order_detail_1 "
    		+"ON order_1.o_id = order_detail_1.o_id " 
    		+"WHERE o_id=#{oid})")
    public List<OrderDetailVO> orderDetailList(Map map);
    
    /* 주문목록 상세 */
    @Select("SELECT /*+ INDEX_ASC(order_detail_1 od_od_id_pk_1)*/ g_name,g_price,g_quantity "
    		+"FROM order_detail_1 ")
    public List<OrderDetailVO> orderListDetail(); 
    
    /* 상품명 */
    @Select("SELECT g_name "
    		+"FROM order_detail_1 "
    		+"WHERE o_id=#{oid}")    
    public List<String> nameData(String oid);
    
    /* 주문 상세 */
    @Select("SELECT /*+ INDEX_ASC(order_detail_1 od_od_id_pk_1)*/* "
    		+"FROM order_detail_1 "
    		+"WHERE o_id=#{oid}")
    public List<OrderDetailVO> orderDetail(String oid);
    
} 