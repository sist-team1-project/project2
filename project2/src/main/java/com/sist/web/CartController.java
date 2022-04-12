package com.sist.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("cart/")
public class CartController {
    
    @GetMapping("cart.do")
    public String cart_cart(HttpSession session) {
        if ((String) session.getAttribute("id") == null) {
            return "main";
        }
        return "cart/cart";
    }
}