package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.*;


@Controller
public class UserController {

    @Autowired
    private UserDAO dao;

    @GetMapping("user/login.do")
    public String user_login() {
        return "user/login";
    }
}