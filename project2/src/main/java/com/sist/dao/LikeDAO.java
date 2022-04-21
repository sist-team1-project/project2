package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class LikeDAO {

	@Autowired
	private LikesMapper mapper;
    
	public int likeInsert(LikeVO vo) {
		return mapper.likeInsert(vo);
	}
	
	public void likeDelete(LikeVO vo) {
	    mapper.likeDelete(vo);
	}
	
	public List<Map<String,Object>> likeList(Map map) {
	    return mapper.likeList(map);
	}
	
	public int likeListTotalPage(String uid) {
	    return mapper.likeListTotalPage(uid);
	}
}
