package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class UserRestController {

	@Autowired
	private UserDAO dao;

	@PostMapping("user/login_ok.do")
	public String user_login_ok(String id, String pwd, HttpSession session) {// id pwd
		String result = dao.isLogin(id, pwd);
		if (!(result.equals("NOID") || result.equals("NOPWD"))) {
			// 로그인이 된 상태
			session.setAttribute("id", id);
			session.setAttribute("grade", result);
		}
		return result;
	}
	
	@PostMapping("user/join_ok.do")
	public String user_join(UserVO vo) {
		dao.userJoin(vo);
		return "";
	}
}