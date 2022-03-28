package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @GetMapping("user/login.do")
    public String user_login() {
        return "user/login";
    }
}
