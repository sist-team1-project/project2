package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class EventGoodsDAO {
    
    @Autowired
    private EventGoodsMapper mapper;
    
}