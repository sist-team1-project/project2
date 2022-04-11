package com.sist.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;

import com.sist.vo.*;

public interface CampingMapper {
	/* 캠핑장  주소 비교해서 불러오기 */
	@Select("SELECT * "
			+"FROM (SELECT u_id, u_name, substr(u_address1,1,6) as address, camp_id,camp_name, substr(camp_address,1,6 )as campaddress, camp_type,camp_content,camp_photo, rownum as num" 
			+"FROM user_1 u, camping_1 c"
			+"WHERE substr(u.u_address1,1,6) = substr(c.camp_address,1,6)" 
			+"ORDER BY camp_id desc)")
	public List<Map<String, Object>> campingRecommend(Map map);
}