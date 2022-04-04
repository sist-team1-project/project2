package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderMapper {
	/* 판매관리 목록 리스트 */
	@Select("SELECT o_id,u_id,o_request,o_regdate,o_shipping,o_state,num " 
			+"FROM (SELECT o_id,u_id,o_request,o_regdate,o_shipping,o_state, rownum as num "
			+"FROM (SELECT o_id,u_id,o_request,o_regdate,o_shipping,o_state from order_1)) "
			+"WHERE num BETWEEN #{start} AND #{end}") 
	public List<OrderVO> orderTotalList(Map map);
	
	@Select("SELECT CEIL(COUNT(*) / 10.0) FROM order_1")
    public int orderTotalPage();
    
    @Select("SELECT COUNT(*) / 10.0 FROM order_1")
    public int orderCount();

    /* 주문  */
    @Select("SELECT /*+ INDEX_ASC(order_1 order_o_id_pk_1)*/* "
    		+"FROM order_1 "
    		+"WHERE o_id=#{oid}")
    public OrderVO order(String oid);
    

}
