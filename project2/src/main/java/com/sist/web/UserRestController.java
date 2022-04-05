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

	@PostMapping("user/idfind_ok.do")
	public String user_idfind_ok(String id, String email) {
		String result = dao.userFind(id, email);
		return result;
	}
	
	/*@PostMapping("user/idfind_result.do")
	public String user_idfind_result(Class user_idfind_ok, String id) {
		
		// 위 클래스에서 가져온 아이디를 출력하기
		
		String result = user_idfind_ok();
		return result;
	}*/

	@PostMapping(value = "user/pwdfind_ok.do", produces = "text/plain;charset=utf-8")
	public String user_pwdfind_ok(String id, String email) {
		String result = dao.userFind(id, email);
		UserVO vo = dao.userInfo(id);
		if (result == "ADMIT") {
			// id를 통해 해당 유저의 question과 answer를 가져온다
			JSONObject obj = new JSONObject();
			obj.put("id", vo.getU_id());
			obj.put("question", vo.getU_question());
			obj.put("answer", vo.getU_answer());
			return obj.toJSONString();
		} else {
			return result;
		}
	}
	
	/*
	 * @PostMapping("user/pwdfind2_ok.do") public String user_pwdfind2_ok(String
	 * question, String answer) { String result = dao.userAnswer(question, answer);
	 * return result; }
	 */
}
