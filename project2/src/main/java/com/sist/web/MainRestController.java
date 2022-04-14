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
    private EventDAO edao;
    
    @Autowired
    private EventGoodsDAO egdao;
    
    @Autowired
    private CategoryDAO cdao;
    
    @Autowired
    private CartDAO cartdao;
    
    @Autowired
    private NoticeDAO ndao;
    
    @GetMapping(value = "event_list.do", produces = "text/plain;charset=utf-8")
    public String event_goods(HttpSession session) {
        String uid = (String) session.getAttribute("id");
        if (uid == null) {
            uid = "";
        }
        
        List<Map<String,Object>> glist = egdao.eventGoodsList(uid);
        List<EventVO> elist = edao.eventList();
        
        JSONArray arr = new JSONArray();
        
        JSONArray eArr = new JSONArray();
        for (EventVO i : elist) {
            JSONObject obj = new JSONObject();
            obj.put("eid", i.getE_id());
            obj.put("title", i.getE_title());
            eArr.add(obj);
        }
        arr.add(eArr);
        
        JSONArray egArr = new JSONArray();
        for (int i = 0; i < glist.size(); i++) {
            JSONObject obj = new JSONObject();
            obj.put("lid", glist.get(i).get("L_ID").toString());
            obj.put("gid", glist.get(i).get("G_ID").toString());
            obj.put("name", glist.get(i).get("G_NAME").toString());
            obj.put("price", glist.get(i).get("G_PRICE").toString());
            obj.put("eid", glist.get(i).get("E_ID").toString());
            
            String images = (String) glist.get(i).get("G_IMAGE");
            if (images == null) {
                images = "";
            }
            String[] image = images.split(";");
            obj.put("image", image[0]);
            egArr.add(obj);
        }
        arr.add(egArr);
        
        return arr.toJSONString();
    }
    
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
        List<CategoryVO> list = cdao.categoryList_1();
        List<CategoryVO> list2 = cdao.categoryList_2();
        
        JSONArray arr = new JSONArray();
        for(CategoryVO vo : list) {
            JSONArray arr2 = new JSONArray();
            for(CategoryVO vo2 : list2) {
                if(vo2.getC_id().startsWith(vo.getC_id())) {
                    JSONObject obj = new JSONObject();
                    obj.put("cid", vo2.getC_id());
                    obj.put("title", vo2.getC_title());
                    arr2.add(obj);
                }
            }
            arr.add(arr2); 
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "header_notice.do", produces = "text/plain;charset=utf-8")
    public String headerNotice() {
        
        List<NoticeVO> list = ndao.headerNotice();
        
        JSONArray arr = new JSONArray();
        for(NoticeVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("nid", vo.getN_id());
            obj.put("title", vo.getN_title());
            arr.add(obj);
        
        }
        return arr.toJSONString();
    }
}
