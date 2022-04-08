package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.service.*;

@RestController
@RequestMapping("admin/")
public class AdminRestController {

    @Autowired
    private AdminService service;
    
    @Autowired
    private OrderDAO odao;
    
    @Autowired
    private OrderDetailDAO oddao;
    
    @Autowired
    private UserDAO udao;
    
    @GetMapping(value = "orderlist_vue.do", produces = "text/plain;charset=utf-8")
    public String orderFull(int page) {
        
        int curpage = page;
        
        int rowSize = 10;
        int start = (curpage * rowSize) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        
        map.put("start", start);
        map.put("end", end);
        
        int totalpage = odao.orderTotalPage();
        int count = odao.orderCount();

        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        List<Map<String, Object>> list = odao.orderFullList(map);
        
        JSONArray arr = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            JSONObject obj = new JSONObject();
            obj.put("oid", list.get(i).get("OID").toString());
            obj.put("regdate", list.get(i).get("REGDATE").toString());
            obj.put("shipping", list.get(i).get("SHIPPING").toString());
            obj.put("state", list.get(i).get("STATE").toString());
            obj.put("usid", list.get(i).get("USID").toString());
            obj.put("name", list.get(i).get("NAME").toString());
            obj.put("price", list.get(i).get("PRICE").toString());
            obj.put("quantity", list.get(i).get("QUANTITY").toString());
            if(i == 0) {
                obj.put("startPage", startPage);
                obj.put("endPage", endPage);
                obj.put("totalpage", totalpage);
                obj.put("curpage", curpage);
                obj.put("count", count);
            }
            
            arr.add(obj);
        }
        return arr.toJSONString();
    }

    /**************** 주문상세페이지 ********************/
    @GetMapping(value = "orderdetail_vue.do", produces = "text/plain;charset=utf-8")
    public String orderdetail_vue(String oid) {
        System.out.println(oid);
        JSONArray arr = new JSONArray();

        List<OrderDetailVO> list = oddao.orderDetail(oid);

        for (OrderDetailVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("odid", vo.getOd_id());
            obj.put("oid", vo.getO_id());
            obj.put("gid", vo.getG_id());
            obj.put("name", vo.getG_name());
            obj.put("price", vo.getG_price());
            obj.put("sale", vo.getG_sale());
            obj.put("quantity", vo.getG_quantity());
            
            arr.add(obj);
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "order.do", produces = "text/plain;charset=utf-8")
    public String order(String oid) {

        OrderVO ovo = odao.order(oid);
            JSONObject obj = new JSONObject();
            obj.put("oid", ovo.getO_id());
            obj.put("uid", ovo.getU_id());
            obj.put("receiver", ovo.getO_receiver());
            obj.put("phone", ovo.getO_phone());
            obj.put("post", ovo.getO_post());
            obj.put("addr1", ovo.getO_address1());
            obj.put("addr2", ovo.getO_address2());
            obj.put("request", ovo.getO_request());
            obj.put("regdate", ovo.getO_regdate());
            obj.put("shipping", ovo.getO_shipping());
            obj.put("state", ovo.getO_state());
            
        return obj.toJSONString();
    }
    
    @PostMapping(value = "order_state_update_ok.do", produces = "text/plain;charset=utf-8")
    public void order_state_update_ok(int state, String oid) {
        
        Map map = new HashMap();
        map.put("state",state);
        map.put("oid",oid);
        odao.stateupdate(map);
    }
    
    /****************************** USER *****************************/
    @GetMapping(value = "userlist_vue.do", produces = "text/plain;charset=utf-8")
    public String userlist(int page,Model model) {
        
        int curpage = page;
        
        int rowSize = 10;
        int start = (curpage * rowSize) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        
        map.put("start", start);
        map.put("end", end);
        
        int totalpage = udao.userTotalPage();
        int count = udao.userCount();

        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        List<UserVO> list = udao.userList(map);
        
        JSONArray arr = new JSONArray();
		int i = 0;
        for (UserVO vo:list) {
			JSONObject obj = new JSONObject();
			obj.put("uid", vo.getU_id());
			obj.put("name", vo.getU_name());
			obj.put("gender", vo.getU_gender());
			obj.put("phone", vo.getU_phone());
			obj.put("email", vo.getU_email());
			obj.put("regdate", vo.getU_regdate());
			obj.put("grade", vo.getU_grade());
			
            if(i == 0) {
                obj.put("startPage", startPage);
                obj.put("endPage", endPage);
                obj.put("totalpage", totalpage);
                obj.put("curpage", curpage);
                obj.put("count", count);
            }
            arr.add(obj);
        }
        return arr.toJSONString();
    }
}
