package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AskVO {
    
    private int a_id, a_group_id, a_group_step, a_group_tab;
    private String u_id, a_type, a_title, a_content, a_regdate;
}