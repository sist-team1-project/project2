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
	        + "FROM (SELECT o_id as oid, TO_CHAR(o_regdate,'YYYY-MM-DD HH24:MI:SS') as regdate, o_shipping as shipping, o_state as state, u_id as usid, "
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
	 
	/* 유저  - 마이페이지 주문 정보 */
	@Select("SELECT o_id, u_id, o_regdate, o_state "
			+"FROM (SELECT o_id, u_id, TO_CHAR(o_regdate,'YYYY-MM-DD HH24:MI:SS')as o_regdate, o_state, rownum as num "
	 		+"FROM (SELECT o_id, u_id, o_regdate, o_state "
			+"FROM order_1 ORDER BY o_regdate DESC)) "
			+"WHERE u_id=#{uid} AND num BETWEEN #{start} AND #{end}")
	public List<OrderVO> orderInfoList(Map map);
	
	/* 유저  - 주문정보 페이징*/
	@Select("SELECT CEIL(COUNT(*) / 10.0) "
	        + "FROM order_1 "
	        + "WHERE u_id=#{uid}")
		public int userOrderTotalPage(Map map);
	 
	/* 유저  - 주문정보 갯수 */
	@Select("SELECT COUNT(*) FROM order_1 "
			+ "WHERE u_id=#{uid}")
	    public int userOrderCount(Map map);
	 
	/* 유저  - 주문상태 변경 */
	@Update("UPDATE order_1 SET o_state=#{state} WHERE o_id=#{oid} AND u_id=#{uid}")
	public void userOrderCancel(Map map);
	
	/**************************** 주문 **************************/
	/* 이전 주문 상태 가져오기 */
	@Select("SELECT o_state FROM order_1 WHERE o_id=#{oid}")
	public int getDBOrderState(String oid);
	
	@Insert("INSERT INTO order_1 VALUES (#{o_id},#{u_id},#{o_receiver},#{o_phone},#{o_post},#{o_address1},#{o_address2},#{o_request},SYSDATE,5000,0)")
	@SelectKey(statement="SELECT CONCAT(TO_CHAR(SYSDATE,'YYMMDDHH24MI'),LPAD(order_id_seq_1.NEXTVAL,4,0)) AS o_id FROM DUAL", keyProperty="o_id", before=true, resultType=String.class)
	public void orderInsert(OrderVO vo);
}
