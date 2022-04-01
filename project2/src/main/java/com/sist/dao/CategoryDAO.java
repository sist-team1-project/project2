package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.vo.*;
import com.sist.mapper.*;

@Repository
public class CategoryDAO {
    
    @Autowired
    private CategoryMapper mapper;
    
    public List<CategoryVO> categoryList_1(){
        return mapper.categoryList_1();
    }
    
    public List<CategoryVO> categoryList_2(){
        return mapper.categoryList_2();
    }
}