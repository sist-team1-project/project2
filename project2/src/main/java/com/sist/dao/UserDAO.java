package com.sist.dao;

import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class UserDAO {

	@Autowired
	private UserMapper mapper;

	public String isLogin(String id, String pwd) {
		String result = "";
		// id체크
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

	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
	}
	
	public UserVO userInfo(String uid) {
		return mapper.userInfo(uid);
	}
	
	public String userFind(String id, String email) {
		String result="";
		int countId=mapper.idCount(id);
		int countEmail=mapper.emailCount(email);
		if (countId==1 && countEmail==1) {
			result = "ADMIT";
		} else {
			result ="NORESULT";
		}
		return result;
	}
	
}