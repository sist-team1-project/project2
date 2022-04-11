package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class CampingDAO {
    
    @Autowired
    private CampingMapper mapper;
    
    public List<Map<String, Object>> campingRecommend(Map map) {
    	return mapper.campingRecommend(map);
    }
}