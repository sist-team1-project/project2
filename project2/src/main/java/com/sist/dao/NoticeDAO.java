package com.sist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class NoticeDAO {

    @Autowired
    private NoticeMapper mapper;

    public List<NoticeVO> noticeListData(Map map) {
        return mapper.noticeListData(map);
    }
    
    public int noticeTotalPage() {
        return mapper.noticeTotalPage();
    }

    public void noticeInsertData(NoticeVO vo) {
        mapper.noticeInsertData(vo);
    }

    public NoticeVO noticeDetailData(int nid) {
        mapper.noticeVisitIncrement(nid);
        return mapper.noticeDetailData(nid);
    }

    public NoticeVO noticeUpdateData(int nid) {
        return mapper.noticeDetailData(nid);
    }

    public void noticeUpdate(NoticeVO vo) {
        mapper.noticeUpdate(vo);
    }

    public void noticeDelete(int nid) {
        mapper.noticeDelete(nid);
    }
    
    public List<NoticeVO> headerNotice() {
        return mapper.headerNotice();
    }
}