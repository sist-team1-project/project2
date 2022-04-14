package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class AskDAO {

	@Autowired
	private AskMapper mapper;

	/* -- 문의 리스트 데이터 -- */
	public List<AskVO> askListData(Map map) {
		return mapper.askListData(map);
	}
	
	/* -- 문의 총 갯수 -- */
	public int askRowCount() {
		return mapper.askRowCount();
	}

	/* -- 문의 총 페이지 -- */
	public int askTotalPage(Map map) {
		return mapper.askTotalPage(map);
	}
	
	public List<AskVO> askAdminListData(Map map) {
		return mapper.askAdminListData(map);
	}
	
	/* -- 관리자 문의 총 갯수 -- */
	public int askAdminRowCount() {
		return mapper.askAdminRowCount();
	}

	/* -- 관리자 문의 총 페이지 -- */
	public int askAdminTotalPage() {
		return mapper.askAdminTotalPage();
	}

	/* -- 문의 등록 -- */
	public void askInsert(AskVO vo) {
		mapper.askInsert(vo);
	}

	/* -- 댓글 작성 시 질문 tab 증가 -- */
	public AskVO askDetailData(int no) {
		return mapper.askDetailData(no);
	}

	/* -- 문의 번호 -- */
	public int askCount(int a_group_id) {
		return mapper.askCount(a_group_id);
	}

	/* -- 문의 정보 -- */
	public AskVO askParentInfoData(int no) {
		return mapper.askParentInfoData(no);
	}

	/* -- 답변 등록 -- */
	public void askReplyInsert(AskVO vo) {
		mapper.askReplyInsert(vo);
	}

	/* -- 문의 삭제 시 답변과 함께 삭제 -- */
	public void askDelete1(int no, int group_id) {
		mapper.askDelete1(group_id);
	}

	/* -- 답변 삭제 -- */
	public void askDelete2(int no) {
		mapper.askDelete2(no);
	}
    
	/* -- 관리자 리스트 데이터 -- */
	public List<AskVO> askListData_admin(Map map) {
		return mapper.askListData_admin(map);
	}

	/* -- 답변 작성 시 문의 tab 증가 -- */
	public void asktabReply(AskVO vo) {
		mapper.asktabReply(vo);
	}

}
