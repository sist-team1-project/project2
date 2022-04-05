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

	@PostMapping("goods_add_ok.do")
	public String goods_add_vue_ok(GoodsVO vo, int e_id) {
		dao.goodsInsert(vo, e_id);
		return "redirect:admin/adlist.do";
	}
	
	@GetMapping("goods_update.do")
	public String goods_update(int no, Model model) {
		// mapper , dao 필요
		// 모델 이용해서 전달
		return "goods_update";
	}
}
