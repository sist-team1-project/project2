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
		 * String uid = (String) session.getAttribute("id"); 
		 * UserVO vo = dao.userInfo(uid); 
		 * System.out.println(vo.getU_address1());
		 * model.addAttribute("vo", vo);
		 */
        return "mypage/info";
    }

	@GetMapping("mypage/update.do")
	public String mypage_update() {
		return "mypage/update";
	}

}
