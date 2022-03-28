package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class GoodsController {
    
    @GetMapping("goods/detail.do")
    public String goods_detail() {
        return "goods/detail";
    }
}