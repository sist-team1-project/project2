package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("user/")
public class UserRestController {

	@Autowired
	private UserDAO dao;

	@PostMapping("login_ok.do")
	public String user_login_ok(String id, String pwd, HttpSession session) {// id pwd
		String result = dao.isLogin(id, pwd);
		if (!(result.equals("NOID") || result.equals("NOPWD"))) {
			// 로그인이 된 상태
			session.setAttribute("id", id);
			session.setAttribute("grade", result);
		}
		return result;
	}
	
    @PostMapping("join_ok.do")
    public void user_join(@RequestBody UserVO vo) {
        dao.userJoin(vo);
    }

	/*@GetMapping(value = "mypage/info_vue.do", produces = "text/plain;charset=utf-8")
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
	}*/
	
	@GetMapping(value = "idcheck_ok.do", produces = "text/plain;charset=utf-8")
    public String user_idcheck_ok(String id) {
        String result = "";
        JSONObject obj = new JSONObject();
        int idcheck = dao.idCheck(id);
        if (idcheck == 0) {
            result = id; // 저장한 id를 jsp까지 가져가기
        } else {
            result = "no"; // 현재 얘는 출력됨
        }
        return result;
    }
	
	@GetMapping(value = "emailcheck_ok.do", produces = "text/plain;charset=utf-8")
    public String user_emailcheck_ok(String email) {
        String result = "";
        JSONObject obj = new JSONObject();
        int emailcheck = dao.emailCheck(email);
        if (emailcheck == 0) {
            result = email; // 저장한 email을 jsp까지 가져가기
        } else {
            result = "no"; // 현재 얘는 출력됨
        }
        return result;
    }
	
	@GetMapping(value = "idfind_ok.do", produces = "text/plain;charset=utf-8")
	public String user_idfind_ok(String name, String email) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		
		String result = dao.userFind(map);
		return result;
	}
	
	@PostMapping(value = "pwdfind_ok.do", produces = "text/plain;charset=utf-8")
	public String user_pwdfind_ok(String id, String email) {
		return "";
	}

	/*
	 * @PostMapping("user/pwdfind2_ok.do") public String user_pwdfind2_ok(String
	 * question, String answer) { String result = dao.userAnswer(question, answer);
	 * return result; }
	 */
}
