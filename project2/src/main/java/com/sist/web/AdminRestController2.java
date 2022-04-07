package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class AdminRestController2 {

	@Autowired
	private GoodsDAO gdao;

	@GetMapping(value = "admin/adlist_vue.do", produces = "text/plain;charset=utf-8")
	public String adlist_vue(String page, String fs, String ss) {
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);

		Map map = new HashMap();

		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (rowSize * curpage);
		String[] fsArr = fs.split(",");

		map.put("start", start);
		map.put("end", end);
		map.put("fsArr", fsArr);
		map.put("ss", ss);

		List<GoodsVO> list = gdao.adminGoodsFind(map);
		int totalpage = gdao.goodsTotalPage(map);

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

		int count = gdao.goodsCount();

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

		for (GoodsVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("g_id", vo.getG_id());
			obj.put("c_id", vo.getC_id());
			obj.put("g_name", vo.getG_name());
			obj.put("g_brand", vo.getG_brand());
			obj.put("g_price", vo.getG_price());
			obj.put("g_sale", vo.getG_sale());
			String images = vo.getG_image();
			String[] image = images.split(";");
			obj.put("g_image", image[0]);
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
				obj.put("count", count);
			}
			arr.add(obj);
			i++;
		}

		return arr.toJSONString();
	}

	@PostMapping("admin/goods_update_ok.do")
	public String goods_update_ok(@RequestBody HashMap<String, Object> map) {

		return "";
	}

	@PostMapping("admin/goods_add_ok.do")
	public String goods_add_vue_ok(@RequestBody HashMap<String, Object> map) {
		GoodsVO vo = new GoodsVO();

		vo.setC_id((String) map.get("c_id"));
		vo.setG_name((String) map.get("g_name"));
		vo.setG_brand((String) map.get("g_brand"));
		vo.setG_price(Integer.parseInt(map.get("g_price").toString()));
		vo.setG_sale(Integer.parseInt(map.get("g_sale").toString()));
		vo.setG_image((String) map.get("g_image"));
		vo.setG_detail((String) map.get("g_detail"));
		vo.setG_stock(Integer.parseInt(map.get("g_stock").toString()));
		vo.setG_status(Integer.parseInt(map.get("g_status").toString()));

		gdao.goodsInsert(vo);

		int e_id = 0;
		int g_id = gdao.goodsCount();

		System.out.println("eid : " + map.get("eid"));
		System.out.println("gid : " + g_id);

		String a = (String) map.get("eid");
		EventGoodsVO evo = new EventGoodsVO();
		if (a != "") {
			System.out.println("a : " + a);
			if (a.contains(",")) {
				String[] eid = a.split(",");
				for (String st : eid) {
					System.out.print(st + " ");
					evo.setE_id(Integer.parseInt(st));
					evo.setG_id(g_id);
					gdao.goodsEventInsert(evo);
				}
				return "ok";
			}
			evo.setE_id(Integer.parseInt(a));
			evo.setG_id(g_id);
			try {
				e_id = Integer.parseInt(a);
				gdao.goodsEventInsert(evo);
			} catch (Exception e) {
			}

		}

		return "ok";
	}
}
