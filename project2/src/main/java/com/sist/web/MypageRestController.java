package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class MypageRestController {

	@Autowired
	private UserDAO dao;

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

	// 
	@PostMapping(value = "mypage/update_ok.do", produces = "text/plain;charset=utf-8")
	public String mypage_update_ok(@RequestBody UserVO vo, HttpSession session) {
		String result = "";	
		if(vo.getU_address2()==null)
		{
			vo.setU_address2("");
		}
		boolean bCheck = dao.userUpdate(vo);
		if (bCheck == true) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
	}

	@PostMapping(value = "mypage/update_pwd_ok.do", produces = "text/plain;charset=utf-8")
	public String mypage_update_pwd_ok(@RequestBody HashMap<String, Object> map) {
		String result = "";
		System.out.println(map.get("newPassword"));
		boolean bCheck = dao.userPwdUpdate(map);
		if (bCheck == true) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
	}

	@PostMapping(value = "mypage/delete_ok.do", produces = "text/plain;charset=utf-8")
	public String mypage_delete_ok(@RequestBody HashMap<String, Object> map) {
		String result = "";
		boolean bCheck = dao.userDelete(map);
		if (bCheck == true) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
	}
}