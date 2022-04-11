package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@Controller
public class MypageController {
	@Autowired
	private UserDAO dao;

	@GetMapping("mypage/mypage.do")
	public String mypage_mypage(HttpSession session, Model model) {
		/*
		 * String uid = (String) session.getAttribute("id"); UserVO vo =
		 * dao.userInfo(uid); System.out.println(vo.getU_address1());
		 * model.addAttribute("vo", vo);
		 */
		return "mypage/info";
	}

	@GetMapping("mypage/update.do")
	public String mypage_update(String id, Model model) {
		model.addAttribute("id", id);
		return "mypage/update";
	}

	@GetMapping("mypage/update_pwd.do")
	public String user_update_pwd(String id, Model model) {
		model.addAttribute("id", id);
		return "mypage/update_pwd";
	}

	@GetMapping("mypage/delete.do")
	public String mypage_delete(String id, Model model) {
		model.addAttribute("id", id);

		return "mypage/delete";
	}
	
	/* 주문목록 */
	@GetMapping("mypage/order_info.do")
	public String orderInfoList(String uid, Model model) {
		if(uid==null) uid="";
		model.addAttribute("uid", uid);
		return "mypage/order_info";
	}
}
