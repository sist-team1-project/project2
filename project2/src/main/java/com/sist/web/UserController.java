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
	public String id_find() {
		return "user/idfind/vue";
	}

	@GetMapping("idfind2.do")
	public String id_find_result() {
		return "user/idfind2/vue";
	}

	@GetMapping("pwdfind.do")
	public String pwd_find() {
		return "user/pwdfind";
	}
}