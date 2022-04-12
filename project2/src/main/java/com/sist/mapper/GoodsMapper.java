package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface GoodsMapper {
    
    /********************************* 리스트 ****************************************/
    @Select("SELECT MAX(g_price) FROM goods_1 WHERE c_id LIKE #{cid}||'%'")
    public String goodsMaxPrice(String cid);
    
    @Select("<script>"
            + "SELECT NVL(l.l_id,0) AS l_id,g.g_id,g.g_name,g.g_price,g.g_image "
            + "FROM (SELECT l_id,g_id FROM like_1 WHERE u_id=#{uid}) l, (SELECT g_id,g_name,g_price,g_image "
            + "FROM (SELECT g_id,g_name,g_price,g_image,rownum as num "
            + "FROM (SELECT g_id,g_name,g_price,g_image "
            + "FROM goods_1 "
            + "WHERE c_id LIKE #{cid}||'%' AND g_status=1 AND (g_price BETWEEN #{price1} AND #{price2}) AND (g_name LIKE '%'||#{keyword}||'%' OR g_brand LIKE '%'||#{keyword}||'%')"
            + "<if test=\"brands.size!=0\">"
            + "AND g_brand IN "
            + "<foreach collection='brands' item='b' index='index' open='(' close=')' separator=','>"
            + "#{b}"
            + "</foreach>"
            + "</if>"
            + "<choose>"
            + "<when test=\"order=='A'.toString()\">"
            + "ORDER BY g_id DESC"
            + "</when>"
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
            + "WHERE num BETWEEN #{start} AND #{end}) g "
            + "WHERE l.g_id(+)=g.g_id"
            + "</script>")
    public List<Map<String,Object>> goodsList(Map map);
	
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
	/******************************************************************************/
	
	/********************************* 상품 상세 ****************************************/
	@Select("SELECT g_status FROM goods_1 WHERE g_id=#{gid}")
    public int goodsStatus(int gid);
	
	@Select("SELECT NVL(l.l_id,0) AS l_id,g.g_id,g.g_name,g.g_brand,g.g_sale,g.g_image,g.g_detail,g.g_sold,g.g_status "
	        + "FROM (SELECT * FROM goods_1 WHERE g_id=#{gid}) g, "
	        + "(SELECT l_id,g_id FROM like_1 WHERE u_id=#{uid}) l "
	        + "WHERE g.g_id=l.g_id(+)")
    public Map<String,Object> goodsDetail(Map map);
	/******************************************************************************/
	
	/********************************* 관리자 ****************************************/
    /* ---------------------- 관리자 상품 검색  ----------------------------  */
    @Select("<script>"
            + "SELECT g_id, c_title, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status, g_regdate "
            + "FROM (SELECT g_id, c_title, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status, g_regdate, rownum AS num "
            + "FROM (SELECT g_id, c_title, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status, g_regdate "
            + "FROM (SELECT g.g_id, c.c_title, g.g_name, g.g_brand, g.g_price, g.g_sale, g.g_image, g.g_detail, g.g_sold, g.g_status, g.g_regdate "
            + "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status, TO_CHAR(g_regdate,'YYYY-MM-DD HH24:MI:SS') AS g_regdate FROM goods_1) g, category_1 c "
            + "WHERE g.c_id=c.c_id) WHERE g_status=#{status} AND ("
            + "<trim prefixOverrides='OR'>"
            + "<foreach collection='fsArr' item='fd'>"
            + "<trim prefix='OR'>"
            + "<choose>"
            + "<when test=\"fd=='N'.toString()\">"
            + "g_id LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='S'.toString()\">"
            + "c_title LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='C'.toString()\">"
            + "g_name LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='D'.toString()\">"
            + "g_brand LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "</choose>"
            + "</trim>"
            + "</foreach>"
            + "</trim> "
            + ")"
            + "<choose>"
            + "<when test=\"order=='A'.toString()\">"
            + "ORDER BY g_id DESC"
            + "</when>"
            + "<when test=\"order=='B'.toString()\">"
            + "ORDER BY g_id ASC"
            + "</when>"
            + "</choose>"
            + ")) WHERE num BETWEEN #{start} AND #{end} "
            + "</script>")
    public List<Map<String,Object>> adminGoodsFind(Map map);
    
	/* ---------------------- 관리자 상품 검색 페이징  ----------------------------  */
    @Select("<script>"
            + "SELECT CEIL(COUNT(*) / 10.0) "
            + "FROM (SELECT g_id, c_title, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status "
            + "FROM (SELECT g.g_id, c.c_title, g.g_name, g.g_brand, g.g_price, g.g_sale, g.g_image, g.g_detail, g.g_sold, g.g_status "
            + "FROM (SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_sold, g_status FROM goods_1) g, category_1 c "
            + "WHERE g.c_id=c.c_id) WHERE g_status=#{status} AND ("
            + "<trim prefixOverrides='OR'>"
            + "<foreach collection='fsArr' item='fd'>"
            + "<trim prefix='OR'>"
            + "<choose>"
            + "<when test=\"fd=='N'.toString()\">"
            + "g_id LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='S'.toString()\">"
            + "c_title LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='C'.toString()\">"
            + "g_name LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "<when test=\"fd=='D'.toString()\">"
            + "g_brand LIKE '%'||#{ss}||'%'"
            + "</when>"
            + "</choose>"
            + "</trim>"
            + "</foreach>"
            + "</trim> "
            + "))"
            + "</script>")
	public int adminGoodsTotalPage(Map map);
	
	/* ---------------------- 관리자 상품 개수  ----------------------------  */
	@Select("SELECT COUNT(*) FROM Goods_1")
	public int adminGoodsCount();

	/* ---------------------- 관리자 상세 정보 ----------------------------  */
	@Select("SELECT g_id, c_id, g_name, g_brand, g_price, g_sale, g_image, g_detail, g_status FROM Goods_1 "
	         +"WHERE g_id=#{gid}")
	public GoodsVO adminGoodsDetail(int gid);
	
	/*  --------------------- 상품 등록 페이지 -----------------------------  */
	@Insert("INSERT INTO goods_1 VALUES(#{g_id}, #{c_id}, #{g_name}, #{g_brand}, #{g_price}, #{g_sale}, #{g_image}, #{g_detail}, 0, #{g_status}, SYSDATE)")
    @SelectKey(statement="SELECT goods_id_seq_1.NEXTVAL FROM DUAL", keyProperty="g_id", before=true, resultType=int.class)
	public int goodsInsert(GoodsVO vo);
	
	/* ---------------------- 관리자  이벤트 정보 ----------------------------  */
	@Select("SELECT eg_id, e_id FROM event_goods_1 WHERE g_id = #{g_id}")
	public EventGoodsVO eventGoodsData(String g_id);
	   
	/* ---------------------- 관리자 상품 수정  ----------------------------  */
	@Update("UPDATE goods_1 SET "
			+ "c_id=#{c_id}, g_name=#{g_name}, g_brand = #{g_brand}, g_price = #{g_price}, g_sale = #{g_sale}, g_image = #{g_image}, g_detail = #{g_detail}, g_status = #{g_status} "
			+ "WHERE g_id = #{g_id}")
	public void goodsupdate(GoodsVO vo);
	/******************************************************************************/
	
	/******************************************************************************/
    /* -------------------------------- 주문창 제품 정보 ----------------------------  */
    @Select("<script>"
            + "SELECT g_id,g_name,g_brand,g_price,g_sale,g_image,g_sold,g_status "
            + "FROM goods_1 "
            + "<if test=\"gids.size!=0\">"
            + "WHERE g_id IN "
            + "<foreach collection='gids' item='gid' index='index' open='(' close=')' separator=','>" 
            + "#{gid}"
            + "</foreach>"
            + "</if>"
            + "</script>")
    public List<GoodsVO> checkOutGoodsDetail(Map map);
    /******************************************************************************/
}