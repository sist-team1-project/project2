package com.sist.web;

import org.snu.ids.ha.index.Keyword;

import org.snu.ids.ha.index.KeywordExtractor;
import org.snu.ids.ha.index.KeywordList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 *   JSP => 요청 => Model => 전송받은 데이터 출력 => JSP
 *        ------  ------    -----------------------
 *        DispatcherServlet       ViewResolver(InternalResourceViewResolver,TilesView)
 *                HandlerMapping  ---------------------------------
 *                --------------      => 경로명 , 확장자 
 *                1. 클래스 찾기                  => 등록된 리턴형  ==> 
 *                   @Controller
 *                   @RestController 
 *                2. 메소드 찾기
 *                   @RequestMapping
 *                   @Getmapping
 *                   @PostMapping
 *                => 1) 에러 (Autowired,404)
 */
import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;

@Controller 
@RequestMapping("ask/")
public class AskController {
	
   @Autowired 
   private AskDAO dao;
   
   @GetMapping("list.do")
   public String askListData(String page, Model model)
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
       List<AskVO> list=dao.askListData(map);
      
       int totalpage=dao.askTotalPage();
       
       int count=dao.askRowCount();
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
	   return "ask/list";
   }
   
   @GetMapping("insert.do")
   public String askInsert()
   {
	   return "ask/insert";
   }
   
   @PostMapping("insert_ok.do")
   public String askInsertOk(AskVO vo)
   {
	   dao.askInsert(vo);
	   return "redirect:list.do";
   }
   
   @GetMapping("detail.do")
   public String askDetailData(int no,Model model)
   {
	   AskVO vo=dao.askDetailData(no);
	   int count=dao.askCount(vo.getA_group_id());
	   model.addAttribute("vo", vo);
	   model.addAttribute("count", count);
	   return "ask/detail";
   }
   
   @GetMapping("ask.do")
   public String askReply(int no, Model model)
   {
	   model.addAttribute("no", no);
	   return "ask/reply";
   }
   
   @PostMapping("ask_ok.do")
   public String askReplyInsert(int pno, AskVO vo)
   {
	   AskVO pvo=dao.askParentInfoData(pno);
	   vo.setA_group_id(pvo.getA_group_id());
	   vo.setA_group_step(pvo.getA_group_step()+1);
	   vo.setA_group_tab(pvo.getA_group_tab()+1);
	   
	   dao.askaskInsert(vo);
	   
	   return "redirect:list.do";
   }
   
   @GetMapping("update.do")
   public String askUpdate(int no,Model model)
   {
	   AskVO vo=dao.askUpdateData(no);
	   model.addAttribute("vo", vo);
	   return "ask/update";
   }
   
   @GetMapping("delete.do")
   public String askDelete(int no,Model model)
   {
	   model.addAttribute("no", no);
	   return "ask/delete";
   }
}









