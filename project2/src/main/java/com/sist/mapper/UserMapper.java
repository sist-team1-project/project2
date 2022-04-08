package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface UserMapper {

	// 회원가입: id 존재 여부
	@Select("SELECT COUNT(*) FROM user_1 " + "WHERE u_id=#{id}")
	public int idCount(String id);

	// 회원가입: email 존재 여부
	@Select("SELECT COUNT(*) FROM user_1 " + "WHERE u_email=#{email}")
	public int emailCount(String email);

	// password, name
	@Select("SELECT u_password||','||u_grade FROM user_1 " + "WHERE u_id=#{id}")
	public String memberGetPwdAndName(String id);

	// 회원가입
	@Insert("INSERT INTO user_1 VALUES "
			+ "(#{u_id}, #{u_password}, #{u_name}, #{u_gender}, #{u_phone}, #{u_email}, #{u_post}, #{u_address1}, #{u_address2}, #{u_question}, #{u_answer}, 1, sysdate)")
	public void userJoin(UserVO vo);

	// 고객정보
	@Select("SELECT u_id, u_name, u_gender, u_email, u_phone, u_address1, u_address2, u_post, u_question, u_answer, to_char(u_regdate,'YYYY-MM-DD') as u_regdate "
			+ "FROM user_1 WHERE u_id=#{uid}")
	public UserVO userInfo(String uid);

	// 아이디 찾기: email 존재 여부
	@Select("SELECT COUNT(*) FROM user_1 WHERE u_name=#{name} AND u_email=#{email}")
	public int idEmailCount(Map map);

	@Select("SELECT RPAD(SUBSTR(u_id,1,4),LENGTH(u_id),'*') FROM user_1 WHERE u_name=#{name} AND u_email=#{email}")
	public String idFind(Map map);

	@Update("UPDATE user_1 SET "
			+ "#{u_phone}, #{u_email}, #{u_post}, #{u_address1}, #{u_address2}, #{u_question}, #{u_answer} "
			+ "WHERE u_id=#{uid}")
	public void userUpdate(UserVO vo);

	@Select("SELECT u_password FROM user_1 WHERE u_id=#{uid}")
	public String userGetPassword(String uid);

	@Update("UPDATE user_1 SET u_password=#{password} WHERE u_id=#{uid}")
	public void userPwdUpdate(UserVO vo);
	
	
	/******************* User admin  ********************************/
	@Select("SELECT u_id, u_name, u_gender, u_email, u_phone, TO_CHAR(u_regdate,'YY-MM-DD')as u_regdate, u_grade,num "
			+ "FROM (SELECT u_id, u_name, u_gender, u_email, u_phone, u_regdate, u_grade, rownum as num "
			+ "FROM (SELECT u_id, u_name, u_gender, u_email, u_phone, u_regdate, u_grade from user_1)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<UserVO> userList(Map map);
	
	/* 페이징 사용 */
	@Select("SELECT CEIL(COUNT(*) / 10.0) " + "FROM user_1 ")
	public int userTotalPage();
	
	/* 페이징 사용 */
	@Select("SELECT COUNT(*) FROM user_1")
    public int userCount();
	
	/* 유저등급 변경 */
	 @Update("UPDATE user_1 SET u_grade=#{grade} WHERE u_id=#{uid}")
	 public int gradeupdate(Map map);
	 
}