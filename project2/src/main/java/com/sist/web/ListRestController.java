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
public class ListRestController {
    
    @Autowired
    private ListService service;
    
    @GetMapping(value = "list_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_list_vue(String cid, int page, String keyword, String brands, int price1, int price2, String order, HttpSession session) {
        String uid = (String) session.getAttribute("id");
        if (uid == null) {
            uid = "";
        }
        
        int curpage = page;
        
        int rowSize = 20;
        int start = (rowSize * curpage) - (rowSize - 1);
        int end = (rowSize * curpage);
        
        Map map = new HashMap();
        map.put("cid", cid);
        map.put("keyword", keyword);
        map.put("start", start);
        map.put("end", end);
        List<String> brandList = new ArrayList<String>();
        StringTokenizer st = new StringTokenizer(brands,",");
        while(st.hasMoreTokens()){
            brandList.add(st.nextToken());
        }
        map.put("brands", brandList);
        map.put("price1", price1);
        map.put("price2", price2);
        map.put("uid", uid);
        int totalpage = service.goodsListTotalpage(map);
        map.put("order", order);
        List<Map<String,Object>> list = service.goodsList(map);
        
        final int BLOCK = 10;
        int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
        int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
        if (endPage > totalpage) {
            endPage = totalpage;
        }
        
        JSONArray arr = new JSONArray();
        
        if(list.size() == 0) {
            JSONObject obj = new JSONObject();
            obj.put("curpage", curpage);
            obj.put("totalpage", totalpage);
            obj.put("start", startPage);
            obj.put("end", endPage);
            arr.add(obj);
        } else {
            
            for (int i = 0; i < list.size(); i++) {
                JSONObject obj = new JSONObject();
                obj.put("lid", list.get(i).get("L_ID").toString());
                obj.put("gid", list.get(i).get("G_ID").toString());
                obj.put("name", list.get(i).get("G_NAME").toString());
                obj.put("price", list.get(i).get("G_PRICE").toString());
                String images = list.get(i).get("G_IMAGE").toString();
                String[] image = images.split(";");
                obj.put("image", image[0]);
                
                if (i == 0) {
                    obj.put("curpage", curpage);
                    obj.put("totalpage", totalpage);
                    obj.put("start", startPage);
                    obj.put("end", endPage);
                }
                arr.add(obj);
            }
        }
        return arr.toJSONString();
    }
    
    @GetMapping(value = "brandlist_cname_vue.do", produces = "text/plain;charset=utf-8")
    public String goods_brandlist_cname_vue(String cid) {
        
        List<String> list = service.brandList(cid);
        String cname = service.categoryName(cid);
        if (cname == null) cname = "전체";
        
        JSONArray arr = new JSONArray();
        int i = 0;
        for (String j : list) {
            JSONObject obj = new JSONObject();
            if(i == 0) {
                obj.put("cname", cname);
            }
            obj.put("brand", j);
            arr.add(obj);
            i++;
        }
        return arr.toJSONString();
    }
    
    @PostMapping("like_insert_ok.do")
    public void like_insert_ok(int gid, HttpSession session) {
        String uid = (String) session.getAttribute("id");
        
        LikeVO vo = new LikeVO();
        vo.setG_id(gid);
        vo.setU_id(uid);
        service.likeInsert(vo);
    }
    
    @PostMapping("like_delete_ok.do")
    public void like_delete_ok(int lid, HttpSession session) {
        String uid = (String) session.getAttribute("id");
        
        LikeVO vo = new LikeVO();
        vo.setL_id(lid);
        vo.setU_id(uid);
        service.likeDelete(vo);
    }
}