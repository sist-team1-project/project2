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
	public String mypage_mypage(Model model) {
		return "mypage/info";
	}

	@GetMapping("mypage/update.do")
	public String mypage_update() {
		return "mypage/update";
	}

	@GetMapping("mypage/update_pwd.do")
	public String user_update_pwd() {
		return "mypage/update_pwd";
	}

	@GetMapping("mypage/delete.do")
	public String mypage_delete() {
		return "mypage/delete";
	}
	
	/* 주문목록 */
	@GetMapping("mypage/order_info.do")
	public String orderInfoList() {
		return "mypage/order_info";
	}
	
	@GetMapping("mypage/like.do")
    public String mypage_like() {
        return "mypage/delete";
    }
}
