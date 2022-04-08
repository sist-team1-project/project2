package com.sist.web;

import java.util.*;

import org.json.simple.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("admin/")
public class AdminRestController2 {

	@Autowired
	private GoodsDAO gdao;
	
	@Autowired
	private EventDAO edao;

	@GetMapping(value = "adlist_vue.do", produces = "text/plain;charset=utf-8")
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
		
		int count = gdao.goodsCount();
		
		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}
		
		int i = 0;
		JSONArray arr = new JSONArray();
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

	@PostMapping("goods_update_ok.do")
	public String goods_update_ok(@RequestBody HashMap<String, Object> map) {

		return "";
	}
	
	@GetMapping(value = "event_list.do", produces = "text/plain;charset=utf-8")
    public String admin_event_list() {
	    List<EventVO> list = new ArrayList<EventVO>();
	    list = edao.eventList();
	    
	    JSONArray arr = new JSONArray();
	    for (EventVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("eid", vo.getE_id());
            obj.put("etitle", vo.getE_title());
            
            arr.add(obj);
        }
        return arr.toJSONString();
    }
	
	@PostMapping("goods_add_ok.do")
	public String goods_add_vue_ok(@RequestBody HashMap<String, Object> map) {
	    	    
		GoodsVO vo = new GoodsVO();
    	vo.setC_id((String) map.get("cid"));
    	vo.setG_name((String) map.get("gname"));
    	vo.setG_brand((String) map.get("gbrand"));
    	vo.setG_price(Integer.parseInt(map.get("gprice").toString()));
    	vo.setG_sale(Integer.parseInt(map.get("gsale").toString()));
    	vo.setG_detail((String) map.get("gdetail"));
    	vo.setG_stock(Integer.parseInt(map.get("gstock").toString()));
    	vo.setG_status(Integer.parseInt(map.get("gstatus").toString()));
    	vo.setG_image((String) map.get("gimage"));
    	
    	Map map2 = new HashMap();
    	map2.put("vo", vo);
    	String eid = (String) map.get("eid");
    	if(eid == null) eid = "";
    	map2.put("eid", eid);
    	
    	gdao.goodsInsert(map2);
        
		return "ok";
	}
}
