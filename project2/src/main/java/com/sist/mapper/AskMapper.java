package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface AskMapper {
	@Select("SELECT a_id,u_id,a_type,a_title,TO_CHAR(a_regdate,'YYYY-MM-DD') as a_regdate,"
			 +"a_group_tab,num "
			 +"FROM (SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_tab,rownum as num "
			 +"FROM (SELECT a_id,u_id,a_type,a_title,a_regdate,a_group_tab "
			 +"FROM ask_1 ORDER BY a_group_id DESC, a_group_step ASC)) "
			 +"WHERE num BETWEEN #{start} AND #{end}")
	public List<AskVO> askListData(Map map);

	@Select("SELECT COUNT(*) FROM ask_1")
	public int askRowCount();

	@Insert("INSERT INTO ask_1(a_id,u_id,a_type,a_title,a_content,a_group_id) "
			+"VALUES(ask_id_seq_1.nextval,#{u_id},#{a_type},#{a_title},#{a_content},"
			+"(SELECT NVL(MAX(a_group_id)+1,1) FROM ask_1))")
	public void askInsert(AskVO vo);

	@Select("SELECT a_id,a_type,a_title,a_content,"
			+"TO_CHAR(a_regdate,'YYYY-MM-DD') as a_regdate,a_group_id,a_group_step "
			+"FROM ask_1 "
			+"WHERE a_id=#{a_id}")
	public AskVO askDetailData(int no);

	@Select("SELECT COUNT(*) FROM ask_1 "
			+"WHERE a_group_id=#{a_group_id} AND a_group_step=1")
	public int askCount(int a_group_id);

	@Select("SELECT a_group_id,a_group_step,a_group_tab "
			+"FROM ask_1 "
			+"WHERE a_id=#{a_id}")
	public AskVO askParentInfoData(int no);

	@Insert("INSERT INTO ask_1(a_id,u_id,a_type,a_content,"
			+"a_group_id,a_group_step,a_group_tab) "
			+"VALUES(ask_id_seq_1.nextval,"
			+"#{u_id},#{a_type},#{a_content},"
			+"#{a_group_id},#{a_group_step},#{a_group_tab})")
	public void askReplyInsert(AskVO vo);

	@Update("UPDATE ask_1 SET "
			+"u_id=#{u_id},a_type=#{a_type},a_a_content=#{a_content} "
			+"WHERE a_id=#{a_id}")
	public void askUpdate(AskVO vo);

	@Delete("DELETE FROM ask_1 "
			+"WHERE a_group_id=#{a_group_id}")
	public void askDelete1(int a_group_id);
	
	@Delete("DELETE FROM ask_1 "
			+"WHERE a_id=#{a_id}")
	public void askDelete2(int no);
	
}