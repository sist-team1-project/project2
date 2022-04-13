package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CommentMapper {

	@Select("SELECT co_content,TO_CHAR(co_regdate,'YYYY-MM-DD') as co_regdate "
			+"FROM (SELECT co_content,co_regdate,rownum as num "
			+"FROM (SELECT /*+ INDEX_DESC(comment_1 comment_co_id_pk_1)*/co_content,co_regdate "
			+"FROM comment_1)) "
			+"WHERE n_id=#{n_id}")
	public List<CommentVO> commentListData(Map map);
	
	@Select("SELECT COUNT(*) FROM notice_1")
    public int commentRowCount();
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM notice_1")
    public int commentTotalPage();
	
    @Insert("INSERT INTO comment_1 (co_id,u_id,co_content,co_regdate) "
     		+"VALUES (comment_id_seq_1.nextval,#{u_id},#{co_content},"
     		+"SYSDATE)")
    public void commentInsertData(CommentVO vo);
}