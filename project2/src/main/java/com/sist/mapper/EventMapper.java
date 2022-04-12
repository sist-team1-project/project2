package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventMapper {

    @Select("select * from event_1")
    public List<EventVO> eventList();
    
    @Insert("INSERT INTO event_1 VALUES(#{e_id}, #{e_title}")
    public void insertEvent(EventVO vo);
}