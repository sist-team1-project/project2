package com.sist.web;

import java.util.*;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.service.*;
import com.sist.vo.*;

@RestController
public class ListRestController {
    
    @Autowired
    private ListService service;
    
    @GetMapping(value = "goods/list_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_list_vue(String cid, int page, String keyword) {
        System.out.println("cid: "+cid);
        int curpage = page;
        
        int rowSize = 20;
        int start = (rowSize * curpage) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("start", start);
        map.put("end", end);
        
        int totalpage = service.goodsListTotalpage(map);
        
        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        List<GoodsVO> list = service.goodsList(map);
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
                String name = vo.getG_name();
                if (name.length() >= 22)
                    name = name.substring(0, 20) + "...";
                obj.put("name", name);
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
    
    @GetMapping(value = "goods/category_1_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_category_1_vue() {
        
        List<CategoryVO> list = service.categoryList_1();
        JSONArray arr = new JSONArray();
        
        for(CategoryVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("cid", vo.getC_id());
            obj.put("title", vo.getC_title());
            arr.add(obj);
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "goods/category_2_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_category_2_vue() {
        
        List<CategoryVO> list = service.categoryList_2();
        JSONArray arr = new JSONArray();
        
        int i = 0;
        for(CategoryVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("cid", vo.getC_id());
            obj.put("title", vo.getC_title());
            arr.add(obj);
            i++;
        }
        
        return arr.toJSONString();
    }
}