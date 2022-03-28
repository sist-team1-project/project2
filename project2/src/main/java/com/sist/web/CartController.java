package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CartController {
    
    @GetMapping("cart/cart.do")
    public String cart_cart(Model model) {
        return "cart/cart";
    }
    
    @PostMapping("cart/checkout.do")
    public String cart_checkout(Model model) {
        return "cart/checkout";
    }
}