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
	
	@Autowired
	private UserDAO udao;
	
	/* 판매관리목록 */
	@GetMapping("orderlist.do")
	public String adorder(String oid, Model model) {
		if(oid==null) oid="";
		model.addAttribute("oid",oid);
		return "admin/order";
	}
	/* 주문상세 */
	@GetMapping("orderdetail.do")
	public String adorder_detail(String oid, Model model) {
		model.addAttribute("oid",oid);
		return "admin/orderdetail/vue";
	}
	/* 유저 관리 */
	@GetMapping("user_management.do")
	public String userlist(String uid, Model model) {
		model.addAttribute("u_id",uid);
		return "admin/user_management";
	}
}