package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("checkout/")
public class CheckoutController {
    
    @PostMapping("checkout.do")
    public String checkout_checkout(@RequestParam List<Integer> gid, HttpSession session, Model model) {
        
        if ((String) session.getAttribute("id") == null) {
            return "main";
        }
                
        model.addAttribute("glist", gid);
        return "checkout/checkout";
    }
}