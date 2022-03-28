package com.sist.web;

import java.util.*;

import org.json.simple.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class MainRestController {
    
    @Autowired
    private GoodsDAO dao;
    
    @GetMapping(value = "main/events.do", produces = "text/plain;charset=utf-8")
    public String event_goods() {
        
        Map map = new HashMap();
        List<GoodsVO> list = dao.goodsTemp(map);
        
        JSONArray arr = new JSONArray();
        
        for (GoodsVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("gid", vo.getG_id());
            String name = vo.getG_name();
            if (name.length() >= 22)
                name = name.substring(0, 22) + "...";
            obj.put("name", name);
            obj.put("price", vo.getG_price());
            String images = vo.getG_image();
            String[] image = images.split(";"); // tokenizer 쓰는게 더 나음
            obj.put("image", image[0]);
            arr.add(obj);
        }
        return arr.toJSONString();
    }
}
