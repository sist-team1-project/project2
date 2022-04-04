package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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
        System.out.println(vo.getU_address1());
        dao.userJoin(vo);
        return "ok";
    }
    
    @GetMapping(value = "mypage/info_vue.do", produces = "text/plain;charset=utf-8")
    public String mypage_info_vue(HttpSession session) {
    	String uid = (String) session.getAttribute("id");
    	UserVO vo = dao.userInfo(uid);
    	JSONObject obj = new JSONObject();
        
        obj.put("uid", vo.getU_id());
        obj.put("name", vo.getU_name());
        obj.put("gender", vo.getU_gender());
        obj.put("email", vo.getU_email());
        obj.put("phone", vo.getU_phone());
        obj.put("address1", vo.getU_address1());
        obj.put("address2", vo.getU_address2());
        obj.put("post", vo.getU_post());
        obj.put("question", vo.getU_question());
        obj.put("answer", vo.getU_answer());
        obj.put("regdate", vo.getU_regdate());   
        return obj.toJSONString();
    }
}