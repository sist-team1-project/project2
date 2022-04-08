package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class EventDAO {
    
    @Autowired
    private EventMapper mapper;
    
    public List<EventVO> eventList(){
        return mapper.eventList();
    }
}