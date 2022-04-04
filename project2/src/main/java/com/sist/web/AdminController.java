package com.sist.web;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

import sun.print.resources.serviceui;

import com.sist.service.AdminService;

@Controller
@RequestMapping("admin/")
public class AdminController {
	@Autowired
	private AdminService service;

	@Autowired
	private OrderDAO odao;
	
	@Autowired
	private OrderDetailDAO oddao;
	
	@GetMapping("orderlist.do")
	public String orderlist(String page, Model model) {
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

		int totalpage = odao.orderTotalPage();
		int count = odao.orderCount();
				
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("count", count);

		return "admin/order";
	}

	
	@GetMapping("orderdetail.do")
	public String adorder_detail() {

		return "admin/orderdetail";
	}

}
