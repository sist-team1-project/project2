package com.sist.vo;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderDetailVO {
    private int od_id, g_id, g_price, g_sale, g_quantity;
    private String o_id, g_name;
    private List<OrderDetailVO> orderDetailVOList;
}