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
    public String checkout_checkout(int[] gid, HttpSession session, Model model) {
        
        if ((String) session.getAttribute("id") == null) {
            return "main";
        }
        
        List<Integer> list = new ArrayList<Integer>();
        for(int i : gid) {
            list.add(i);
        }
        model.addAttribute("gid", list);
        return "checkout/checkout";
    }
}