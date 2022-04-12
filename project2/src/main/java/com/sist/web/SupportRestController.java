package com.sist.web;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.json.simple.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("support/")
public class SupportRestController {

	@Autowired
	private NoticeDAO ndao;

	@Autowired
	private AskDAO adao;

	// 공지사항
	@GetMapping(value = "notice_vue.do", produces = "text/plain;charset=utf-8")
	public String notice_list_vue(int page, HttpSession session) {
		String uid = (String) session.getAttribute("id");
		if (uid == null) {
			uid = "";
		}

		int curpage = page;

		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = (rowSize * curpage);

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> list = ndao.noticeListData(map);
		int totalpage = ndao.noticeTotalPage();

		final int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		JSONArray arr = new JSONArray();
		if (list.size() == 0) {
			JSONObject obj = new JSONObject();
			obj.put("curpage", curpage);
			obj.put("totalpage", totalpage);
			obj.put("start", startPage);
			obj.put("end", endPage);
			arr.add(obj);
		} else {
			for (int i = 0; i < list.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("n_id", list.get(i).getN_id());
				obj.put("n_title", list.get(i).getN_title());
				obj.put("u_id", list.get(i).getU_id());
				obj.put("n_regdate", list.get(i).getN_regdate());
				obj.put("n_visits", list.get(i).getN_visits());

				if (i == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
					obj.put("start", startPage);
					obj.put("end", endPage);
				}
				arr.add(obj);
			}
		}
		return arr.toJSONString();
	}

	@GetMapping(value = "notice_detail_vue.do", produces = "text/plain;charset=utf-8")
	public String notice_detail_vue(int no) {
		String result = "";
		try {
			NoticeVO vo = ndao.noticeDetailData(no);
			JSONObject obj = new JSONObject();
			obj.put("n_id", vo.getN_id());
			obj.put("n_title", vo.getN_title());
			obj.put("u_id", vo.getU_id());
			obj.put("n_regdate", vo.getN_regdate());
			obj.put("n_content", vo.getN_content());
			obj.put("n_visits", vo.getN_visits());

			result = obj.toJSONString();
			System.out.println(result);
		} catch (Exception ex) {
		}

		return result;
	}

	@GetMapping(value = "notice_update_vue.do", produces = "text/plain;charset=utf-8")
	public String notice_update_vue(int no) {
		String result = "";
		try {
			NoticeVO vo = ndao.noticeUpdateData(no);
			JSONObject obj = new JSONObject();
			obj.put("u_id", vo.getU_id());
			obj.put("n_title", vo.getN_title());
			obj.put("n_content", vo.getN_content());

			result = obj.toJSONString();
		} catch (Exception ex) {
		}
		return result;
	}

	@GetMapping(value = "notice_update_ok_vue.do", produces = "text/plain;charset=utf-8")
	public String notice_update(NoticeVO vo) {
		String result = "";
		ndao.noticeUpdate(vo);
		result = "YES";
		return result;
	}

	@GetMapping(value = "notice_delete_ok.do", produces = "text/plain;charset=utf-8")
	public String notice_delete(int no) {
		String result = "";
		ndao.noticeDelete(no);
		result = "YES";
		return result;
	}

	// 1:1 문의
	@PostMapping("ask_delete_ok.do")
	public String askDeleteOk(int no) {
		String result = "";
		AskVO vo = adao.askDetailData(no);
		if (vo.getA_group_step() == 0) {
			adao.askDelete1(no, vo.getA_group_id());
		} else {
			adao.askDelete2(no);
		}
		result = "<script>location.href=\"../support/ask.do\";</script>";
		return result;
	}
}