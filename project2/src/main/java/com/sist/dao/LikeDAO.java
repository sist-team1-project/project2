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
	private LikeMapper mapper;
    
	public int likeInsert(LikeVO vo) {
		return mapper.likeInsert(vo);
	}
	
	public void likeDelete(LikeVO vo) {
	    mapper.likeDelete(vo);
	}
}
