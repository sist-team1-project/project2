package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.UserVO;
@Controller
public class UserController {
	
	@Autowired
	private UserDAO dao;
	
    @GetMapping("user/login.do")
    public String user_login() {
        return "user/login";
    }
    
    @PostMapping("user/login_ok.do")
    public String user_login_ok(String id,String pwd,HttpSession session) {
    	
    	String result=dao.isLogin(id, pwd);
 	    if(!(result.equals("NOID")&& result.equals("NOPWD")))
 	    {
 		   // 로그인이 된 상태 
 		   session.setAttribute("id", id);
 		   session.setAttribute("name", result);
 	    }
    	return result;
    }
}
