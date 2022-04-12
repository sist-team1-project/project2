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
    public String checkout_checkout(String gid, String quantity, HttpSession session, Model model) {
        
        if ((String) session.getAttribute("id") == null) {
            return "main";
        }
        
        List<String> glist = Arrays.asList(gid);
        List<String> qlist = Arrays.asList(quantity);
        
        model.addAttribute("glist", glist);
        model.addAttribute("qlist", qlist);
        return "checkout/checkout";
    }
}