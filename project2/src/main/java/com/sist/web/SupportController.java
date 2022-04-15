package com.sist.web;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.sist.vo.*;
import com.sist.dao.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("support/")
public class SupportController {

	@Autowired
	private NoticeDAO ndao;

	@Autowired
	private AskDAO adao;

	@Autowired
	private CommentDAO cdao;

	/******************* 공지사항 *******************/
	/* 공지사항 목록 */
	@GetMapping("notice.do")
	public String notice_list() {
		return "support/notice";
	}

	/* 공지사항 추가 */
	@GetMapping("notice_insert.do")
	public String notice_insert() {
		return "support/notice_insert";
	}
	
	/* 공지사항 상세 */
	@GetMapping("notice_detail.do")
	public String notice_detail(int nid, Model model) {
		NoticeVO vo = ndao.noticeDetailData(nid);
		model.addAttribute("vo", vo);
		model.addAttribute("nid", nid);
		return "support/notice_detail";
	}

	/* 공지사항 수정 */
	@GetMapping("notice_update.do")
	public String notice_notice_update(int nid, Model model) {
		NoticeVO vo = ndao.noticeUpdateData(nid);
		model.addAttribute("vo", vo);
		return "support/notice_update";
	}

	/* 공지사항 삭제 */
	@GetMapping("notice_delete.do")
	public String food_board_delete(int nid, Model model) {
		model.addAttribute("nid", nid);
		return "support/notice_delete";
	}

	/************************************************/

	/******************* 1:1 문의 *******************/
	@GetMapping("ask.do")
	public String askListData(String page, Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		String grade = (String) session.getAttribute("grade");
		if (u_id == null)
			return "main";

		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("u_id", u_id);

		List<AskVO> list = new ArrayList<AskVO>();
		int totalpage = 0;
		if (grade.equals("0")) {
			list = adao.askAdminListData(map);
			totalpage = adao.askAdminTotalPage();
		} else {
			list = adao.askListData(map);
			totalpage = adao.askTotalPage(map);
		}

		final int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage)
			endPage = totalpage;

		model.addAttribute("list", list);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "support/ask";
	}
	
	/* 문의사항 추가 */
	@GetMapping("ask_insert.do")
	public String askInsert(HttpSession session) {
		String uid = (String) session.getAttribute("id");
		if (uid == null)
			return "main";
		return "support/ask_insert";
	}

	/* 문의사항 상세 */
	@GetMapping("ask_detail.do")
	public String askDetailData(int aid, Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		if (u_id == null)
			return "redirect:../main/main.do";

		AskVO vo = adao.askDetailData(aid);
		int count = adao.askCount(vo.getA_group_id());
		model.addAttribute("vo", vo);
		model.addAttribute("count", count);
		return "support/ask_detail";
	}
	
	/* 문의사항 삭제 */
	@GetMapping("ask_delete.do")
	public String askDelete(int aid, Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		String grade = (String) session.getAttribute("grade");
		if (u_id == null || !(adao.checkUser(aid, u_id) && grade.equals("0")))
			return "redirect:../main/main.do";

		model.addAttribute("aid", aid);
		return "support/ask_delete";
	}

	/* 1:1문의 답글 */
	@GetMapping("ask_reply.do")
	public String askReply(int aid, Model model, HttpSession session) {
		String grade = ((String) session.getAttribute("grade"));
		if (grade == null || !grade.equals("0"))
			return "redirect:../main/main.do";

		model.addAttribute("aid", aid);
		return "support/ask_reply";
	}
	/************************************************/
}