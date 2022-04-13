package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class CommentDAO {

	@Autowired
	private CommentMapper mapper;

	public List<CommentVO> commentListData(Map map) {
		return mapper.commentListData(map);
	}

	public int commentRowCount()
    {
    	return mapper.commentRowCount();
    }
    
    public int commentTotalPage()
    {
 	    return mapper.commentTotalPage();
    }
    
	public void commentInsertData(CommentVO vo) {
		mapper.commentInsertData(vo);
	}
}