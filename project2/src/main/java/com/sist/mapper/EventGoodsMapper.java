package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventGoodsMapper {
    
    /*   메인 페이지   */
    @Select("SELECT NVL(l.l_id,0) AS l_id,g.g_id,g.g_name,g.g_price,g.g_image,g.e_id "
            + "FROM (SELECT l_id,g_id FROM like_1 WHERE u_id=#{uid}) l, (SELECT g.g_id,g.g_name,g.g_price,g.g_image,g.g_status,eg.e_id "
            + "FROM goods_1 g, (SELECT /*+ INDEX_DESC(event_goods_1 eg_eg_id_pk_1)*/ e_id,g_id FROM event_goods_1) eg "
            + "WHERE g.g_id=eg.g_id AND g.g_status=1) g "
            + "WHERE l.g_id(+)=g.g_id")
    public List<Map<String,Object>> eventGoodsList(String uid);
    
    /*   상품 등록   */
	@Insert("INSERT INTO event_goods_1 VALUES(event_goods_id_seq_1.NEXTVAL, #{e_id}, #{g_id})")
	public void goodsEventInsert(EventGoodsVO vo);

    /*   상품 수정   */
	@Update("UPDATE event_goods_1 SET e_id = #{e_id}, g_id = #{g_id} WHERE eg_id = #{eg_id}")
    public void goodsEventUpdate(EventGoodsVO vo, int eg_id);
	
	@Select("SELECT eg_id FROM event_goods_1 WHERE g_id = #{g_id} AND e_id = #{e_id}")
	public int goodsEGidData(EventGoodsVO vo);
	
	/* 	이벤트 E_id 리스트   */
	@Select("select eg_id, e_id from event_goods_1 where g_id = #{g_id}")
	public List<EventGoodsVO> goodsEidData(int g_id);
	
	/* 	이벤트 삭제   */
	@Delete("DELETE FROM event_goods_1 where g_id = #{g_id} AND e_id = #{e_id}")
	public void goodsEventDelete(EventGoodsVO vo);
}