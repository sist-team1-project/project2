package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class NoticeRestController {

	@Autowired
	private NoticeDAO dao;
	
	@GetMapping(value="notice/list_vue.do",produces = "text/plain;charset=utf-8")
	   public String notice_list_vue(String page)
	   {
		   String result="";
		   try
		   {
			   if(page==null)
				   page="1";
			   int curpage=Integer.parseInt(page);  
			   Map map=new HashMap();
			   int rowSize=10;
			   int start=(rowSize*curpage)-(rowSize-1);
			   int end=rowSize*curpage;
			   map.put("start",start);
			   map.put("end", end);
			   List<NoticeVO> list=dao.noticeListData(map);
			   int totalpage=dao.noticeTotalPage();
			   
			   JSONArray arr=new JSONArray(); 
			   int i=0;
			   for(NoticeVO vo:list)
			   {
				   JSONObject obj=new JSONObject();
				   obj.put("nid", vo.getN_id());
				   obj.put("ntitle", vo.getN_title());
				   obj.put("uid", vo.getU_id());
				   obj.put("nregdate", vo.getN_regdate());
				   obj.put("nvisits", vo.getN_visits());
				   if(i==0)
				   {
					   obj.put("curpage", curpage);
					   obj.put("totalpage", totalpage);
				   }
				   arr.add(obj);
				   i++;
			   }
			   result=arr.toJSONString();
		   }catch(Exception ex){}
		  
		   return result;
	   }
	
    @GetMapping(value="notice/detail_vue.do",produces = "text/plain;charset=utf-8")
	   public String notice_detail_vue(int no)
	   {
		   String result="";
		   try
		   {
			   NoticeVO vo=dao.noticeDetailData(no);
			   JSONObject obj=new JSONObject();
			   obj.put("nid", vo.getN_id());
			   obj.put("ntitle", vo.getN_title());
			   obj.put("uid", vo.getU_id());
			   obj.put("nregdate", vo.getN_regdate());
			   obj.put("ncontent", vo.getN_content());
			   obj.put("nvisits", vo.getN_visits());
			   
			   result=obj.toJSONString();
			   System.out.println(result);
		   }catch(Exception ex){}
		   
		   return result;
	   }
    
    @GetMapping(value = "notice/delete_ok.do",produces = "text/plain;charset=utf-8")
    public String board_delete(int no,String pwd)
    {
 	   String result="";
 	   boolean bCheck=dao.noticeDelete(no, pwd);
 	   if(bCheck==true)
 	   {
 		   result="YES";
 	   }
 	   else
 	   {
 		   result="NO";
 	   }
 	   return result;
    }
}