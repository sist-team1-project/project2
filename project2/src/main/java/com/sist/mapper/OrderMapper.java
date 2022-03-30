package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderMapper {
	
	@Select("SELECT o_id,u_id,o_receiver,o_phone,o_post,o_address1,o_address2,o_request,o_regdate,o_shipping,o_state,num " 
			+"FROM (SELECT o_id,u_id,o_receiver,o_phone,o_post,o_address1,o_address2,o_request,o_regdate,o_shipping,o_state, rownum as num "
			+"FROM (SELECT o_id,u_id,o_receiver,o_phone,o_post,o_address1,o_address2,o_request,o_regdate,o_shipping,o_state,num from order_1)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<OrderVO> orderTotalList(Map map);
	
	@Select("SELECT CEIL(COUNT(*) / 10.0) FROM order_1")
    public int orderTotalPage();
    
    @Select("SELECT COUNT(*) / 10.0 FROM order_1")
    public int orderCount();
    
}