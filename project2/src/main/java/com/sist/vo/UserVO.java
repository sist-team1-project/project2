package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserVO {
    
    private int u_grade;
    private String u_id, u_password, u_name, u_gender, u_phone, u_email, u_post, u_address1, u_address2, u_question, u_answer, u_regdate;
}