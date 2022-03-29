package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.sist.dao.*;
import com.sist.vo.*;
import java.util.*;

@Controller
public class AdminController2 {

	@Autowired
	private GoodsDAO dao;

	@GetMapping("admin/user.do")
	public String admin_user(String page, Model model) {
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (rowSize * curpage);
		map.put("start", start);
		map.put("end", end);

		int totalpage = dao.goodsTotalPage();
		int count = dao.goodsCount();
		count = count - ((rowSize * curpage) - rowSize);

		List<GoodsVO> list = dao.goodsTotalList(map);

		model.addAttribute("glist", list);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("count", count);

		return "admin/product";
	}
}
