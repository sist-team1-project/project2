package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CategoryMapper {
    
    @Select("SELECT /*+ INDEX_ASC(category_1 cateogry_c_id_pk_1)*/* FROM category_1 WHERE LENGTH(c_id)<=3")
    public List<CategoryVO> categoryList_1();
    
    @Select("SELECT /*+ INDEX_ASC(category_1 cateogry_c_id_pk_1)*/* FROM category_1 WHERE LENGTH(c_id)>3")
    public List<CategoryVO> categoryList_2();
    
    @Select("SELECT c_title FROM category_1 WHERE c_id=#{cid}")
    public String categoryName(String cid);
}