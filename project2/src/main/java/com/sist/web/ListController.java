package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ListController {
    
    @GetMapping("goods/list.do")
    public String goods_list() {
        return "goods/list";
    }
}