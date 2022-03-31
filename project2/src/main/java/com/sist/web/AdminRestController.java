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

@RestController
public class AdminRestController {

	@Autowired
	private OrderDAO odao;

	@GetMapping(value = "admin/salelist_vue.do", produces = "text/plain;charset=UTF-8")
	public String salelist_vue(String page) {
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

		List<OrderVO> list = odao.orderTotalList(map);

		JSONArray arr = new JSONArray();
		int i = 0;
		int totalpage = odao.orderTotalPage();
		for (OrderVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("o_id", vo.getO_id());
			obj.put("u_id", vo.getU_id());
			obj.put("o_receiver", vo.getO_receiver());
			obj.put("o_phone", vo.getO_phone());
			obj.put("o_post", vo.getO_phone());
			obj.put("o_address1", vo.getO_address1());
			obj.put("o_address2", vo.getO_address2());
			obj.put("o_request", vo.getO_reqest());
			obj.put("o_regdate", vo.getO_regdate());
			obj.put("o_shipping", vo.getO_shipping());
			obj.put("o_state", vo.getO_state());

			if (i == 0) {
				obj.put("curpage", curpage);
				obj.put("totalpage", totalpage);
			}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}
}
