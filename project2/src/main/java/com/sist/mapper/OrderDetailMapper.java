package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderDetailMapper {
    @Select("SELECT * FROM (SELECT order_1.o_id, u_id, o_receiver, o_phone, o_post, o_address1, o_address2, o_request, "
    		+"o_regdate, o_shipping, o_state, od_id, g_id, g_name, g_price, g_sale, g_quantity, rownum as num "
    		+"FROM order_1 JOIN order_detail_1 "
    		+"ON order_1.o_id = order_detail_1.o_id " 
    		+"ORDER BY o_id DESC)")
    public List<OrderDetailVO> orderDetailList(Map map);
    
}