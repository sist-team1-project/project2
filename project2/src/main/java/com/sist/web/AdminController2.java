package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin/")
public class AdminController2 {

	@Autowired
	private GoodsDAO dao;

	@Autowired
	private AskDAO adao;
	
	/************** 상품 관리 페이지 이동 ***************/
	@GetMapping("adlist.do")
	public String admin_user(Model model, HttpSession session) {
	    String grade = ((String)session.getAttribute("grade"));
	    if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
		return "admin/goods_admin";
	}
	/************************************************/
	
	/*************** 상품 추가 페이지 이동 ***************/
	/* ---- 상품 추가 페이지 이동 ---- */
	@GetMapping("goods_add.do")
	public String goods_add_vue(HttpSession session) {
	    String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
	    
		return "admin/goods_add";
	}
	/************************************************/
	
	/**************** 상품 수정 페이지 *****************/
	@GetMapping("goods_update.do")
	public String goods_update(String g_id, Model model, HttpSession session) {
	    String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
		model.addAttribute("gid", g_id);
		return "admin/goods_update";
	}
	/************************************************/
	
	/******************** 문의 관리 ********************/
	@GetMapping("ask.do")
	public String admin_ask(String page, Model model, HttpSession session) {
	    String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
		if (page == null) {
			page = "1";
		}

		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		
		map.put("start", start);
		map.put("end", end);

		List<AskVO> list = adao.askAdminListData(map);

		int totalpage = adao.askAdminTotalPage();

		int count = adao.askRowCount();
		
		final int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage)
			endPage = totalpage;

		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("count", count);
		return "admin/ask_admin";
	}
	
    @GetMapping("ask_detail.do")
    public String askDetailData(int no, Model model, HttpSession session) {
        String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
        AskVO vo = adao.askDetailData(no);
        int count = adao.askCount(vo.getA_group_id());
        model.addAttribute("vo", vo);
        model.addAttribute("count", count);
        return "admin/ask_detail";
    }
    
    @GetMapping("ask_delete.do")
    public String askDelete(int no, Model model, HttpSession session) {
        String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
        model.addAttribute("no", no);
        return "admin/ask_delete";
    }    
    
    @GetMapping("ask_reply.do")
    public String askReply(int no, Model model, HttpSession session) {
        String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
        model.addAttribute("no", no);
        return "admin/ask_reply";
    }
    /************************************************/
	
    /************* 카테고리&이벤트 추가 페이지 *************/
	@GetMapping("event_Insert.do")
	public String evca_Insert(HttpSession session) {
	    String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
		return "admin/event_Insert";
	}
	/************************************************/
}
