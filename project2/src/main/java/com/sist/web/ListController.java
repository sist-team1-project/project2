package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("goods/")
public class ListController {
    
    @GetMapping("list.do")
    public String goods_list(String cid, Model model) {
        if (cid==null) cid="";
        model.addAttribute("cid", cid);
        return "goods/list";
    }
}