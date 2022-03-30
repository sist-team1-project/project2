package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface GoodsMapper {
    
    @Select("SELECT g_id,g_name,g_price,g_image "
            + "FROM goods_1 "
            + "WHERE g_id BETWEEN 1 AND 8")
    public List<GoodsVO> goodsList();

    @Select("SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, TO_CHAR(g_regdate,'YYYY-MM-DD HH24:MI:SS')as g_regdate, num "
    		+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate, rownum as num "
    		+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate FROM Goods_1))"
    		+ "WHERE num BETWEEN #{start} AND #{end}")
    public List<GoodsVO> goodsTotalList(Map map);
    
    @Select("SELECT CEIL(COUNT(*) / 10.0) FROM Goods_1")
    public int goodsTotalPage();
    
    @Select("SELECT COUNT(*) FROM Goods_1")
    public int goodsCount();
    
}