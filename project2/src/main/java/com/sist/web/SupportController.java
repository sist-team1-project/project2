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
	@GetMapping("notice.do")
	public String notice_list() {
		return "support/notice";
	}
	
	@GetMapping("notice_insert.do")
    public String notice_insert() {
        return "support/notice_insert";
    }
	

	@GetMapping("notice_detail.do")
	public String notice_detail(int no, Model model) {
		NoticeVO vo = ndao.noticeDetailData(no);
		model.addAttribute("vo", vo);
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
	
	// 댓글
    @GetMapping("comment_insert.do")
    public String comment_insert() {
        return "support/notice_insert";
    }

    @GetMapping("comment_insert_ok.do")
    public String comment_insert_ok(CommentVO vo, HttpSession session) {
        session.setAttribute("u_id", vo.getN_id());
        cdao.commentInsertData(vo);
        return "ok";
    }
    /************************************************/
    
	/******************* 1:1 문의 *******************/
	@GetMapping("ask.do")
	public String askListData(String page, Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		if(u_id == null) return "main";
		
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;
		map.put("start", start);
		map.put("end", end);
		map.put("u_id", u_id);

		List<AskVO> list = adao.askListData(map);
		List<AskVO> alist = adao.askAdminListData(map);

		int totalpage = adao.askTotalPage(map);
		int atotalpage = adao.askAdminTotalPage();

		final int BLOCK = 5;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		
		int astartPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int aendPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;

		if (endPage > totalpage)
			endPage = totalpage;

		if (aendPage > atotalpage)
			aendPage = atotalpage;

		model.addAttribute("list", list);
		model.addAttribute("alist", alist);
		model.addAttribute("curpage", curpage);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("atotalpage", atotalpage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("astartPage", astartPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("aendPage", aendPage);
		return "support/ask";
	}

	@GetMapping("ask_insert.do")
	public String askInsert(HttpSession session) {
	    String uid = (String) session.getAttribute("id");
	    if (uid == null) return "main";
		return "support/ask_insert";
	}

	@GetMapping("ask_detail.do")
	public String askDetailData(int no, Model model, HttpSession session) {
	    String u_id = (String) session.getAttribute("id");
	    String grade = (String) session.getAttribute("grade");
        if(u_id == null || (!(adao.checkUser(no, u_id)) && !grade.equals("0"))) return "redirect:../main/main.do";
        
		AskVO vo = adao.askDetailData(no);
		int count = adao.askCount(vo.getA_group_id());
		model.addAttribute("vo", vo);
		model.addAttribute("count", count);
		return "support/ask_detail";
	}
	
    @GetMapping("ask_delete.do")
    public String askDelete(int no, Model model, HttpSession session) {
        String u_id = (String) session.getAttribute("id");
        String grade = (String) session.getAttribute("grade");
        if(u_id == null || (!(adao.checkUser(no, u_id)) && !grade.equals("0"))) return "redirect:../main/main.do";
        
        model.addAttribute("no", no);
        return "support/ask_delete";
    }    
    
    @GetMapping("ask_reply.do")
    public String askReply(int no, Model model, HttpSession session) {
        String grade = ((String)session.getAttribute("grade"));
        if( grade == null || !grade.equals("0")) return "redirect:../main/main.do";
        
        model.addAttribute("no", no);
        return "support/ask_reply";
    }
    /************************************************/
	
}
