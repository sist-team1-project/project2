package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CartMapper {

	@Insert("INSERT INTO cart_1 VALUES(cart_id_seq_1.NEXTVAL,#{u_id},#{g_id},#{g_quantity})")
	public void cartInsert(CartVO vo);
}