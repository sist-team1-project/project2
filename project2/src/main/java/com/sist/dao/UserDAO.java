package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;
import com.sist.manager.*;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper mapper;
	
	public String isLogin(String id, String pwd) {
		String result = "";
		int count = mapper.idCount(id);
		if (count == 0) {
			result = "NOID";
		} else {
			String data = mapper.memberGetPwdAndName(id);
			StringTokenizer st = new StringTokenizer(data, ",");
			String db_pwd = st.nextToken();
			String grade = st.nextToken();
			if (db_pwd.equals(pwd)) {
				result = grade;
			} else {
				result = "NOPWD";
			}
		}
		return result;
	}

	public int idCheck(String id) {
		int result = mapper.idCount(id);
		return result;
	}

	public int emailCheck(String email) {
		int result = mapper.emailCount(email);
		return result;
	}
	
	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
	    MailSender sender = new MailSender();
	    sender.joinMailSend(vo);
		System.out.println(vo.getU_email());
	}

	public UserVO userInfo(String uid) {
		return mapper.userInfo(uid);
	}

	public String userFind(Map map) {
		String result = "";
		int idCount = mapper.idEmailCount(map);
		if (idCount == 0) {
			result = "NORESULT";
		} else {
			result = mapper.idFind(map);
		}
		return result;
	}

	// 유저정보 수정
	/*
	 * public boolean userUpdate(UserVO vo) { boolean bCheck = false; String db_pwd
	 * = mapper.userGetPassword(vo.getU_id()); if
	 * (db_pwd.equals(vo.getU_password())) { bCheck = true; mapper.userUpdate(vo); }
	 * return bCheck; }
	 */

	public boolean userPwdUpdate(String id, String pwd, Map map) {
		boolean bCheck = false;
		System.out.println(id+"aaaaaaaaaaaaaaaaaaaaaaaaaaa");
		String db_pwd = mapper.userGetPassword(id);
		System.out.println(db_pwd + "bbbbbbbbbbbbbbbbbbbbbbb");
		if (db_pwd.equals(pwd)) {
			bCheck = true;
			mapper.userPwdUpdate(map);
			System.out.println("true                cccccccccccccccccccccccccc");
		} else {
			bCheck = false;
			System.out.println("false                cccccccccccccccccccccccccc");
		}
		return bCheck;
	}

	/******* USER admin **********/
	public List<UserVO> userList(Map map) {
		return mapper.userList(map);
	}

	public int userTotalPage() {
		return mapper.userTotalPage();
	}

	public int userCount() {
		return mapper.userCount();
	}
	
	public int gradeupdate(Map map) {
		return mapper.gradeupdate(map);
	}
}