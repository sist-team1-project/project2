package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CategoryMapper {
    
    @Select("SELECT /*+ INDEX_ASC(category_1 cateogry_c_id_pk_1)*/* FROM category_1")
    public List<CategoryVO> categoryList();
}