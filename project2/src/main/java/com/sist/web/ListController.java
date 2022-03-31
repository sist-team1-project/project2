package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("goods/")
public class ListController {
    
    @GetMapping("list.do")
    public String goods_list() {
        return "goods/list";
    }
}