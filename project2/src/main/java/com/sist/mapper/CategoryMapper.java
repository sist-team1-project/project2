package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CategoryMapper {
    
    @Select("SELECT * FROM category WHERE LENGTH(c_id)<=3 ORDER BY c_id")
    public List<CategoryVO> categoryList_1();
    
    @Select("SELECT * FROM category WHERE LENGTH(c_id)>3 ORDER BY c_id")
    public List<CategoryVO> categoryList_2();
    
    @Select("SELECT * FROM category WHERE category c_id LIKE #{cid}||'%' ORDER BY c_id")
    public List<CategoryVO> findCategory(String cid);
    
    @Select("SELECT c_title FROM category WHERE c_id=#{cid}")
    public String categoryName(String cid);
    
    @Insert("INSERT INTO category VALUES(#{c_id}, #{c_title})")
    public void category_insert(CategoryVO vo);
    
    @Delete("DELETE FROM category WHERE c_id = #{c_id} AND c_title = #{c_title}")
    public void category_delete(CategoryVO vo);
}