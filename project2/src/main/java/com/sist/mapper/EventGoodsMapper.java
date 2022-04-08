package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventGoodsMapper {

	@Insert("INSERT INTO event_goods_1 VALUES(event_goods_id_seq_1.NEXTVAL, #{e_id}, #{g_id})")
	public void goodsEventInsert(EventGoodsVO vo);

	@Update("UPDATE event_goods_1 SET e_id = #{e_id}, g_id = #{g_id} WHERE eg_id = #{eg_id}")
    public void goodsEventUpdate(EventGoodsVO vo, int eg_id);
	
	@Select("SELECT eg_id FROM event_goods_1 WHERE g_id = #{g_id} AND e_id = #{e_id}")
	public int goodsEGidData(EventGoodsVO vo);
	
	@Select("select e_id from event_goods_1 where g_id = #{g_id}")
	public int goodsEidData(String g_id);
	
}