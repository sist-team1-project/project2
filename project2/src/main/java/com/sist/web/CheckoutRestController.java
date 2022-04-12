package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("checkout/")
public class CheckoutRestController {

	@Autowired
	private CartDAO cartdao;
	
	@Autowired
	private GoodsDAO gdao;
    
    @GetMapping(value = "checkout_list_vue.do", produces = "text/plain;charset=utf-8")
    public String checkout_checkout_list_vue(String gid) {
        
        System.out.println("aa: " + gid);
        StringTokenizer st = new StringTokenizer(gid,",");
        List<String> gids = new ArrayList<String>();
        while(st.hasMoreTokens()){
            gids.add(st.nextToken());
        }
        
        Map map = new HashMap();
        map.put("gids", gids);
        List<GoodsVO> list = gdao.checkOutGoodsDetail(map);
        
        
        JSONArray arr = new JSONArray();
/*        g_id,g_name,g_brand,g_price,g_sale,g_image,g_stock,g_sold,g_status*/
        for (GoodsVO vo : list) {
            JSONObject obj = new JSONObject();
            obj.put("gname", vo.getG_name());
            obj.put("gbrand", vo.getG_brand());
            obj.put("gprice", vo.getG_price());
            obj.put("gsale", vo.getG_sale());
            String images = vo.getG_image();
            if (images == null) {
                images = "";
            }
            String[] image = images.split(";");
            obj.put("gimage", image[0]);
            obj.put("gstock", vo.getG_stock());
            obj.put("gsold", vo.getG_sold());
            obj.put("gsold", vo.getG_status());
            
            arr.add(obj);
        }
        
        return arr.toJSONString();
    }
    

}