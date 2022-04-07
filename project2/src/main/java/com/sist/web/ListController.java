package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.service.*;

@Controller
@RequestMapping("goods/")
public class ListController {
    
    @Autowired
    private ListService service;
    
    @GetMapping("list.do")
    public String goods_list(String cid, Model model) {
        if (cid==null) cid="";
        int maxPrice = service.goodsMaxPrice(cid);
        System.out.println("max:"+maxPrice);
        model.addAttribute("cid", cid);
        model.addAttribute("maxPrice", maxPrice);
        return "goods/list";
    }
}