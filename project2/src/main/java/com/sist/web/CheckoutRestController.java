package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("checkout/")
public class CheckoutRestController {

    @Autowired
    private GoodsDAO gdao;

    @Autowired
    private UserDAO udao;

    @Autowired
    private OrderDAO odao;

    @Autowired
    private OrderDetailDAO oddao;

    @GetMapping(value = "checkout_list_vue.do", produces = "text/plain;charset=utf-8")
    public String checkout_checkout_list_vue(String gid, HttpSession session) {
        String uid = (String) session.getAttribute("id");

        StringTokenizer st = new StringTokenizer(gid, ",");
        List<String> gids = new ArrayList<String>();
        while (st.hasMoreTokens()) {
            gids.add(st.nextToken());
        }

        Map map = new HashMap();
        map.put("gids", gids);
        map.put("uid", uid);
        List<Map<String, Object>> list = gdao.checkOutGoodsDetail(map);
        //g_id,g_name,g_brand,g_price,g_sale,g_image,g_sold,g_quantity

        JSONArray arr = new JSONArray();
        for (Map<String, Object> vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("id", vo.get("G_ID"));
            obj.put("name", vo.get("G_NAME"));
            obj.put("brand", vo.get("G_BRAND"));
            obj.put("price", vo.get("G_PRICE"));
            obj.put("sale", vo.get("G_SALE"));
            String images = (String) vo.get("G_IMAGE");
            if (images == null) {
                images = "";
            }
            String[] image = images.split(";");
            obj.put("image", image[0]);
            obj.put("sold", vo.get("G_SOLD"));
            obj.put("quantity", vo.get("G_QUANTITY"));

            arr.add(obj);
        }

        return arr.toJSONString();
    }

    @GetMapping(value = "checkout_user_vue.do", produces = "text/plain;charset=utf-8")
    public String checkout_user_vue(HttpSession session) {
        String uid = (String) session.getAttribute("id");
        
        UserVO vo = udao.userInfo(uid);
        
        JSONObject obj = new JSONObject();
        
        obj.put("name", vo.getU_name());
        obj.put("phone", vo.getU_phone());
        obj.put("address1", vo.getU_address1());
        obj.put("address2", vo.getU_address2());
        obj.put("post", vo.getU_post());

        return obj.toJSONString();
    }

    @PostMapping("checkout_ok_vue.do")
    public String checkout_checkout_ok_vue(OrderDetailVO list, OrderVO ovo, HttpSession session) {
        String uid = (String) session.getAttribute("id");
        ovo.setU_id(uid);
        odao.orderInsert(ovo, list);
        

        String result = "<script>" + "alert(\"구매가 완료되었습니다\"); location.href=\"../main/main.do\"" + "</script>";
        return result;
    }
}