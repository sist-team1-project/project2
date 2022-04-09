package com.sist.vo;

import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import lombok.*;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class GoodsVO {
    
    private int g_id, g_price, g_sale, g_stock, g_sold, g_status;
    private String c_id, g_name, g_brand, g_image, g_detail, g_regdate;
    private MultipartFile file_gimage,file_gdetail;
}