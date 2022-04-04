package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
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
			obj.put("request", ovo.getO_reqest());
			obj.put("regdate", ovo.getO_regdate());
			obj.put("shipping", ovo.getO_shipping());
			obj.put("state", ovo.getO_state());
			
		return obj.toJSONString();
	}
}
