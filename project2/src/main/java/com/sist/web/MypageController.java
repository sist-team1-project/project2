package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MypageController {

    @GetMapping("mypage/mypage.do")
    public String mypage_mypage() {
        return "mypage/detail";
    }
    
    @GetMapping("mypage/update.do")
    public String mypage_update() {
        return "mypage/update";
    }
}
