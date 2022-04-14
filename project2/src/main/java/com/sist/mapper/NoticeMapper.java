package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface NoticeMapper {
    @Select("SELECT n_id,u_id,n_title,TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate,n_visits "
           + "FROM (SELECT n_id,u_id,n_title,n_regdate,n_visits,rownum as num "
		   + "FROM (SELECT /*+ INDEX_DESC(notice_1 notice_n_id_pk_1)*/n_id,u_id,n_title,n_regdate,n_visits "
		   + "FROM notice_1)) "
		   + "WHERE num BETWEEN #{start} AND #{end}")
    public List<NoticeVO> noticeListData(Map map);
    
    @Select("SELECT COUNT(*) FROM notice_1")
    public int noticeRowCount();
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM notice_1")
    public int noticeTotalPage();
    
    @Insert("INSERT INTO notice_1 "
            + "VALUES (notice_id_seq_1.nextval,#{u_id},#{n_title},#{n_content},"
            + "SYSDATE,0)")
    public void noticeInsertData(NoticeVO vo);
    
    @Update("UPDATE notice_1 SET "
            + "n_visits=n_visits+1 "
            + "WHERE n_id=#{nid}")
    public void noticeVisitIncrement(int nid);
    
    @Select("SELECT n_id,u_id,n_title,n_content,n_visits,"
            + "TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate "
            + "FROM notice_1 "
            + "WHERE n_id=#{nid}")
    public NoticeVO noticeDetailData(int nid);
    
    @Update("UPDATE notice_1 SET "
  		    + "n_title=#{n_title},n_content=#{n_content} "
  		    + "WHERE n_id=#{n_id}")
    public void noticeUpdate(NoticeVO vo);
    
    @Delete("DELETE FROM notice_1 "
  		    + "WHERE n_id=#{nid}")
    public void noticeDelete(int nid);
    
    @Select("SELECT n_id,n_title "
            + "FROM (SELECT n_id,n_title,rownum as num "
            + "FROM (SELECT /*+ INDEX_DESC(notice_1 notice_n_id_pk_1)*/n_id,n_title FROM notice_1)) "
            + "WHERE num BETWEEN 1 AND 3")
    public List<NoticeVO> headerNotice();
}