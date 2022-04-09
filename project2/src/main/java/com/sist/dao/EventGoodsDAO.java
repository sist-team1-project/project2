package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class EventGoodsDAO {
    
    @Autowired
    private EventGoodsMapper mapper;
    
    public List<Map<String,Object>> eventGoodsList(String uid) {
        return mapper.eventGoodsList(uid);
    }
}