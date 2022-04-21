package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface LikesMapper {

    @Insert("INSERT INTO likes VALUES(#{l_id},#{u_id},#{g_id})")
    @SelectKey(statement="SELECT likes_id_seq.NEXTVAL FROM DUAL", keyProperty="l_id", before=true, resultType=int.class)
    public int likeInsert(LikeVO vo);
    
    @Delete("DELETE FROM likes WHERE u_id=#{u_id} AND l_id=#{l_id}")
    public void likeDelete(LikeVO vo);
    
    @Select("SELECT l_id,g_id,g_name "
            + "FROM (SELECT l_id,g_id,g_name,rownum AS num FROM "
            + "(SELECT l.l_id,l.g_id,g.g_name "
            + "FROM (SELECT /*+ INDEX(likes likes_f_id_pk)*/ l_id,g_id FROM likes WHERE u_id=#{uid}) l, (SELECT g_id,g_name FROM goods) g WHERE l.g_id=g.g_id)) "
            + "WHERE num BETWEEN #{start} AND #{end}")
    public List<Map<String,Object>> likeList(Map map);
    
    @Select("SELECT CEIL(COUNT(*) / 10.0) FROM likes WHERE u_id=#{uid}")
    public int likeListTotalPage(String uid);
}