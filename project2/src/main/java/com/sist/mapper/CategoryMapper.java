package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CategoryMapper {
    
    @Select("SELECT * FROM category_1 WHERE LENGTH(c_id)<=3 ORDER BY c_id")
    public List<CategoryVO> categoryList_1();
    
    @Select("SELECT * FROM category_1 WHERE LENGTH(c_id)>3 ORDER BY c_id")
    public List<CategoryVO> categoryList_2();
    
    @Select("SELECT c_title FROM category_1 WHERE c_id=#{cid}")
    public String categoryName(String cid);
    
    @Insert("INSERT INTO category_1 VALUES(#{c_id}, #{c_title})")
    public void category_insert(CategoryVO vo);
    
    @Delete("DELETE FROM category_1 WHERE c_id = #{c_id} AND c_title = #{c_title}")
    public void category_delete(CategoryVO vo);
}