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
        String uid = (String) session.getAttribute("id");
        if (uid == null) uid = "";
        
        Map map = new HashMap();
        map.put("gid", gid);
        map.put("uid", uid);
        
        Map<String,Object> vo = service.goodsDetail(map);
        
        JSONObject obj = new JSONObject();
        
        obj.put("lid", vo.get("L_ID"));
        obj.put("gid", vo.get("G_ID"));
        obj.put("name", vo.get("G_NAME"));
        obj.put("brand", vo.get("G_BRAND"));
        obj.put("price", vo.get("G_PRICE"));
        obj.put("sale", vo.get("G_SALE"));
        obj.put("image", vo.get("G_IMAGE"));
        obj.put("detail", vo.get("G_DETAIL"));
        obj.put("status", vo.get("G_STATUS"));
        return obj.toJSONString();
    }
}
