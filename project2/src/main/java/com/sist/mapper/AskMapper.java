package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface AskMapper {
    
    /****************** 1:1문의 사용자 ******************/
	@Select("SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_id,a_group_tab,a_group_step "
	        + "FROM (SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_id,a_group_tab,a_group_step,rownum as num "
	        + "FROM (SELECT a_id,u_id,a_type,a_title,TO_CHAR(a_regdate,'YYYY-MM-DD') as a_regdate,a_group_id,a_group_tab,a_group_step "
	        + "FROM ask "
	        + "WHERE a_group_id IN (SELECT a_group_id FROM ask WHERE u_id=#{u_id}) "
	        + "ORDER BY a_group_id DESC, a_group_step ASC)) "
	        + "WHERE num BETWEEN #{start} AND #{end}")
	public List<AskVO> askListData(Map map);
	
	@Select("SELECT COUNT(*) FROM ask")
	public int askRowCount();
	
	@Select("SELECT CEIL(COUNT(*) / 10.0) FROM ask WHERE a_group_id IN (SELECT a_group_id FROM ask WHERE u_id=#{u_id})")
	public int askTotalPage(Map map);
	
	
	/****************** 1:1문의 관리자 ******************/
	@Select("SELECT a_id,u_id,a_type,a_title,TO_CHAR(a_regdate,'YYYY-MM-DD') as a_regdate,"
			+"a_group_id,a_group_tab, a_group_step, num "
			+"FROM (SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_id,a_group_tab, a_group_step, rownum as num "
			+"FROM (SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_id,a_group_tab, a_group_step "
			+"FROM ask ORDER BY a_group_id DESC, a_group_step ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<AskVO> askAdminListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*) / 10.0) FROM ask")
	public int askAdminTotalPage();
	
	
	/****************** 공통 ******************/
	/* 1:1문의 추가 */
	@Insert("INSERT INTO ask(a_id,u_id,a_type,a_title,a_content,a_group_id) "
			+"VALUES(ask_id_seq.nextval,#{u_id},#{a_type},#{a_title},#{a_content},"
			+"(SELECT NVL(MAX(a_group_id)+1,1) FROM ask))")
	public void askInsert(AskVO vo);
	
	/* 1:1문의 상세 */
	@Select("SELECT a_id,a_type,a_title,a_content,"
			+"TO_CHAR(a_regdate,'YYYY-MM-DD') as a_regdate,a_group_id,a_group_step,a_group_tab "
			+"FROM ask "
			+"WHERE a_id=#{a_id}")
	public AskVO askDetailData(int aid);

	/* 1:1문의 문의갯수 */
	@Select("SELECT COUNT(*) FROM ask "
			+"WHERE a_group_id=#{a_group_id} AND a_group_step=1")
	public int askCount(int a_group_id);

	/* 1:1문의 문의정보 */
	@Select("SELECT a_group_id,a_group_step,a_group_tab "
			+"FROM ask "
			+"WHERE a_id=#{a_id}")
	public AskVO askParentInfoData(int aid);

	@Insert("INSERT INTO ask(a_id,u_id,a_type,a_title,a_content,"
			+"a_group_id,a_group_step,a_group_tab) "
			+"VALUES(ask_id_seq.nextval,"
			+"#{u_id},#{a_type},#{a_title},#{a_content},"
			+"#{a_group_id},#{a_group_step},#{a_group_tab})")
	public void askReplyInsert(AskVO vo);

	/* 1:1문의 문의삭제 */
	@Delete("DELETE FROM ask "
			+"WHERE a_group_id=#{a_group_id}")
	public void askDelete1(int a_group_id);
	
	/* 1:1문의 답글삭제 */
	@Delete("DELETE FROM ask "
			+"WHERE a_id=#{a_id}")
	public void askDelete2(int aid);
	
	/* 1:1문의 문의답변 탭증가 */
	@Update("UPDATE ask SET a_group_tab = #{a_group_tab}+1 "
			+ "WHERE a_id = #{a_id} ")
	public void asktabReply(AskVO vo);
	
	/* 1:1문의 유저정보 확인 */
	@Select("SELECT u_id FROM ask WHERE a_id=#{a_id}")
	public String checkUser(int a_id);
}











