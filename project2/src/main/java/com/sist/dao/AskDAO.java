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

	public int askCount(int group_id) {
		return mapper.askCount(group_id);
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
}
