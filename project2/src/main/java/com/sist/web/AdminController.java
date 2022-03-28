package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {

    @GetMapping("admin/admin.do")
    public String mypage_mypage() {
        return "admin/product";
    }
}
