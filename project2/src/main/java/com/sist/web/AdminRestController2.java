package com.sist.web;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.sist.dao.*;
import com.sist.vo.*;

@RestController
@RequestMapping("admin/")
public class AdminRestController2 {

	@Autowired
	private GoodsDAO gdao;

	@Autowired
	private EventDAO edao;

	@Autowired
	private CategoryDAO cdao;

	@GetMapping(value = "adlist_vue.do", produces = "text/plain;charset=utf-8")
	public String adlist_vue(String page, String fs, String ss, String order, String status) {
		if (page == null) {
			page = "1";
		}
		int curpage = Integer.parseInt(page);

		Map map = new HashMap();

		int rowSize = 10;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (rowSize * curpage);
		String[] fsArr = fs.split(",");

		map.put("start", start);
		map.put("end", end);
		map.put("fsArr", fsArr);
		map.put("ss", ss);
		map.put("order", order);
		map.put("status", status);

		List<Map<String, Object>> list = gdao.adminGoodsFind(map);
		int totalpage = gdao.adminGoodsTotalPage(map);
		int count = gdao.adminGoodsCount();

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage) {
			endPage = totalpage;
		}

		int i = 0;
		JSONArray arr = new JSONArray();
		for (Map<String, Object> j : list) {
			JSONObject obj = new JSONObject();
			obj.put("g_id", j.get("G_ID"));
			obj.put("c_title", j.get("C_TITLE"));
			String g_name = (String) j.get("G_NAME");
			if (g_name.length() > 18) {
				g_name = g_name.substring(0, 18) + "...";
			}
			obj.put("g_name", g_name);
			obj.put("g_brand", j.get("G_BRAND"));
			obj.put("g_price", j.get("G_PRICE"));
			obj.put("g_sale", j.get("G_SALE"));
			String images = (String) j.get("G_IMAGE");
			if (images == null) {
				images = "";
			}
			String[] image = images.split(";");
			obj.put("g_image", image[0]);
			obj.put("g_detail", j.get("G_DETAIL"));
			obj.put("g_sold", j.get("G_SOLD"));
			obj.put("g_status", j.get("G_STATUS"));
			obj.put("g_regdate", j.get("G_REGDATE"));

			if (i == 0) {
				obj.put("curpage", curpage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
				obj.put("totalpage", totalpage);
				obj.put("count", count);
			}
			arr.add(obj);
			i++;
		}
		return arr.toJSONString();
	}

	@PostMapping("goods_update_ok.do")
	public String goods_update_ok(GoodsVO vo, @RequestParam(required=false) List<Integer> eid, HttpServletRequest request) {
		
	    gdao.goodsUpdate(vo, eid);
	    return "<Script>location.href = \"../admin/adlist.do\"</script>";
	}

	@GetMapping(value = "event_list.do", produces = "text/plain;charset=utf-8")
	public String admin_event_list() {
		List<EventVO> list = new ArrayList<EventVO>();
		list = edao.eventList();

		JSONArray arr = new JSONArray();
		for (EventVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("eid", vo.getE_id());
			obj.put("etitle", vo.getE_title());

			arr.add(obj);
		}
		return arr.toJSONString();
	}

	@PostMapping("goods_add_ok.do")
	public String goods_add_ok(@ModelAttribute GoodsVO vo, @RequestParam String eid, HttpServletRequest request) {
		try {
		    // 서버에 저장될 경로
		    String path = request.getSession().getServletContext().getRealPath("/") + "images\\goods\\";
            path = path.replace("\\", File.separator);
            // 데이터베이스에 저장될 경로
            String imgPath = "..\\images\\goods\\";
            imgPath = imgPath.replace("\\", File.separator);
            
            // 새로운 이미지 파일 이름을 등록 날짜&시간으로 설정
            SimpleDateFormat fmt = new SimpleDateFormat("YYYYMMDDHHMMSS");
            Calendar cal = Calendar.getInstance();
            
            int i = 0;
            String tempImg = "";
            List<MultipartFile> list = vo.getG_images();
		    for (MultipartFile mf : list) {
		        String gimageName = mf.getOriginalFilename();
	            	            
	            // 저장 경로 만들기
	            String newImageName = "image" + fmt.format(cal.getTime()) + i + gimageName.substring(gimageName.lastIndexOf("."));
	            
	            // 경로에 새 파일만들기
	            File gimage = new File(path + newImageName);
	            
	            tempImg += imgPath + newImageName + ";";
	            
	            // 파일 옮기기
	            try {
	                mf.transferTo(gimage);
	            } catch (Exception ex) {
	            }
	            i++;
		    }
		    
		    i = 0;
		    String tempDetail = "";
		    List<MultipartFile> list2 = vo.getG_details();
		    for (MultipartFile mf : list2) {
                String gdetailName = mf.getOriginalFilename();
                
                // 저장 경로 만들기
                String newDetailName = "detail" + fmt.format(cal.getTime()) + i + gdetailName.substring(gdetailName.lastIndexOf("."));
                
                // 경로에 새 파일만들기
                File gdetail = new File(path + newDetailName);
                
                // 데이터베이스에 저장될 경로
                tempDetail += imgPath + newDetailName + ";";
                
                // 파일 옮기기
                try {
                    mf.transferTo(gdetail);
                } catch (Exception ex) {
                }
                i++;
            }
		    
		    if (vo.getG_image().equals("")) { // 만약 직접 작성된 대표 이미지 경로가 없다면
                vo.setG_image(tempImg); // 첨부된 대표 이미지를 넣기
            } else {
                vo.setG_image(vo.getG_image() + ";" + tempImg); // 작성된 대표 이미지 경로가 있다면 구분자로 추가                
            }
            
            if (vo.getG_detail().equals("")) { // 만약 직접 작성된 상세 이미지 경로가 없다면
                vo.setG_detail(tempDetail); // 첨부된 상세 이미지를 넣기
            } else {
                vo.setG_detail(vo.getG_detail() + ";" + tempDetail); // 작성된 상세 이미지 경로가 있다면 구분자로 추가 
            }
            
		} catch (Exception ex) {
		
		}
		
		String img = vo.getG_image();
		if (img.charAt(img.length() - 1) == ';') {
		    vo.setG_image(img.substring(0, img.length()-1));
		}
		String detail = vo.getG_detail();
        if (detail.charAt(detail.length() - 1) == ';') {
            vo.setG_detail(detail.substring(0, detail.length()-1));
        }
        
		gdao.goodsInsert(vo, eid);
		return "ok";
	}
	
	@GetMapping(value = "goodsdetaildata.do", produces = "text/plain;charset=utf-8")
	public String adminGoodsDetail(int g_id) {
		GoodsVO vo = gdao.adminGoodsDetail(g_id);
		List<EventGoodsVO> list = gdao.goodsEidData(g_id);
		
		JSONObject obj = new JSONObject();
		obj.put("g_id", vo.getG_id());
		obj.put("c_id", vo.getC_id());
		String c_id1 = vo.getC_id().substring(0, 3);
		obj.put("cid1", c_id1);
		obj.put("g_name", vo.getG_name());
		obj.put("g_brand", vo.getG_brand());
		obj.put("g_price", vo.getG_price());
		obj.put("g_sale", vo.getG_sale());
		String images = vo.getG_image();
		String[] image = images.split(";");
		obj.put("g_image", image[0]);
		obj.put("g_detail", vo.getG_detail());
		obj.put("g_status", vo.getG_status());
		JSONArray arr = new JSONArray();
		for (EventGoodsVO i : list) {
			arr.add(i.getE_id());
		}
		obj.put("eid", arr);
		return obj.toJSONString();
	}
	
	/*  -- 카테고리 추가  --  */
	@PostMapping("category_add_ok.do")
	public String category_add_vue_ok(String c_id1, String c1_title, String c_id2, String c2_title) {
		CategoryVO vo = new CategoryVO();
		vo.setC_id(c_id1);
		vo.setC_title(c1_title);
		cdao.category_insert(vo);

		CategoryVO vo2 = new CategoryVO();
		vo2.setC_id(c_id2);
		vo2.setC_title(c2_title);
		cdao.category_insert(vo2);

		System.out.println("cid : " + vo.getC_id());
		System.out.println("title : " + vo.getC_title());
		System.out.println("cid2 : " + c_id2);
		System.out.println("title2 : " + c2_title);

		return "ok";
	}

	/*  -- 이벤트 추가  --  */
	@PostMapping("event_add_ok.do")
	public String event_add_vue_ok(String e_title) {
		EventVO vo = new EventVO();

		vo.setE_title(e_title);

		System.out.println("etitle : " + e_title);

		edao.insertEvent(vo);
		return "ok";
	}

	/*  -- 카테고리 삭제 --  */
	@PostMapping("category_delete_ok.do")
	public String category_delete_vue_ok(CategoryVO vo) {

		System.out.println("cid : " + vo.getC_id());

		System.out.println("title : " + vo.getC_title());

		cdao.category_delete(vo);

		return "ok";
	}

	/*  -- 이벤트 삭제 --  */
	@PostMapping("event_delete_ok.do")
	public String event_delete_vue_ok(EventVO vo) {

		System.out.println("etitle : " + vo.getE_title());
		edao.deleteEvent(vo);

		return "ok";
	}

}