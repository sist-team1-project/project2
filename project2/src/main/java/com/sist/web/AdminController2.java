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

	@Autowired
	private AskDAO adao;

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
		String cid1 = vo.getC_id().substring(0, 3);
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

	@GetMapping("ask_admin.do")
	public String ask_admin(String page, Model model) {
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
		List<AskVO> list = adao.askListData(map);
		int totalpage = adao.askTotalPage();

		int count = adao.askRowCount();
		count = count - ((curpage * rowSize) - rowSize);
		final int BLOCK = 3;
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

}
