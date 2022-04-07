package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface LikeMapper {

    @Insert("INSERT INTO like_1 VALUES(like_id_seq_1.NEXTVAL,#{u_id},#{g_id})")
    public void likeInsert(LikeVO vo);
}