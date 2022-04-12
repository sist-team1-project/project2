package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.service.*;
import com.sist.vo.*;

@Controller
@RequestMapping("goods/")
public class GoodsController {
    
	@Autowired
	private GoodsService service;
	
    
    @GetMapping("detail.do")
    public String goods_detail(int gid, Model model) {
        
        // 상품이 판매 중단 상태이면 메인으로 이동
        int status = service.goodsStatus(gid);
        if (status == 0) {
            return "main";
        }
        model.addAttribute("gid", gid);
        return "goods/detail";
    }
}