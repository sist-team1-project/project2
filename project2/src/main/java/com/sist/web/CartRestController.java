package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;

@RestController
@RequestMapping("cart/")
public class CartRestController {

	@Autowired
	private CartDAO cartdao;
	
	@Autowired
	private GoodsDAO gdao;
	

	@PostMapping("insert_ok.do")
	public String cart_insert_ok(CartVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        vo.setU_id(id);
        String result = cartdao.cartInsert(vo);
        return result;
	}
	
    @PostMapping("delete_ok.do")
    public void cart_delete_ok(int cid) {
        cartdao.cartDelete(cid);
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
    public String cart_cart_list_vue(HttpSession session) {
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
            if (images == null) {
                images = "";
            }
            String[] image = images.split(";");
            obj.put("gimage", image[0]);
            obj.put("gprice", list.get(i).get("G_PRICE").toString());
            obj.put("gid", list.get(i).get("G_ID").toString());
            obj.put("cid", list.get(i).get("CART_ID").toString());
            obj.put("gquantity", list.get(i).get("G_QUANTITY").toString());
            obj.put("gsale", list.get(i).get("G_SALE").toString());
            arr.add(obj);
        }
        return arr.toJSONString();
    }
    
    @PostMapping("cart_num_update.do")
    public void cart_num_update(int num, int gid) {
        
        Map map = new HashMap();
        map.put("num", num);
        map.put("gid", gid);
        
        cartdao.cartNumUpdate(map);
    }
}