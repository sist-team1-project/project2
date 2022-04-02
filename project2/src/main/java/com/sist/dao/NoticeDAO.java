package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class NoticeDAO {
    
    @Autowired
    private NoticeMapper mapper;
    
    public List<NoticeVO> noticeListData(Map map)
    {
 	   return mapper.noticeListData(map);
    }
    
    public int noticeTotalPage()
    {
 	   return mapper.noticeTotalPage();
    }
    
    public void noticeInsert(NoticeVO vo)
    {
 	   mapper.noticeInsert(vo);
    }
    
    public NoticeVO noticeDetailData(int no)
    {
 	   mapper.noticevisitIncrement(no);
 	   return mapper.noticeDetailData(no);
    }
}