package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class SupportController {

	@Autowired
	private NoticeDAO dao;
	
    @GetMapping("support/notice.do")
    public String support_notice() {
        return "support/notice";
    }
    
    @GetMapping("support/insert.do")
    public String notice_insert()
    {
 	   return "notice/insert";
    }
    @GetMapping("support/insert_ok.do")
    @ResponseBody
    public String notice_insert_ok(NoticeVO vo)
    {
 	   dao.noticeInsert(vo);
 	   return "ok";
    }
    @GetMapping("support/notice_detail.do")
    public String notice_detail(int no,Model model)
    {
 	   model.addAttribute("no", no);
 	   return "support/notice_detail";
    }
    @GetMapping("support/board.do")
    public String support_board() {
        return "support/board";
    }
}
