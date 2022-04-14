package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("mypage/")
public class MypageRestController {

	@Autowired
	private UserDAO dao;

	@Autowired
	private OrderDAO odao;

	@Autowired
	private LikeDAO ldao;

	// 회원정보 상세
	@GetMapping(value = "info_vue.do", produces = "text/plain;charset=utf-8")
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

	// 회원정보 수정
	@PostMapping("update_ok.do")
	public String mypage_update_ok(UserVO vo, HttpSession session) {
		String uid = (String) session.getAttribute("id");
		vo.setU_id(uid);
		String result = "";
		if (vo.getU_address2() == null) {
			vo.setU_address2("");
		}
		boolean bCheck = dao.userUpdate(vo);
		if (bCheck == true) {
			result = "<script>alert(\"변경이 완료되었습니다.\"); location.href=\"../mypage/mypage.do\"</script>";
		} else {
			result = "<script>alert(\"정보가 일치하지 않습니다\"); history.back();</script>";
		}
		return result;
	}

	// 비밀번호 변경
	@PostMapping("update_pwd_ok.do")
	public String mypage_update_pwd_ok(String password, String newPassword, HttpSession session) {
		String uid = (String) session.getAttribute("id");
		String result = "";

		Map map = new HashMap();
		map.put("uid", uid);
		map.put("password", password);
		map.put("newPassword", newPassword);

		boolean bCheck = dao.userPwdUpdate(map);
		if (bCheck == true) {
			result = "<script>alert(\"비밀번호 변경이 완료되었습니다.\"); location.href=\"../mypage/mypage.do\"</script>";
		} else {
			result = "<script>alert(\"정보가 일치하지 않습니다\"); history.back();</script>";
		}
		return result;
	}

	// 유저 계정삭제
	@PostMapping("delete_ok.do")
	public String mypage_delete_ok(String password, HttpSession session) {
		String id = (String) session.getAttribute("id");
		String result = "";
		boolean bCheck = dao.userDelete(id, password);
		if (bCheck == true) {
			result = "<script>alert(\"계정이 사망하셨습니다.\"); location.href=\"../main/main.do\"</script>";
			session.invalidate();
		} else {
			result = "<script>alert(\"비밀번호가 일치하지 않습니다.\"); history.back();</script>";
		}
		return result;
	}

	/* 유저 주문정보 */
	@GetMapping(value = "orderInfoList_vue.do", produces = "text/plain;charset=utf-8")
	public String orderInfoList(int page, HttpSession session) {
		String uid = (String) session.getAttribute("id");

		int curpage = page;

		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (rowSize * curpage);

		Map map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		map.put("uid", uid);

		int totalpage = odao.userOrderTotalPage(map);
		List<OrderVO> list = odao.orderInfoList(map);
		int count = odao.userOrderCount(map);

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		JSONArray arr = new JSONArray();
		int i = 0;
		for (OrderVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("oid", vo.getO_id());
			obj.put("uid", vo.getU_id());
			obj.put("regdate", vo.getO_regdate());
			obj.put("state", vo.getO_state());

			if (i == 0) {
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
				obj.put("totalpage", totalpage);
				obj.put("curpage", curpage);
				obj.put("count", count);
			}
			arr.add(obj);
		}
		return arr.toJSONString();
	}

	/********** 유저 주문 취소 ************/
	@PostMapping("user_state_cancel_ok.do")
	public void user_state_cancel_ok(int state, String oid, HttpSession session) {
		String uid = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("state", state);
		map.put("oid", oid);
		map.put("uid", uid);
		odao.userOrderCancel(map);
	}

	@GetMapping(value = "likeList_vue.do", produces = "text/plain;charset=utf-8")
	public String likeList(int page, HttpSession session) {
		String uid = (String) session.getAttribute("id");

		int curpage = page;

		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (rowSize * curpage);

		int totalpage = ldao.likeListTotalPage(uid);

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		Map map = new HashMap();
		map.put("uid", uid);
		map.put("start", start);
		map.put("end", end);

		List<Map<String, Object>> list = ldao.likeList(map);

		JSONArray arr = new JSONArray();
		int i = 0;
		for (Map<String, Object> j : list) {
			JSONObject obj = new JSONObject();
			obj.put("lid", j.get("L_ID"));
			obj.put("gid", j.get("G_ID"));
			obj.put("gname", j.get("G_NAME"));

			if (i == 0) {
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
				obj.put("totalpage", totalpage);
				obj.put("curpage", curpage);
			}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}
}