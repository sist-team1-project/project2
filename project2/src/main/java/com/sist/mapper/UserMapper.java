package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface UserMapper {

	// id존재 여부
	@Select("SELECT COUNT(*) FROM user_1 " + "WHERE u_id=#{u_id}")
	public int idCount(String id);

	// password, name
	@Select("SELECT u_password||','||u_grade FROM user_1 " + "WHERE u_id=#{u_id}")
	public String memberGetPwdAndName(String id);

	// 회원가입
	@Insert("INSERT INTO user_1 VALUES(#{u_id}, #{u_password}, #{u_name}, #{u_gender}, #{u_phone}, #{u_email}, #{u_post}, #{u_address1}, #{u_address2}, #{u_question}, #{u_answer}, 1, sysdate)")
	public void userJoin(UserVO vo);
	
	// 고객정보
	@Select("SELECT u_id, u_name, u_gender, u_email, u_phone, u_address1, u_address2, u_post, u_question, u_answer, to_char(u_regdate,'YYYY-MM-DD') as u_regdate FROM user_1 WHERE u_id=#{uid}")
	public UserVO userInfo(String uid);
}