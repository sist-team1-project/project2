package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
@RequestMapping("user/")
public class UserController {

	@Autowired
	private UserDAO dao;

	@GetMapping("login.do")
	public String user_login() {
		return "user/login";
	}

	@GetMapping("logout.do")
	public String user_logout(HttpSession session) {
		session.invalidate();
		return "redirect:../main/main.do";
	}

	@GetMapping("join.do")
	public String user_join() {
		return "user/join";
	}
	
	@GetMapping("idfind.do")
	public String idfind() {
		return "user/idfind/vue";
	}

	@GetMapping("idfind2.do")
	public String idfind2(String id, Model model) {
	    model.addAttribute("id", id);
		return "user/idfind2/vue";
	}

	@GetMapping("pwdfind.do")
	public String pwdfind() {
		return "user/pwdfind/vue";
	}
	
	@GetMapping("pwdfind2.do")
    public String pwdfind2(String id, String email, String question, Model model) {
	    model.addAttribute("id", id);
	    model.addAttribute("email", email);
	    model.addAttribute("question", question);
        return "user/pwdfind2/vue";
    }
	
	@GetMapping("pwdfind3.do")
    public String pwdfind3() {
        return "user/pwdfind3/vue";
    }
}