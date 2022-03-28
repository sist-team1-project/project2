package com.sist.vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GoodsVO {
    
    private int g_id, g_price, g_sale, g_stock, g_sold, g_status;
    private String c_id, g_name, g_brand, g_image, g_detail, g_regdate;
}