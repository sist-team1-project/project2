package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.service.*;
import com.sist.vo.*;

@RestController
@RequestMapping("goods/")
public class GoodsRestController {
    
    @Autowired
    private GoodsService service;

    @GetMapping(value = "detail_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_detail(int gid, HttpSession session) {
          
        GoodsVO vo = service.goodsDetail(gid);
        
        JSONObject obj = new JSONObject();
        
        obj.put("gid", vo.getG_id());
        obj.put("name", vo.getG_name());
        obj.put("brand", vo.getG_brand());
        obj.put("price", vo.getG_price());
        obj.put("sale", vo.getG_sale());
        obj.put("image", vo.getG_image());
        obj.put("detail", vo.getG_detail());
        obj.put("status", vo.getG_status());   
        obj.put("stock", vo.getG_stock());
        return obj.toJSONString();
    }
    
    @GetMapping(value = "review_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_review_vue(int g_id, int page) {
        
        int curpage = page;
        
        int rowSize = 20;
        int start = (rowSize * curpage) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        map.put("gid", g_id);
        map.put("start", start);
        map.put("end", end);
        List<ReviewGoodsVO> list = service.reviewList(map);
        
        int totalpage = service.reviewListTotalpage(g_id);
        
        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        JSONArray arr = new JSONArray();
        int i = 0;
        for (ReviewGoodsVO vo : list) {
            JSONObject obj = new JSONObject();
            
            if (i == 0) {
                obj.put("curpage", curpage);
                obj.put("totalpage", totalpage);
                obj.put("start", startPage);
                obj.put("end", endPage);
            }
            obj.put("rid", vo.getR_id());
            obj.put("rate", vo.getR_rate());
            obj.put("content", vo.getR_content());
            obj.put("r_regdate", vo.getR_regdate());
            arr.add(obj);
            i++;
        }
        return arr.toJSONString();
    }
}
