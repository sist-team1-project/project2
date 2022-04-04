package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface GoodsMapper {
    
    /*  ------- 리스트 페이지 -------  */
	@Select("SELECT g_id,g_name,g_price,g_image "
	        + "FROM (SELECT g_id,g_name,g_price,g_image,rownum as num "
	        + "FROM (SELECT /*+ INDEX_DESC(goods_1 goods_g_id_pk_1)*/g_id,g_name,g_price,g_image "
	        + "FROM goods_1 "
	        + "WHERE c_id LIKE #{cid}||'%' AND g_name LIKE '%'||#{keyword}||'%')) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<GoodsVO> goodsList(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/20.0) "
            + "FROM goods_1 "
            + "WHERE c_id LIKE #{cid}||'%' AND g_name LIKE '%'||#{keyword}||'%'")
    public int goodsListTotalpage(Map map);
	
	@Select("SELECT DISTINCT g_brand FROM goods_1 WHERE c_id LIKE #{cid}||'%' AND g_name LIKE '%'||#{keyword}||'%'")
	public List<String> brandList(Map map);
    /*  --------------------------  */
	
	@Select("SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, TO_CHAR(g_regdate,'YYYY-MM-DD HH24:MI:SS')as g_regdate, num "
			+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate, rownum as num " 
			+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate FROM Goods_1)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<GoodsVO> goodsTotalList(Map map);

	@Select("SELECT CEIL(COUNT(*) / 10.0) FROM Goods_1")
	public int goodsTotalPage();

	@Select("SELECT COUNT(*) FROM Goods_1")
	public int goodsCount();

	@Select("SELECT g_id,g_name,g_brand,g_price,g_sale,g_image,g_detail,g_status FROM Goods_1 "
			+"WHERE g_id=#{gid}")
	public GoodsVO goodsDetail(Map map);

	@Insert("INSERT INTO goods_1 VALUES(goods_id_seq_1.NEXTVAL, #{c_id}, #{g_name}, #{g_brand}, #{g_price}, #{g_sale}, #{g_image}, #{g_detail}, #{g_stock}, 0, #{g_status}, SYSDATE")
	public void goodsInsert(GoodsVO vo, int e_id);

	@Select("SELECT eg_id, e_id FROM event_goods_1 WHERE g_id = #{g_id}")
	public EventGoodsVO eventGoodsData(int g_id);

	@Insert("INSERT INTO event_goods_1 VALUES(event_goods_id_seq_1.NEXTVAL, #{e_id}, #{g_id})")
	public void goodsEventInsert(EventGoodsVO vo);
	
	@Select("<script>"
			+ "SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, TO_CHAR(g_regdate,'YYYY-MM-DD HH24:MI:SS')as g_regdate, num "
			  +"FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate, rownum as num "
			  +"FROM ("
			  +"SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate "
			  +"FROM goods_1 "
			  +"WHERE "
			  +"<trim prefixOverrides='OR'>"
			  +"<foreach collection='fsArr' item='fd'>"
			  +"<trim prefix='OR'>"
			  +"<choose>"
			  +"<when test=\"fd=='N'.toString()\">"
			  +"g_id LIKE '%'||#{ss}||'%'"
			  +"</when>"
			  +"<when test=\"fd=='S'.toString()\">"
			  +"c_id LIKE '%'||#{ss}||'%'"
			  +"</when>"
			  +"<when test=\"fd=='C'.toString()\">"
			  +"g_name LIKE '%'||#{ss}||'%'"
			  +"</when>"
			  +"<when test=\"fd=='D'.toString()\">"
			  +"g_brand LIKE '%'||#{ss}||'%'"
			  +"</when>"
			  +"</choose>"
			  +"</trim>"
			  +"</foreach>"
			  +"</trim>"
			  + "))"
			  +"WHERE num BETWEEN #{start} AND #{end}"
			  + "</script>")
		public List<GoodsVO> adminGoodsFind(Map map);

}