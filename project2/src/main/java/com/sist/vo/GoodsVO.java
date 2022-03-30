package com.sist.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor

public class GoodsVO {
    
    private int g_id, g_price, g_sale, g_stock, g_sold, g_status;
    private String c_id, g_name, g_brand, g_image, g_detail, g_regdate;
}