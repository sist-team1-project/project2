package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@RestController
public class MypageRestController {
	@Autowired
	private UserDAO dao;

	@PostMapping(value = "mypage/update_ok.do", produces = "text/plain;charset=utf-8")
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
}
