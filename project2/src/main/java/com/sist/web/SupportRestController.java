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

		final int BLOCK = 10;
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

	/*  공지사항 입력  */
	@PostMapping("notice_insert_ok.do")
	public String notice_insert_ok(NoticeVO vo, HttpSession session) {
		vo.setU_id((String) session.getAttribute("id"));
		ndao.noticeInsertData(vo);
		return "<script>alert(\"게시물이 작성되었습니다\"); location.href=\"../support/notice.do\";</script>";
	}

	/*  공지사항 수정  */
	@PostMapping("notice_update_ok.do")
	public String notice_update(NoticeVO vo) {
		ndao.noticeUpdate(vo);
		return "<script>alert(\"게시물이 업데이트되었습니다\"); location.href=\"../support/notice.do\";</script>";
	}
	/*  공지사항 삭제  */
	@PostMapping("notice_delete_ok.do")
	public String notice_delete(int nid) {
		ndao.noticeDelete(nid);
		return "<script>alert(\"게시물이 삭제되었습니다\"); location.href=\"../support/notice.do\";</script>";
	}
	/*  1:1문의 입력  */
	@PostMapping("ask_insert_ok.do")
	public String askInsertOk(AskVO vo, HttpSession session) {
		String uid = (String) session.getAttribute("id");
		vo.setU_id(uid);
		adao.askInsert(vo);
		return "<script>alert(\"게시물이 작성되었습니다\"); location.href=\"../support/ask.do\";</script>";
	}
	/*  1:1문의 삭제  */
	@PostMapping("ask_delete_ok.do")
	public String askDeleteOk(int aid) {
		AskVO vo = adao.askDetailData(aid);
		if (vo.getA_group_step() == 0) {
			adao.askDelete1(vo.getA_group_id());
		} else {
			adao.askDelete2(aid);
		}
		return "<script>alert(\"게시물이 삭제되었습니다\"); location.href=\"../support/ask.do\";</script>";
	}
	/*  1:1문의 답글추가  */
	@PostMapping("ask_reply_ok.do")
	public String askReplyInsert(AskVO vo, HttpSession session) {
		String uid = (String) session.getAttribute("id");

		AskVO pvo = adao.askParentInfoData(vo.getA_id());
		AskVO detailvo = adao.askDetailData(vo.getA_id());

		vo.setU_id(uid);
		vo.setA_type("답변");
		vo.setA_group_id(pvo.getA_group_id());
		vo.setA_group_step(pvo.getA_group_step() + 1);
		vo.setA_group_tab(pvo.getA_group_tab() + 1);

		adao.askReplyInsert(vo);
		adao.asktabReply(detailvo);

		return "<script>alert(\"답변이 작성되었습니다\"); location.href=\"../support/ask.do\";</script>";
	}
}