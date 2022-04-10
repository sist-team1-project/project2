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
            + "FROM user_1 WHERE u_id=#{id}")
    public UserVO userInfo(String id);

    // 아이디 찾기: 이름 & 이메일 존재 여부
    @Select("SELECT COUNT(*) FROM user_1 WHERE u_name=#{name} AND u_email=#{email}")
    public int nameEmailCount(Map map);
    
    // 아이디 찾기: 아이디 결과
    @Select("SELECT RPAD(SUBSTR(u_id,1,4),LENGTH(u_id),'*') FROM user_1 WHERE u_name=#{name} AND u_email=#{email}")
    public String idFind(Map map);
    
    // 회원정보 수정
    @Update("UPDATE user_1 SET "
            + "#{u_phone}, #{u_email}, #{u_post}, #{u_address1}, #{u_address2}, #{u_question}, #{u_answer} "
            + "WHERE u_id=#{u_id}")
    public void userUpdate(UserVO vo);
    
    // 비밀번호 찾기: 아이디 & 이메일 존재 여부
    @Select("SELECT COUNT(*) FROM user_1 WHERE u_id=#{id} AND u_email=#{email}")
    public int idEmailCount(Map map);
    
    // 비밀번호 찾기: 질문 가져오기
    @Select("SELECT u_question FROM user_1 WHERE u_id=#{id} AND u_email=#{email}")
    public String questionFind(Map map);
    
    // 비밀번호 찾기: 질문 & 답변 일치 여부
    @Select("SELECT COUNT(*) FROM user_1 WHERE u_id=#{id} AND u_question=#{question} AND u_answer=#{answer}")
    public int questionAnswerCount(Map map);
    
    // 비밀번호 수정: 비밀번호 재확인
    @Select("SELECT u_password FROM user_1 WHERE u_id=#{id}")
    public String userGetPassword(String id);
    
    // 비밀번호 변경
    @Update("UPDATE user_1 SET u_password=#{password} WHERE u_id=#{id}")
    public void userPwdUpdate(Map map);
	
    // 계정 삭제
    @Delete("DELETE FROM user_1 WHERE u_id=#{id}")
    public void userDelete(String id);
    
	/******************* User admin  ********************************/
	@Select("SELECT u_id, u_name, u_gender, u_email, u_phone, TO_CHAR(u_regdate,'YY-MM-DD')as u_regdate, u_grade, num "
			+ "FROM (SELECT u_id, u_name, u_gender, u_email, u_phone, u_regdate, u_grade, rownum as num "
			+ "FROM (SELECT u_id, u_name, u_gender, u_email, u_phone, u_regdate, u_grade from user_1) "
			+ "ORDER BY u_regdate desc ) "
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