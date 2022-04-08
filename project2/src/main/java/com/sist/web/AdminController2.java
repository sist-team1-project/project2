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
	public String goods_update(String g_id, Model model) {

		GoodsVO vo = dao.goodsDetail(g_id);
		String cid1 = vo.getC_id().substring(0,3);
		String cid2 = vo.getC_id();
		
		int e_id = 0;
		
		try {
			int eidtest = dao.goodsEidData(g_id);
			System.out.println("eid : " + eidtest);
			e_id = eidtest;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		System.out.println("c_id : " + vo.getC_id());
		
		model.addAttribute("e_id", e_id);
		model.addAttribute("vo", vo);
		model.addAttribute("cid1", cid1);
		model.addAttribute("cid2", cid2);
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
