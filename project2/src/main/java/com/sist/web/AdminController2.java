package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController2 {

	@GetMapping("admin/user.do")
	public String admin_user() {
		return "admin/user";
	}
}
