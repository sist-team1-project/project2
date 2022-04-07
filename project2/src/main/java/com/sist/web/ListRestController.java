package com.sist.web;

import java.util.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.service.*;
import com.sist.vo.*;

@RestController
@RequestMapping("goods/")
public class ListRestController {
    
    @Autowired
    private ListService service;
    
    @GetMapping(value = "list_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_list_vue(String cid, int page, String keyword, String brands, int price1, int price2, String order) {
        
        int curpage = page;
        
        int rowSize = 20;
        int start = (rowSize * curpage) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("start", start);
        map.put("end", end);
        List<String> brandList = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(brands,",");
        while(st.hasMoreTokens()){
            brandList.add(st.nextToken());
        }
        map.put("brands", brandList);
        map.put("price1", price1);
        map.put("price2", price2);
        
        int totalpage = service.goodsListTotalpage(map);
        map.put("order", order);
        List<GoodsVO> list = service.goodsList(map);
        
        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        JSONArray arr = new JSONArray();
        
        if(list.size() == 0) {
            JSONObject obj = new JSONObject();
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("start", startPage);
            obj.put("end", endPage);
            arr.add(obj);
        } else {
            int i = 0;
            for (GoodsVO vo : list) {
                JSONObject obj = new JSONObject();
                obj.put("gid", vo.getG_id());
                obj.put("name", vo.getG_name());
                obj.put("price", vo.getG_price());
                String images = vo.getG_image();
                String[] image = images.split(";");
                obj.put("image", image[0]);
                
                if (i == 0) {
                    obj.put("curpage", curpage);
                    obj.put("totalpage", totalpage);
                    obj.put("start", startPage);
                    obj.put("end", endPage);
                }
                arr.add(obj);
                i++;
            }
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "brandlist_cname_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_brandlist_cname_vue(String cid) {
        
        List<String> list = service.brandList(cid);
        String cname = service.categoryName(cid);
        if (cname == null) cname = "전체";
        
        JSONArray arr = new JSONArray();
        int i = 0;
        for (String j : list) {
            JSONObject obj = new JSONObject();
            if(i == 0) {
                obj.put("cname", cname);
            }
            obj.put("brand", j);
            arr.add(obj);
            i++;
        }
        return arr.toJSONString();
    }
}