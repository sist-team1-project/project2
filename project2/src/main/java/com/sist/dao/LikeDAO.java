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
    
	public void likeInsert(LikeVO vo) {
		mapper.likeInsert(vo);
	}
	
}