package com.sist.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class ReviewGoodsDAO {

    @Autowired
    private ReviewGoodsMapper mapper;

    public List<ReviewGoodsVO> reviewList(Map map) {
        return mapper.reviewList(map);
    }

    public int reviewListTotalpage(int gid) {
        return mapper.reviewListTotalpage(gid);
    }
}