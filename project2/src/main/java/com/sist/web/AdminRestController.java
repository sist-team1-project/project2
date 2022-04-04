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
		int i = 0;

		List<OrderDetailVO> list = oddao.orderDetail(oid);
		OrderVO ovo = odao.order(oid);

		for (OrderDetailVO odvo : list) {
			JSONObject obj = new JSONObject();
			if(i == 0) {
				obj.put("od",ovo);
			}
			obj.put("odd", odvo);
		    arr.add(obj);
		    i++;
		}
		return arr.toJSONString();
	}
}
