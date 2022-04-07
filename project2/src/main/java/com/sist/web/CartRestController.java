package com.sist.web;

import java.util.*;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.sist.dao.*;
import com.sist.service.GoodsService;
import com.sist.vo.*;

@RestController
public class CartRestController {

	@Autowired
	private CartDAO dao;

	@PostMapping("cart/insert_ok.do")
	public String cart_insert_ok(CartVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        vo.setU_id(id);
        dao.cartInsert(vo);
		return "";
	}

	
	
}