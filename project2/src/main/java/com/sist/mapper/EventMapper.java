package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface EventMapper {

    @Select("select * from event_1 ORDER BY e_id")
    public List<EventVO> eventList();
    
    @Insert("INSERT INTO event_1 VALUES(event_id_seq_1.nextval, #{e_title})")
    public void insertEvent(EventVO vo);
    
    @Delete("DELETE FROM event_1 WHERE e_title = #{e_title}")
    public void deleteEvent(EventVO vo);
}