package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("main/")
public class MainRestController {
    
    @Autowired
    private GoodsDAO gdao;
    
    @Autowired
    private CategoryDAO cdao;
    
    @Autowired
    private CartDAO cartdao;
    /*
    @GetMapping(value = "main/events.do", produces = "text/plain;charset=utf-8")
    public String event_goods() {
        
        List<GoodsVO> list = dao.goodsList();
        
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
    }*/
    
    @GetMapping(value = "category_1_vue.do", produces = "text/plain;charset=utf-8")
    public String main_category_1_vue() {
        
        List<CategoryVO> list = cdao.categoryList_1();
        JSONArray arr = new JSONArray();
        
        for(CategoryVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("cid", vo.getC_id());
            obj.put("title", vo.getC_title());
            arr.add(obj);
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "category_2_vue.do", produces = "text/plain;charset=utf-8")
    public String main_category_2_vue() {
        
        List<CategoryVO> list = cdao.categoryList_2();
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
    
    @GetMapping(value = "count_cart_vue.do", produces = "text/plain;charset=utf-8")
    public String main_count_cart_vue(HttpSession session) {
        String uid = (String) session.getAttribute("id");
        JSONObject obj = new JSONObject();
        
        if(uid == null) {
            obj.put("count", 0);
            return obj.toJSONString();
        }
        int count = cartdao.countCart(uid);
        obj.put("count", count);
        return obj.toJSONString();
    }
    
    @GetMapping(value = "cart_list_vue.do", produces = "text/plain;charset=utf-8")
    public String main_cart_list_vue(HttpSession session) {
        String uid = (String) session.getAttribute("id");
        List<Map<String, Object>> list = cartdao.cartList(uid);
        
        JSONArray arr = new JSONArray();
        
        int sum = 0;
        for (int i = 0; i < list.size(); i++) {
            sum += Integer.parseInt(list.get(i).get("G_PRICE").toString());
        }
        for (int i = 0; i < list.size(); i++) {
            JSONObject obj = new JSONObject();
            obj.put("gname", list.get(i).get("G_NAME").toString());
            String images = list.get(i).get("G_IMAGE").toString();
            String[] image = images.split(";");
            obj.put("gimage", image[0]);
            obj.put("gprice", list.get(i).get("G_PRICE").toString());
            obj.put("gid", list.get(i).get("G_ID").toString());
            obj.put("gquantity", list.get(i).get("G_QUANTITY").toString());
            if (i == 0) {
                obj.put("sum", sum);
            }
            arr.add(obj);
        }
        
        return arr.toJSONString();
    }
}
