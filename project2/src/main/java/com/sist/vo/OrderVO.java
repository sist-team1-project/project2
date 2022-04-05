package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class OrderVO {
	private int o_shipping, o_state;
	private String o_id, u_id, o_receiver, o_phone, o_post, o_address1, o_address2,o_request,o_regdate;
}
