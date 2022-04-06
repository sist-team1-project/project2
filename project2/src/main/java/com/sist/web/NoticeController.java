package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.vo.*;
import com.sist.dao.*;
import java.util.*;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO dao;
	
	@GetMapping("notice/list.do")
	public String notice_list()
	{
	    return "notice/list";
	}
	
	@GetMapping("notice/insert.do")
	public String notice_insert()
	{
	    return "notice/insert";
	}
	
	@GetMapping("notice/insert_ok.do")
    @ResponseBody
    public String notice_insert_ok(NoticeVO vo)
    {
		dao.noticeInsertData(vo);
		return "ok";
	}
	@GetMapping("notice/detail.do")
	public String notice_detail(int no,Model model)
	{
		model.addAttribute("no", no);
		return "notice/detail";
	}
	   
	@GetMapping("notice/update.do")
	public String notice_notice_update(int no, Model model)
	{
		model.addAttribute("no", no);
		return "notice/update";
	}
}
