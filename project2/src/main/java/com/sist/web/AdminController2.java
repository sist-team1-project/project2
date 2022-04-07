package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

@Controller
@RequestMapping("admin/")
public class AdminController2 {

	@Autowired
	private GoodsDAO dao;

	@GetMapping("adlist.do")
	public String admin_user(String page, Model model) {

		return "admin/product";
	}

	@GetMapping("goods_add.do")
	public String goods_add_vue() {
		return "admin/goods_add";
	}

	@GetMapping("goods_update.do")
	public String goods_update(int g_id, Model model) {
		/*
		 * @GetMapping("update.do")
		   public String replyUpdate(int no,Model model)
		   {
			   ReplyVO vo=dao.replyUpdateData(no);
			   model.addAttribute("vo", vo);
			   return "reply/update";
		   } 
		 * 
		 */
		Map map = new HashMap();
		map.put("g_id", g_id);

		GoodsVO vo = dao.goodsDetail(map);

		model.addAttribute("vo", vo);
		return "admin/goods_update";
	}

	@GetMapping("inquiry_admin.do")
	public String inquiry_admin() {
		return "admin/inquiry_admin";
	}

	@GetMapping("user_management.do")
	public String user_management() {
		return "admin/user_management";
	}
}
