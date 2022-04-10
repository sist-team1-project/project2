package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface OrderMapper {
	/********************** 관리자 부분 ************************************/
	/* 페이징 사용 */
	@Select("<script>"
	        + "SELECT CEIL(COUNT(*) / 10.0) "
	        + "FROM order_1 "
            + "<choose>"
            + "<when test=\"sort=='B'.toString()\">"
            + "WHERE o_state=-1"
            + "</when>"
            + "<when test=\"sort=='C'.toString()\">"
            + "WHERE o_state=0"
            + "</when>"
            + "<when test=\"sort=='D'.toString()\">"
            + "WHERE o_state=1"
            + "</when>"
            + "<when test=\"sort=='E'.toString()\">"
            + "WHERE o_state=2"
            + "</when>"
            + "<when test=\"sort=='F'.toString()\">"
            + "WHERE o_state=3"
            + "</when>" 
            + "</choose>"
            + "</script>")
	public int orderTotalPage(Map map);
	
	/* 페이징 사용 */
	@Select("<script>"
	        + "SELECT COUNT(*) "
	        + "FROM order_1 "
            + "<choose>"
            + "<when test=\"sort=='B'.toString()\">"
            + "WHERE o_state=-1"
            + "</when>"
            + "<when test=\"sort=='C'.toString()\">"
            + "WHERE o_state=0"
            + "</when>"
            + "<when test=\"sort=='D'.toString()\">"
            + "WHERE o_state=1"
            + "</when>"
            + "<when test=\"sort=='E'.toString()\">"
            + "WHERE o_state=2"
            + "</when>"
            + "<when test=\"sort=='F'.toString()\">"
            + "WHERE o_state=3"
            + "</when>" 
            + "</choose>"
            + "</script>")
    public int orderCount(Map map);

	 /* 주문상세에서 사용 */ 
	 @Select("SELECT /*+ INDEX_ASC(order_1 order_o_id_pk_1)*/* " 
			+ "FROM order_1 "
			+ "WHERE o_id=#{oid}")
	 public OrderVO order(String oid);
	 
	 /* 판매관리목록 */
	 @Select("<script>"
	        + "SELECT oid, regdate, shipping, state, usid, name, price, quantity "
	        + "FROM (SELECT oid, regdate, shipping, state, usid, name, price, quantity, rownum as num "
	        + "FROM (SELECT o_id as oid, o_regdate as regdate, o_shipping as shipping, o_state as state, u_id as usid, "
			+ "g_name || decode(sum(g_quantity),1,'',' 외 ' || (sum(g_quantity)-1) || '개')as name, "
			+ "sum(g_price) as price, sum(g_quantity) as quantity "
			+ "FROM (SELECT a.o_id, a.o_regdate, a.o_shipping, a.o_state, a.u_id, "
			+ "first_value(b.g_name) over(PARTITION BY a.o_id order by a.o_id desc) as g_name, b.g_price, b.g_quantity "
			+ "FROM order_1 a, order_detail_1 b "
			+ "WHERE a.o_id = b.o_id "
			+ "<choose>"
			+ "<when test=\"sort=='B'.toString()\">"
            + "AND o_state=-1"
            + "</when>"
            + "<when test=\"sort=='C'.toString()\">"
            + "AND o_state=0"
            + "</when>"
            + "<when test=\"sort=='D'.toString()\">"
            + "AND o_state=1"
            + "</when>"
            + "<when test=\"sort=='E'.toString()\">"
            + "AND o_state=2"
            + "</when>"
            + "<when test=\"sort=='F'.toString()\">"
            + "AND o_state=3"
            + "</when>"
			+ "</choose>"
			+ ") "
			+ "GROUP BY o_id, o_regdate, o_shipping, o_state, u_id, g_name "
			+ "ORDER BY o_id desc)) "
			+ "WHERE num BETWEEN #{start} AND #{end}"
			+ "</script>")
	 public List<Map<String,Object>> orderFullList(Map map);
	 
	 /* 주문상태 변경 */
	 @Update("UPDATE order_1 SET o_state=#{state} WHERE o_id=#{oid}")
	 public int stateupdate(Map map);
	 
	 /********************************************************************/
	 
}
