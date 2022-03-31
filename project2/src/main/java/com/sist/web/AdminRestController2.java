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
public class AdminRestController2 {

	@Autowired
	private GoodsDAO gdao;

	@GetMapping(value = "admin/adlist_vue.do", produces = "text/plain;charset=utf-8")
	public String adlist_vue(String page) {
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

		List<GoodsVO> list = gdao.goodsTotalList(map);
		for (GoodsVO vo : list) {
			String g_name = vo.getG_name();
			if (g_name.length() > 18) {
				g_name = g_name.substring(0, 18) + "...";
			}
			vo.setG_name(g_name);

			String g_image = vo.getG_image();
			if (g_image.contains(";")) {
				StringTokenizer st = new StringTokenizer(g_image, ";");
				g_image = st.nextToken();
			}
			vo.setG_image(g_image);
		}

		JSONArray arr = new JSONArray();
		int i = 0;
		int totalpage = gdao.goodsTotalPage();
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		for (GoodsVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("g_id", vo.getG_id());
			obj.put("c_id", vo.getC_id());
			obj.put("g_name", vo.getG_name());
			obj.put("g_brand", vo.getG_brand());
			obj.put("g_price", vo.getG_price());
			obj.put("g_sale", vo.getG_sale());
			obj.put("g_image", vo.getG_image());
			obj.put("g_detail", vo.getG_detail());
			obj.put("g_stock", vo.getG_stock());
			obj.put("g_sold", vo.getG_sold());
			obj.put("g_status", vo.getG_status());
			obj.put("g_regdate", vo.getG_regdate());
			obj.put("startPage", startPage);
			obj.put("endPage", endPage);

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
