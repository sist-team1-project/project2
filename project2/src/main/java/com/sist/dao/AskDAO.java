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

	public List<AskVO> askListData(Map map) {
		return mapper.askListData(map);
	}

	public int askRowCount() {
		return mapper.askRowCount();
	}

	public int askTotalPage() {
		return (int) (Math.ceil(mapper.askRowCount() / 10.0));
	}

	public void askInsert(AskVO vo) {
		mapper.askInsert(vo);
	}

	public AskVO askDetailData(int no) {
		return mapper.askDetailData(no);
	}

	public int askCount(int a_group_id) {
		return mapper.askCount(a_group_id);
	}

	public AskVO askParentInfoData(int no) {
		return mapper.askParentInfoData(no);
	}

	public void askReplyInsert(AskVO vo) {
		mapper.askReplyInsert(vo);
	}

	public AskVO askUpdateData(int no) {
		return mapper.askDetailData(no);
	}

	public void askUpdate(AskVO vo) {
		mapper.askUpdate(vo);
	}

	public void askDelete1(int no, int group_id) {
		mapper.askDelete1(group_id);
	}

	public void askDelete2(int no) {
		mapper.askDelete2(no);
	}

	public List<AskVO> askListData_admin(Map map) {
		return mapper.askListData_admin(map);
	}

	/* -- 댓글 작성 시 질문 tab 증가 -- */
	public void asktabReply(AskVO vo) {
		mapper.asktabReply(vo);
	}

	/*   --- 질문에 대한 그룹아이디 확인  --- */
	public int agid(int a_id) {
		return mapper.agid(a_id);
	}

	/*   --- 그룹아이디로 댓글 가져오기  --- */
	public AskVO replyData(int a_group_id) {
		return mapper.replyData(a_group_id);
	}

}
