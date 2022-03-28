package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
    
    @GetMapping("main/main.do")
    public String main_main() {
        return "main";
    }
}
