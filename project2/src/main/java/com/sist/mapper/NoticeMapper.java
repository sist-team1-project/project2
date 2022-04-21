package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface NoticeMapper {
		/* 공지사항 리스트 */
    @Select("SELECT n_id,u_id,n_title,TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate,n_visits "
           + "FROM (SELECT n_id,u_id,n_title,n_regdate,n_visits,rownum as num "
		   + "FROM (SELECT /*+ INDEX_DESC(notice notice_n_id_pk)*/n_id,u_id,n_title,n_regdate,n_visits "
		   + "FROM notice)) "
		   + "WHERE num BETWEEN #{start} AND #{end}")
    public List<NoticeVO> noticeListData(Map map);
    
    /* 공지사항 개수  */
    @Select("SELECT COUNT(*) FROM notice")
    public int noticeRowCount();
    
    /* 공지사항 총페이지 개수  */
    @Select("SELECT CEIL(COUNT(*)/10.0) FROM notice")
    public int noticeTotalPage();
    
    /* 공지사항 입력 (글쓰기)  */
    @Insert("INSERT INTO notice "
            + "VALUES (notice_id_seq.nextval,#{u_id},#{n_title},#{n_content},"
            + "SYSDATE,0)")
    public void noticeInsertData(NoticeVO vo);
    
    /* 공지사항 조회수 증가  */
    @Update("UPDATE notice SET "
            + "n_visits=n_visits+1 "
            + "WHERE n_id=#{nid}")
    public void noticeVisitIncrement(int nid);
    
    /* 공지사항 상세보기  */
    @Select("SELECT n_id,u_id,n_title,n_content,n_visits,"
            + "TO_CHAR(n_regdate,'YYYY-MM-DD') as n_regdate "
            + "FROM notice "
            + "WHERE n_id=#{nid}")
    public NoticeVO noticeDetailData(int nid);
    
    /* 공지사항 수정  */
    @Update("UPDATE notice SET "
  		    + "n_title=#{n_title},n_content=#{n_content} "
  		    + "WHERE n_id=#{n_id}")
    public void noticeUpdate(NoticeVO vo);
    
    /* 공지사항 삭제  */
    @Delete("DELETE FROM notice "
  		    + "WHERE n_id=#{nid}")
    public void noticeDelete(int nid);
    
    /* 헤더 공지사항  */
    @Select("SELECT n_id,n_title "
            + "FROM (SELECT n_id,n_title,rownum as num "
            + "FROM (SELECT /*+ INDEX_DESC(notice notice_n_id_pk)*/n_id,n_title FROM notice)) "
            + "WHERE num BETWEEN 1 AND 3")
    public List<NoticeVO> headerNotice();
}