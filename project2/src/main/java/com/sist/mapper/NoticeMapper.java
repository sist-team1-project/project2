package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface NoticeMapper {
    @Select("SELECT n_id,u_id,n_title,TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate,n_visits "
           +"FROM (SELECT n_id,u_id,n_title,n_regdate,n_visits,rownum as num "
		   +"FROM (SELECT /*+ INDEX_DESC(notice_1 notice_n_id_pk_1)*/n_id,u_id,n_title,n_regdate,n_visits "
		   +"FROM notice_1)) "
		   +"WHERE num BETWEEN #{start} AND #{end}")
    public List<NoticeVO> noticeListData(Map map);
    
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM notice_1")
    public int noticeTotalPage();

    @Insert("INSERT INTO notice_1 VALUES("
  		 +"#{n_id},#{u_id},#{n_title},#{n_content},"
  		 +"SYSDATE,0)")
    public void noticeInsert(NoticeVO vo);
    
    @Update("UPDATE notice_1 SET "
  		 +"n_visits=n_visits+1 "
  		 +"WHERE n_id=#{n_id}")
    public void noticevisitIncrement(int no);
    
    @Select("SELECT n_id,u_id,n_title,n_content,n_visits,"
  		 +"TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate "
  		 +"FROM notice_1 "
  		 +"WHERE n_id=#{n_id}")
    public NoticeVO noticeDetailData(int no);
}