package com.sist.web;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

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
	
/*	@PostMapping(value = "mypage/update_ok.do", produces = "text/plain;charset=utf-8")
	public String mypage_update_ok(UserVO vo) {
		String result = "";
		boolean bCheck = dao.userUpdate(vo);
		if (bCheck == true) {
			result = "<script>location.href=\"../mypage/mypage.do\";</script>";
		} else {
			result = "<script>" + "alert(\"Password Fail!!\");" + "history.back();" + "</script>";
		}
		return result;
	}
*/
	@GetMapping(value = "mypage/update_pwd_ok.do", produces = "text/plain;charset=utf-8")
	public String mypage_update_pwd_ok(UserVO vo) {
		String result = "";
		boolean bCheck = dao.userPwdUpdate(vo);
		if (bCheck == true) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
	}
	
	

}
