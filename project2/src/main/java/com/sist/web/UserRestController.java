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
	public String user_login_ok(@RequestBody HashMap<String, Object> map, HttpSession session) {
	    String id = (String) map.get("id");
	    String pwd = (String) map.get("pwd");
	    String result = dao.isLogin(id, pwd);
		if (!(result.equals("NOID") || result.equals("NOPWD"))) {
		    if (result.equals("-1")) {
		        result = "BLOCKED";
		    } else {
		        // 로그인이 된 상태
		        session.setAttribute("id", id);
		        session.setAttribute("grade", result);		        
		    }
		}
		return result;
	}
	
    @PostMapping("join_ok.do")
    public String user_join(UserVO vo) {
        dao.userJoin(vo);
        String result = "<script>location.href=\"../user/login.do\";</script>";
        return result;
    }
    
	@GetMapping(value = "idcheck_ok.do", produces = "text/plain;charset=utf-8")
    public String user_idcheck_ok(String id) {
        String result = "";
        JSONObject obj = new JSONObject();
        int idcheck = dao.idCheck(id);
        if (idcheck == 0) {
            result = id;
        } else {
            result = "no";
        }
        return result;
    }
	
	@GetMapping(value = "emailcheck_ok.do", produces = "text/plain;charset=utf-8")
    public String user_emailcheck_ok(String email) {
        String result = "";
        JSONObject obj = new JSONObject();
        int emailcheck = dao.emailCheck(email);
        if (emailcheck == 0) {
            result = email;
        } else {
            result = "no"; 
        }
        return result;
    }
	
	@GetMapping(value = "idfind_ok.do", produces = "text/plain;charset=utf-8")
	public String user_idfind_ok(String name, String email) {
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		
		String result = dao.idFind(map);
		return result;
	}
	
	@GetMapping(value = "pwdfind_ok.do", produces = "text/plain;charset=utf-8")
	public String user_pwdfind_ok(String id, String email) {
	    Map map = new HashMap();
	    map.put("id", id);
	    map.put("email", email);
	    
	    String result = dao.pwdFind(map);
		return result;
	}
	
	@GetMapping(value = "pwdfind2_ok.do", produces = "text/plain;charset=utf-8")
    public String user_pwdfind2_ok(String id, String email, String question, String answer) {
        Map map = new HashMap();
        map.put("id", id);
        map.put("email", email);
        map.put("question", question);
        map.put("answer", answer);
        
        String result = dao.pwdFind2(map);
        return result;
    }
}