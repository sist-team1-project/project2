package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface GoodsMapper {

    @Select("SELECT g_id,g_name,g_price,g_image "
            + "FROM goods_1 "
            + "WHERE g_id BETWEEN 1 AND 8")
    public List<GoodsVO> goodsTemp(Map map);
}