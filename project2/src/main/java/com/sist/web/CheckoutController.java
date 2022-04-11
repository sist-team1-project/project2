package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("checkout/")
public class CheckoutController {
    
    @GetMapping("checkout.do")
    public String cart_cart(Model model) {
        return "checkout/checkout";
    }
}