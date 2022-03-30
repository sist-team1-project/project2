package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.GoodsDAO;
import com.sist.service.GoodsService;
import com.sist.vo.GoodsVO;

@Controller
@RequestMapping("goods/")
public class GoodsController {
	@Autowired
	private GoodsService service;
	
	@Autowired
	private GoodsDAO dao;
    
    @GetMapping("detail.do")
    public String goods_detail(int gid, Model model) {
        Map map = new HashMap();
        map.put("g_id", gid);
        
        GoodsVO vo = service.goodsDetail(map);
        model.addAttribute("vo", vo);
        
        return "goods/detail";
    }
}