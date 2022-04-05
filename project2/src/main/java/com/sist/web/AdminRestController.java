package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.service.*;

@RestController
public class AdminRestController {

	@Autowired
	private AdminService service;
	
	@Autowired
	private OrderDAO odao;
	
	@Autowired
	private OrderDetailDAO oddao;
	
	@GetMapping(value = "admin/orderlist_vue.do", produces = "text/plain;charset=utf-8")
	public String orderlist(String page) {
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

		List<OrderVO> list = odao.orderList(map);
		int totalpage = odao.orderTotalPage();

		JSONArray arr = new JSONArray();
		int i = 0;

		int count = odao.orderCount();

		System.out.println(start);
		System.out.println(end);
		System.out.println("토탈페이지 : " + totalpage);
		System.out.println("카운트 : " + count);

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		for (OrderVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("oid", vo.getO_id());
			obj.put("uid", vo.getU_id());
			obj.put("regdate", vo.getO_regdate());
			obj.put("state", vo.getO_state());
			obj.put("startPage", startPage);
			obj.put("endPage", endPage);

			if (i == 0) {
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
				obj.put("count", count);
			}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "admin/orderlistdetail_vue.do", produces = "text/plain;charset=utf-8")
	public String orderlistdetail_vue(String oid) {
		System.out.println(oid);
		JSONArray arr = new JSONArray();

		List<OrderDetailVO> list = oddao.orderDetail(oid);
		for (OrderDetailVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("odid", vo.getOd_id());
			obj.put("oid", vo.getO_id());
			obj.put("gid", vo.getG_id());
			
			String g_name = vo.getG_name();
			if (g_name.length() > 18) {
				g_name = g_name.substring(0, 18) + "...";
			}
			vo.setG_name(g_name);
			
			obj.put("price", vo.getG_price());
			obj.put("sale", vo.getG_sale());
			obj.put("quantity", vo.getG_quantity());
			
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	/**************** 주문상세페이지 ********************/
	@GetMapping(value = "admin/orderdetail.do", produces = "text/plain;charset=utf-8")
	public String orderdetail_vue(String oid) {
		System.out.println(oid);
		JSONArray arr = new JSONArray();

		List<OrderDetailVO> list = oddao.orderDetail(oid);

		for (OrderDetailVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("odid", vo.getOd_id());
			obj.put("oid", vo.getO_id());
			obj.put("gid", vo.getG_id());
			obj.put("name", vo.getG_name());
			obj.put("price", vo.getG_price());
			obj.put("sale", vo.getG_sale());
			obj.put("quantity", vo.getG_quantity());
			
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "admin/order.do", produces = "text/plain;charset=utf-8")
	public String order_vue(String oid) {

		OrderVO ovo = odao.order(oid);
			JSONObject obj = new JSONObject();
			obj.put("oid", ovo.getO_id());
			obj.put("uid", ovo.getU_id());
			obj.put("receiver", ovo.getO_receiver());
			obj.put("phone", ovo.getO_phone());
			obj.put("post", ovo.getO_post());
			obj.put("addr1", ovo.getO_address1());
			obj.put("addr2", ovo.getO_address2());
			obj.put("request", ovo.getO_request());
			obj.put("regdate", ovo.getO_regdate());
			obj.put("shipping", ovo.getO_shipping());
			obj.put("state", ovo.getO_state());
			
		return obj.toJSONString();
	}
}
