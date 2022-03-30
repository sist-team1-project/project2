package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.service.GoodsService;
import com.sist.vo.GoodsVO;

@RestController

public class GoodsRestController {
    @Autowired
    private GoodsService service;

    @GetMapping(value = "goods/detail_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_detail(String gid) {
        System.out.println(gid);
        Map map = new HashMap();
        map.put("g_id", gid);
        GoodsVO vo = service.goodsDetail(map);

        JSONObject obj = new JSONObject();
        
        obj.put("gid", vo.getG_id());
        obj.put("name", vo.getG_name());
        obj.put("brand", vo.getG_brand());
        obj.put("price", vo.getG_price());
        obj.put("sale", vo.getG_sale());
        obj.put("image", vo.getG_image());
        obj.put("detail", vo.getG_detail());
        obj.put("stock", vo.getG_stock());
        obj.put("sold", vo.getG_sold());
        obj.put("status", vo.getG_status());
        obj.put("regdate", vo.getG_regdate());
        
        return obj.toJSONString();
    }
}
