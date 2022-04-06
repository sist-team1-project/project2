package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
	public String orderFull(String page) {
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		
        List<OrderVO> olist = service.orderList(map);
		JSONArray arr = new JSONArray();
		
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
		
		List<Map<String, Object>> list = odao.orderFullList(map);
		
		for (int i = 0; i < list.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("oid", list.get(i).get("OID").toString());
			obj.put("regdate", list.get(i).get("REGDATE").toString());
			obj.put("shipping", list.get(i).get("SHIPPING").toString());
			obj.put("state", list.get(i).get("STATE").toString());
			obj.put("usid", list.get(i).get("USID").toString());
			obj.put("name", list.get(i).get("NAME").toString());
			obj.put("price", list.get(i).get("PRICE").toString());
			obj.put("quantity", list.get(i).get("QUANTITY").toString());
			obj.put("startPage", startPage);
			obj.put("endPage", endPage);

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
