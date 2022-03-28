package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeVO {
    
    private int n_id, n_visit;
    private String u_id, n_title, n_content, n_regdate;
}