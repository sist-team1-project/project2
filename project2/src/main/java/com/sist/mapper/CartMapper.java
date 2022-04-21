package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CartMapper {
    
    @Select("SELECT count(*) FROM cart WHERE u_id=#{u_id} AND g_id=#{g_id}")
    public int checkCart(CartVO vo);
    
	@Insert("INSERT INTO cart VALUES(cart_id_seq.NEXTVAL,#{u_id},#{g_id},#{g_quantity})")
	public void cartInsert(CartVO vo);
	
	@Update("UPDATE cart SET g_quantity=g_quantity+#{g_quantity} WHERE g_id=#{g_id} AND u_id=#{u_id}")
	public void cartUpdate(CartVO vo);
	
	@Delete("DELETE FROM cart WHERE cart_id=#{cid}")
	public void cartDelete(int cid);
	
	@Delete("DELETE FROM cart WHERE g_id=#{gid} AND u_id=#{uid}")
    public void cartDeleteByGidAndUid(Map map);
	
	/* ---------- 헤더 ------------ */
	@Select("SELECT count(*) FROM cart WHERE u_id=#{uid}")
    public int countCart(String uid);
	
	@Select("SELECT g.g_name,g.g_image,g.g_price,g.g_sale,c.cart_id,c.g_id,c.g_quantity "
	        + "FROM (SELECT * FROM goods WHERE g_status=1) g, (SELECT /*+ INDEX_DESC(cart cart_cart_id_pk)*/cart_id,g_id,g_quantity "
	        + "FROM cart WHERE u_id=#{uid}) c "
	        + "WHERE g.g_id = c.g_id")
    public List<Map<String,Object>> cartList(String uid);
	/* --------------------------- */
	
	
	@Update("UPDATE cart SET g_quantity=g_quantity+#{num} WHERE g_id=#{gid}")
	public void cartNumUpdate(Map map);
}