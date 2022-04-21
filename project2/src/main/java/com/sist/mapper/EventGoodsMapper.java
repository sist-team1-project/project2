package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventGoodsMapper {
    
    /*   메인 페이지   */
    @Select("SELECT NVL(l.l_id,0) AS l_id,g.g_id,g.g_name,g.g_price,g.g_image,g.e_id "
            + "FROM (SELECT l_id,g_id FROM likes WHERE u_id=#{uid}) l, (SELECT g.g_id,g.g_name,g.g_price,g.g_image,g.g_status,eg.e_id,eg.eg_id "
            + "FROM goods g, (SELECT /*+ INDEX_DESC(event_goods eg_eg_id_pk)*/ eg_id,e_id,g_id FROM event_goods) eg "
            + "WHERE g.g_id=eg.g_id AND g.g_status=1) g "
            + "WHERE l.g_id(+)=g.g_id ORDER BY g.eg_id")
    public List<Map<String,Object>> eventGoodsList(String uid);
    
    /*   상품 등록 / 수정   */
    // 등록: 이벤트 목록
    @Select("select eg_id, e_id from event_goods where g_id = #{g_id}")
    public List<EventGoodsVO> goodsEidData(int g_id);
    
    // 등록 & 수정: 이벤트 등록
	@Insert("INSERT INTO event_goods VALUES(event_goods_id_seq.NEXTVAL, #{e_id}, #{g_id})")
	public void goodsEventInsert(EventGoodsVO vo);
	
	// 수정: 이벤트 삭제
	@Select ("SELECT count(*) FROM event_goods WHERE g_id = #{g_id}")
	public int countEvent(int g_id);
	
	@Delete("DELETE FROM event_goods WHERE g_id = #{g_id}")
    public void goodsEventDelete(int g_id);
}