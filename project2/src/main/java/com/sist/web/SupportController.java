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

	// 공지사항
	@GetMapping("notice.do")
	public String notice_list() {
		return "support/notice";
	}

	@GetMapping("notice_insert.do")
	public String notice_insert() {
		return "support/notice_insert";
	}

	@GetMapping("notice_insert_ok.do")
	@ResponseBody
	public String notice_insert_ok(NoticeVO vo, HttpSession session) {
		session.setAttribute("u_id", vo.getN_id());
		ndao.noticeInsertData(vo);
		return "ok";
	}

	@GetMapping("notice_detail.do")
	public String notice_detail(int no, Model model) {
		model.addAttribute("no", no);
		return "support/notice_detail";
	}

	@GetMapping("notice_update.do")
	public String notice_notice_update(int no, Model model) {
		model.addAttribute("no", no);
		return "support/notice_update";
	}

	@GetMapping("notice_delete.do")
	public String food_board_delete(int no, Model model) {
		model.addAttribute("no", no);
		return "support/notice_delete";
	}

	// 1:1 문의
	@GetMapping("ask.do")
	public String askListData(String page, Model model) {
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		map.put("start", start);
		map.put("end", end);
		List<AskVO> list = adao.askListData(map);
		List<AskVO> rlist = adao.replyListData(map);
		
		int totalpage = adao.askTotalPage();

		int count = adao.askRowCount();
		count = count - ((curpage * rowSize) - rowSize);
		final int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage)
			endPage = totalpage;

		model.addAttribute("list", list);
		model.addAttribute("rlist", rlist);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("count", count);
		return "support/ask";
	}

	@GetMapping("ask_insert.do")
	public String askInsert() {
		return "support/ask_insert";
	}

	@PostMapping("ask_insert_ok.do")
	public String askInsertOk(AskVO vo) {
		adao.askInsert(vo);
		return "redirect:../support/ask.do";
	}

	@GetMapping("ask_detail.do")
	public String askDetailData(int no, Model model) {
		AskVO vo = adao.askDetailData(no);
		int count = adao.askCount(vo.getA_group_id());
		model.addAttribute("vo", vo);
		model.addAttribute("count", count);
		return "support/ask_detail";
	}

	@GetMapping("ask_reply.do")
	public String askReply(int no, Model model) {
		model.addAttribute("no", no);
		return "support/ask_reply";
	}

	@PostMapping("ask_reply_ok.do")
	public String askReplyInsert(int pno, AskVO vo) {
		AskVO pvo=adao.askParentInfoData(pno);
		vo.setA_group_id(pvo.getA_group_id());
		vo.setA_group_step(pvo.getA_group_step() + 1);
		vo.setA_group_tab(pvo.getA_group_tab() + 1);

		adao.askReplyInsert(vo);

		return "redirect:../admin/ask_admin.do";
	}

	@GetMapping("ask_delete.do")
	public String askDelete(int no, Model model) {
		model.addAttribute("no", no);
		return "support/ask_delete";
	}
}