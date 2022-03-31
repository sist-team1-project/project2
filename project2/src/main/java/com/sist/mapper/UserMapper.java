package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface UserMapper {
	
	// 1. id존재 여부
	@Select("SELECT COUNT(*) FROM user_1 "
		   +"WHERE u_id=#{u_id}")
	public int idCount(String id);
	
	// 2. password, name
	@Select("SELECT u_password||','||u_grade FROM user_1 "
		   +"WHERE u_id=#{u_id}")
	public String memberGetPwdAndName(String id);
	
}