package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventGoodsMapper {
    
    @Insert("INSERT INTO event_goods_1 VALUES(event_goods_id_seq_1.NEXTVAL, #{e_id}, #{g_id})")
    public void goodsEventInsert(EventGoodsVO vo);
}