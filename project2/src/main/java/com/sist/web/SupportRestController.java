package com.sist.web;

import java.util.*;

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
	public String notice_list_vue(String page) {
		String result = "";
		try {
			if (page == null)
				page = "1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);
			List<NoticeVO> list = ndao.noticeListData(map);
			int totalpage = ndao.noticeTotalPage();

			JSONArray arr = new JSONArray();
			int i = 0;
			for (NoticeVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("n_id", vo.getN_id());
				obj.put("n_title", vo.getN_title());
				obj.put("u_id", vo.getU_id());
				obj.put("n_regdate", vo.getN_regdate());
				obj.put("n_visits", vo.getN_visits());
				if (i == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				i++;
			}
			result = arr.toJSONString();
		} catch (Exception ex) {
		}

		return result;
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
	public String food_board_update_vue(int no) {
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
	@PostMapping("ask_update_ok.do")
	public String askUpdateOk(AskVO vo) {
		String result = "";
		result = "<script>location.href=\"../ask/detail.do?no=" + vo.getA_id() + "\";</script>";
		return result;
	}

	@PostMapping("ask_delete_ok.do")
	public String askDeleteOk(int no, String pwd) {
		String result = "";
		result = "<script>location.href=\"../support/ask.do\";</script>";
		return result;
	}
}