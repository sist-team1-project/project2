package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CartMapper {
    
    @Select("SELECT count(*) FROM cart_1 WHERE u_id=#{u_id} AND g_id=#{g_id}")
    public int checkCart(CartVO vo);
    
	@Insert("INSERT INTO cart_1 VALUES(cart_id_seq_1.NEXTVAL,#{u_id},#{g_id},#{g_quantity})")
	public void cartInsert(CartVO vo);
	
	@Update("UPDATE cart_1 SET g_quantity=g_quantity+#{quantity}")
	public void cartUpdate(int quantity);
	
	/* ---------- 헤더 ------------ */
	@Select("SELECT count(*) FROM cart_1 WHERE u_id=#{uid}")
    public int countCart(String uid);
	
	@Select("SELECT g.g_name,g.g_image,g.g_price,g.g_sale,c.g_id,c.g_quantity "
	        + "FROM goods_1 g, (SELECT /*+ INDEX_DESC(cart_1 cart_cart_id_pk_1)*/g_id,g_quantity "
	        + "FROM cart_1 WHERE u_id=#{uid}) c "
	        + "WHERE g.g_id = c.g_id")
    public List<Map<String,Object>> cartList(String uid);
	/* --------------------------- */
}