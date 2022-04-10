package com.sist.dao;

import java.util.HashMap;
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
    
    public int noticeRowCount()
    {
    	return mapper.noticeRowCount();
    }
    
    public int noticeTotalPage()
    {
 	    return mapper.noticeTotalPage();
    }
    
    public void noticeInsertData(NoticeVO vo)
    {
 	    mapper.noticeInsertData(vo);
    }
    
    public NoticeVO noticeDetailData(int no)
    {
 	    mapper.noticeVisitIncrement(no);
 	    return mapper.noticeDetailData(no);
    }
    
    public NoticeVO noticeUpdateData(int no)
    {
 	   return mapper.noticeDetailData(no);
    }
    
    public void noticeUpdate(NoticeVO vo)
    {
 		   mapper.noticeUpdate(vo);
    }
    
    public void noticeDelete(int no,String pwd)
    {
 		   mapper.noticeDelete(no);
    }
}