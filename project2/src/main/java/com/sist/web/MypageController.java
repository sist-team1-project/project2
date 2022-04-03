package com.sist.web;

import java.util.*;

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
    public String mypage_mypage() {
        return "mypage/detail";
    }

	@GetMapping("mypage/update.do")
	public String mypage_update() {
		return "mypage/update";
	}

}
