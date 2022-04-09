package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface LikeMapper {

    @Insert("INSERT INTO like_1 VALUES(#{l_id},#{u_id},#{g_id})")
    @SelectKey(statement="SELECT like_id_seq_1.NEXTVAL FROM DUAL", keyProperty="l_id", before=true, resultType=int.class)
    @Options(useGeneratedKeys=true, keyProperty="l_id", keyColumn="l_id")
    public int likeInsert(LikeVO vo);
    
    @Delete("DELETE FROM like_1 WHERE u_id=#{u_id} AND l_id=#{l_id}")
    public void likeDelete(LikeVO vo);
}