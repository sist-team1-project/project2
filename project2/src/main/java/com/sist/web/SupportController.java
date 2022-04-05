package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("support/")
public class SupportController {

	@Autowired
	private NoticeDAO dao;
	
	@GetMapping("notice.do")
    public String notice_list(String page,Model model)
    {
        if(page==null)
      	   page="1";  
        int curpage=Integer.parseInt(page);
        Map map=new HashMap();
        int rowSize=10;
        int start=(rowSize*curpage)-(rowSize-1); 
        int end=rowSize*curpage; 
        map.put("start", start);
        map.put("end", end);
        List<NoticeVO> list=dao.noticeListData(map);
	      
        int totalpage=dao.noticeTotalPage();
	       
	    int count=dao.noticeRowCount();
	    count=count-((curpage*rowSize)-rowSize);
	    final int BLOCK=3;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
        int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	       
	    if(endPage>totalpage)
	  	   endPage=totalpage; 
	       
	    model.addAttribute("list", list);
	    model.addAttribute("curpage", curpage);
	    model.addAttribute("totalpage", totalpage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
	    model.addAttribute("count", count);
	       
		return "support/notice";
	}
    
    @GetMapping("notice_insert.do")
    public String notice_insert()
    {
 	   return "support/notice_insert";
    }
    
    @PostMapping("notice_insert_ok.do")
    public String notice_insert_ok(NoticeVO vo)
    {
 	   dao.noticeInsertData(vo);
 	   return "redirect:notice.do";
    }
    
    @GetMapping("notice_detail.do")
    public String notice_detail(int nid,Model model)
    {
    	NoticeVO vo=dao.noticeDetailData(nid);
    	model.addAttribute("vo", vo);
    	return "support/notice_detail";
    }
    
    @GetMapping("notice_update.do")
    public String freeboard_update(int no,Model model)
    {
 	   NoticeVO vo=dao.noticeUpdateData(vo);;
 	   model.addAttribute("vo", vo);
 	   return "support/notice_update";
    }
    
    @GetMapping("board.do")
    public String support_board() {
        return "support/board";
    }
}
