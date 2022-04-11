package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("checkout/")
public class CheckoutController {
    
    @PostMapping("checkout.do")
    public String cart_cart(String[] gid) {
        for(int i = 0; i < gid.length; i++) {
            System.out.println(gid[i]);
        }
        return "checkout/checkout";
    }
}