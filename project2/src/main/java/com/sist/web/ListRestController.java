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
    public String goods_list_vue(int page, String keyword) {
        
        int curpage = page;
        
        Map map = new HashMap();
        int rowSize = 20;
        int start = (rowSize * curpage) - (rowSize - 1);
        int end = (rowSize * curpage);
        int totalpage = service.goodsListTotalpage(keyword);
        
        map.put("keyword", keyword);
        map.put("start", start);
        map.put("end", end);
        
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
}