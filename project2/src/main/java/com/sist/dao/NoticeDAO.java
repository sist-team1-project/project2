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
    /* 공지사항 리스트 */
    public List<NoticeVO> noticeListData(Map map) {
        return mapper.noticeListData(map);
    }
    /* 공지사항 페이지개수 */
    public int noticeTotalPage() {
        return mapper.noticeTotalPage();
    }
    /* 공지사항 입력 */
    public void noticeInsertData(NoticeVO vo) {
        mapper.noticeInsertData(vo);
    }
    /* 공지사항 상세보기 */
    public NoticeVO noticeDetailData(int nid) {
        mapper.noticeVisitIncrement(nid);
        return mapper.noticeDetailData(nid);
    }
    /* 공지사항 수정_전 */
    public NoticeVO noticeUpdateData(int nid) {
        return mapper.noticeDetailData(nid);
    }
    /* 공지사항 수정_완료 */
    public void noticeUpdate(NoticeVO vo) {
        mapper.noticeUpdate(vo);
    }
    /* 공지사항 삭제 */
    public void noticeDelete(int nid) {
        mapper.noticeDelete(nid);
    }
    /* 헤더 공지사항  */
    public List<NoticeVO> headerNotice() {
        return mapper.headerNotice();
    }
}