package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class SupportRestController {

	@Autowired
	private NoticeDAO ndao;

	@Autowired
	private AskDAO adao;

	@GetMapping(value = "support/notice_vue.do", produces = "text/plain;charset=utf-8")
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
				obj.put("nid", vo.getN_id());
				obj.put("ntitle", vo.getN_title());
				obj.put("uid", vo.getU_id());
				obj.put("nregdate", vo.getN_regdate());
				obj.put("nvisits", vo.getN_visits());
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

	@GetMapping(value = "support/notice_detail_vue.do", produces = "text/plain;charset=utf-8")
	public String notice_detail_vue(int no) {
		String result = "";
		try {
			NoticeVO vo = ndao.noticeDetailData(no);
			JSONObject obj = new JSONObject();
			obj.put("nid", vo.getN_id());
			obj.put("ntitle", vo.getN_title());
			obj.put("uid", vo.getU_id());
			obj.put("nregdate", vo.getN_regdate());
			obj.put("ncontent", vo.getN_content());
			obj.put("nvisits", vo.getN_visits());

			result = obj.toJSONString();
			System.out.println(result);
		} catch (Exception ex) {
		}

		return result;
	}

	@GetMapping(value = "support/notice_delete_ok.do", produces = "text/plain;charset=utf-8")
	public String board_delete(int no, String pwd) {
		String result = "";
		boolean bCheck = ndao.noticeDelete(no, pwd);
		if (bCheck == true) {
			result = "YES";
		} else {
			result = "NO";
		}
		return result;
	}

	@PostMapping("support/ask_update_ok.do")
	public String askUpdateOk(AskVO vo) {
		String result = "";
		boolean bCheck = adao.askUpdate(vo);
		if (bCheck == true) {
			result = "<script>location.href=\"../ask/detail.do?no=" + vo.getA_id() + "\";</script>";
		} else {
			result = "<script>" + "alert(\"Password Fail!!\");" + "history.back();" + "</script>";
		}
		return result;
	}

	@PostMapping("support/ask_delete_ok.do")
	public String askDeleteOk(int no, String pwd) {
		String result = "";
		AskVO vo = adao.askDetailData(no);
		boolean bCheck = false;
		if (vo.getA_group_step() == 0) {
			bCheck = adao.askDelete1(no, vo.getA_group_id(), pwd);
		} else {
			bCheck = adao.askDelete2(no, pwd);
		}

		if (bCheck == true) {
			result = "<script>location.href=\"../support/ask.do\";</script>";
		} else {
			result = "<script>" + "alert(\"Password Fail!!\");" + "history.back();" + "</script>";
		}
		return result;
	}
}