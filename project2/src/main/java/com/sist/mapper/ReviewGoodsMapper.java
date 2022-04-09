package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface ReviewGoodsMapper {

    @Select("SELECT r_id,r_rate,r_content,r_regdate "
            + "FROM (SELECT r_id,r_rate,r_content,r_regdate,rownum AS num "
            + "FROM (SELECT od.g_id,rg.r_id,rg.r_rate,rg.r_content,rg.r_regdate "
            + "FROM (SELECT g_id,o_id,od_id FROM order_detail_1) od, "
            + "(SELECT /*+ INDEX_DESC(review_goods_1 rg_r_id_pk_1)*/ r_id,od_id,r_rate,r_content,TO_CHAR(r_regdate,'YYYY-MM-DD HH24:MI:SS') r_regdate FROM review_goods_1) rg "
            + "WHERE g_id=#{gid} AND od.od_id=rg.od_id)) "
            + "WHERE num BETWEEN #{start} AND #{end}")
    public List<ReviewGoodsVO> reviewList(Map map);
    
    @Select("SELECT CEIL(COUNT(*)/10.0) "
            + "FROM (SELECT g_id, od_id FROM order_detail_1) od, "
            + "(SELECT r_id,od_id FROM review_goods_1) rg  "
            + "WHERE g_id=#{gid} AND od.od_id=rg.od_id")
    public int reviewListTotalpage(int gid);
}