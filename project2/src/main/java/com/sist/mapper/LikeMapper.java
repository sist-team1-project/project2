package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface LikeMapper {

    @Insert("INSERT INTO like_1 VALUES(like_id_seq_1.NEXTVAL,#{u_id},#{g_id})")
    public void likeInsert(LikeVO vo);
    
    @Delete("DELETE FROM like_1 WHERE u_id=#{u_id} AND l_id=#{l_id}")
    public void likeDelete(LikeVO vo);
}