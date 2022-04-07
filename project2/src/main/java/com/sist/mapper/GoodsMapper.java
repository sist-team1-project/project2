package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface GoodsMapper {
    
    /*  ------- 리스트 페이지 -------  */
    @Select("SELECT MAX(g_price) FROM goods_1 WHERE c_id LIKE #{cid}||'%'")
    public int goodsMaxPrice(String cid);
    
	@Select("<script>"
	        + "SELECT g_id,g_name,g_price,g_image "
	        + "FROM (SELECT g_id,g_name,g_price,g_image,rownum as num "
	        + "FROM (SELECT /*+ INDEX_DESC(goods_1 goods_g_id_pk_1)*/g_id,g_name,g_price,g_image "
	        + "FROM goods_1 "
	        + "WHERE c_id LIKE #{cid}||'%' AND (g_price BETWEEN #{price1} AND #{price2}) AND (g_name LIKE '%'||#{keyword}||'%' OR g_brand LIKE '%'||#{keyword}||'%')"
	        + "<if test=\"brands.size!=0\">"
	        + "AND g_brand IN "
	        + "<foreach collection='brands' item='b' index='index' open='(' close=')' separator=','>"
	        + "#{b}"
	        + "</foreach>"
	        + "</if>"
            + "<choose>"
	        + "<when test=\"order=='B'.toString()\">"
	        + "ORDER BY g_sold DESC"
	        + "</when>"
	        + "<when test=\"order=='C'.toString()\">"
            + "ORDER BY g_price ASC"
            + "</when>"
            + "<when test=\"order=='D'.toString()\">"
            + "ORDER BY g_price DESC"
            + "</when>"
            + "</choose>"
	        + ")) "
	        + "WHERE num BETWEEN #{start} AND #{end}"
	        + "</script>")
	public List<GoodsVO> goodsList(Map map);
	
	@Select("<script>"
	        + "SELECT CEIL(COUNT(*)/20.0) "
            + "FROM goods_1 "
            + "WHERE c_id LIKE #{cid}||'%' AND (g_price BETWEEN #{price1} AND #{price2}) AND (g_name LIKE '%'||#{keyword}||'%' OR g_brand LIKE '%'||#{keyword}||'%')"
            + "<if test=\"brands.size!=0\">"
            + "AND g_brand IN "
            + "<foreach collection='brands' item='b' index='index' open='(' close=')' separator=','>"
            + "#{b}"
            + "</foreach>"
            + "</if>"
            + "</script>")
    public int goodsListTotalpage(Map map);
	
	@Select("SELECT DISTINCT g_brand FROM goods_1 WHERE c_id LIKE #{cid}||'%'")
	public List<String> brandList(String cid);
    /*  --------------------------  */
	
	@Select("SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, TO_CHAR(g_regdate,'YYYY-MM-DD HH24:MI:SS')as g_regdate, num "
			+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate, rownum as num " 
			+ "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_stock, g_sold, g_status, g_regdate FROM Goods_1)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<GoodsVO> goodsTotalList(Map map);

	@Select("<script>"
			+"SELECT CEIL(COUNT(*) / 10.0) "
			+"FROM (SELECT g_id, c_id, g_name, g_brand "
			+"FROM goods_1 "
			+"WHERE "
			+"<trim prefixOverrides='OR'> " 
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
			+ ")"
			+ "</script>")
	public int goodsTotalPage(Map map);

	@Select("SELECT COUNT(*) FROM Goods_1")
	public int goodsCount();

	@Select("SELECT g_id,g_name,g_brand,g_price,g_sale,g_image,g_detail,g_status,g_stock FROM Goods_1 "
			+"WHERE g_id=#{g_id}")
	public GoodsVO goodsDetail(Map map);

	@Insert("INSERT INTO goods_1 VALUES(goods_id_seq_1.NEXTVAL, #{c_id}, #{g_name}, #{g_brand}, #{g_price}, #{g_sale}, #{g_image}, #{g_detail}, #{g_stock}, 0, #{g_status}, SYSDATE)")
	public void goodsInsert(GoodsVO vo);

	@Select("SELECT eg_id, e_id FROM event_goods_1 WHERE g_id = #{g_id}")
	public EventGoodsVO eventGoodsData(int g_id);
	
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
			  + "ORDER BY g_id))"
			  +"WHERE num BETWEEN #{start} AND #{end}"
			  + "</script>")
		public List<GoodsVO> adminGoodsFind(Map map);
	

	@Update("UPDATE goods_1 SET "
			+ "c_id=#{c_id}, g_name=#{g_name}, g_brand = #{g_brand}, g_price = #{g_price}, g_sale = #{g_sale}, g_image = #{g_image}, g_detail = #{g_detail}, g_stock = #{g_stock}, g_status = #{g_status} "
			+ "WHERE g_id = #{g_id}")
	public void goodsupdate(GoodsVO vo);
	
	
}