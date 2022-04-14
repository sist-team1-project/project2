package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventMapper {

    @Select("select * from event_1 ORDER BY e_id")
    public List<EventVO> eventList();
    
    @SelectKey(keyProperty = "e_id", resultType = int.class, before = true, statement = "SELECT NVL(MAX(e_id)+1,1) as e_id FROM event_1")
    @Insert("INSERT INTO event_1 VALUES(#{e_id}, #{e_title})")
    public void insertEvent(EventVO vo);
    
    @Delete("DELETE FROM event_1 WHERE e_id = #{e_id}")
    public void deleteEvent(EventVO vo);
}