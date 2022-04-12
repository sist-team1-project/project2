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

	// 로그인: 아이디, 비밀번호로 유저 존재 여부 확인 → 존재하면 유저 등급 가져옴
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

	// 회원가입 & 회원정보 변경: 아이디 중복체크
	public int idCheck(String id) {
		int result = mapper.idCount(id);
		return result;
	}

	// 회원가입 & 회원정보 변경: 이메일 중복체크
	public int emailCheck(String email) {
		int result = mapper.emailCount(email);
		return result;
	}

	// 회원가입: 이메일 발송
	public void userJoin(UserVO vo) {
		mapper.userJoin(vo);
		MailSender sender = new MailSender();
		sender.joinMailSend(vo);
		System.out.println(vo.getU_email());
	}

	// 회원정보 출력
	public UserVO userInfo(String uid) {
		return mapper.userInfo(uid);
	}

	// 아이디 찾기: 이름과 이메일로 존재 여부 확인
	public String idFind(Map map) {
		String result = "";
		int count = mapper.nameEmailCount(map);
		if (count == 0) {
			result = "NORESULT";
		} else {
			result = mapper.idFind(map);
		}
		return result;
	}

	// 비밀번호 찾기: 아이디와 이메일로 존재 여부 확인 → 존재하면 질문 가져옴
	public String pwdFind(Map map) {
		String result = "";

		int count = mapper.idEmailCount(map);
		if (count == 0) {
			result = "NORESULT";
		} else {
			result = mapper.questionFind(map);
		}
		return result;
	}

	// 비밀번호 찾기: 질문과 답변이 일치하면 이메일로 초기화된 비밀번호를 보냄
	public String pwdFind2(Map map) {
		String result = "";

		int count = mapper.questionAnswerCount(map);
		if (count == 0) {
			result = "NORESULT";
		} else {
			UserVO user = mapper.userInfo((String) map.get("id"));

			MailSender sender = new MailSender();
			String newPassword = sender.resetPwdMailSend(user);

			Map map2 = new HashMap();
			map2.put("id", (String) map.get("id"));
			map2.put("password", newPassword);
			mapper.userPwdUpdate(map2);

		}
		return result;
	}

	// 비밀번호 변경 - 아이디에 따른 비번이 서버 비번과 일치시 변경
	public boolean userPwdUpdate(Map map) {
		boolean bCheck = false;
		String db_pwd = mapper.userGetPassword((String) map.get("id"));
		if (db_pwd.equals((String) map.get("password"))) {
			bCheck = true;
			mapper.userPwdUpdate(map);
		} else {
			bCheck = false;
		}
		return bCheck;
	}

	// 계정 삭제 - 아이디에 따른 비번이 서버 비번과 일치시 삭제
	public boolean userDelete(String id, String pwd) {
		boolean bCheck = false;
		String db_pwd = mapper.userGetPassword(id);
		if (db_pwd.equals(pwd)) {
			bCheck = true;
			mapper.userDelete(id);
		} else {
			bCheck = false;
		}
		System.out.println(bCheck+"정상 비번입력시에도 bCheck -> fasle로 출력");
		return bCheck;
	}
	/*	public boolean userDelete(Map map) {
		boolean bCheck = false;
		String db_pwd = mapper.userGetPassword((String) map.get("id"));
		if (db_pwd.equals((String) map.get("password"))) {
			bCheck = true;
			mapper.userDelete((String) map.get("id"));
		} else {
			bCheck = false;
		}
		System.out.println(bCheck+"정상 비번입력시에도 bCheck -> fasle로 출력");
		return bCheck;
	}
*/	

	// 유저정보 수정
	public boolean userUpdate(UserVO vo) {
		boolean bCheck = false;
		String db_pwd = mapper.userGetPassword(vo.getU_id());
		if (db_pwd.equals(vo.getU_password())) {
			bCheck = true;
			mapper.userUpdate(vo);
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