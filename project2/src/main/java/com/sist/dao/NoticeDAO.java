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
    
    public NoticeVO noticeDetailData(int nid)
    {
 	    mapper.noticevisitIncrement(nid);
 	    return mapper.noticeDetailData(nid);
    }
    
    public NoticeVO noticeUpdateData(int no)
    {
 	   return mapper.noticeDetailData(no);
    }
    
    public boolean noticeUpdate(NoticeVO vo)
    {
 	   boolean bCheck=false;
 	   String db_pwd=mapper.noticeGetPassword(vo.getN_id());
 	   if(db_pwd.equals(vo.getN_pwd()))
 	   {
 		   bCheck=true;
 		   mapper.noticeUpdate(vo);
 	   }
 	   return bCheck;
    }
    
    public boolean noticeDelete(int no,String pwd)
    {
 	   boolean bCheck=false;
 	   String db_pwd=mapper.noticeGetPassword(no);
 	   if(db_pwd.equals(pwd))
 	   {
 		   bCheck=true;
 		   mapper.noticeDelete(no);
 	   }
 	   else
 	   {
 		   bCheck=false;
 	   }
 	  return bCheck;
    }
}