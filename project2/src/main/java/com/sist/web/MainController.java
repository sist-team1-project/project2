package com.sist.web;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.CartDAO;

@Controller
@RequestMapping("main/")
public class MainController {
    
    @Autowired
    private CartDAO cartdao;
    @GetMapping("main.do")
    public String main_main(HttpSession session, Model model) {
        
        return "main";
    }
    
    @GetMapping("map.do")
    public String map(String address, String title, Model model) {
        model.addAttribute("address", address);
        model.addAttribute("title", title);
        return "main/map/vue";
    }
}