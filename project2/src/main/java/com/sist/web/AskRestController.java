package com.sist.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

@RestController
public class AskRestController {
    @Autowired
	private AskDAO dao;
    
    @PostMapping("ask/update_ok.do")
    public String askUpdateOk(AskVO vo)
    {
    	String result="";
    	boolean bCheck=dao.askUpdate(vo);
    	if(bCheck==true)
    	{
    		result="<script>location.href=\"../ask/detail.do?no="+vo.getA_id()+"\";</script>";
    	}
    	else
    	{
    		result="<script>"
    			  +"alert(\"Password Fail!!\");"
    		      +"history.back();"
    			  +"</script>";
    	}
    	return result;
    }
    @PostMapping("ask/delete_ok.do")
    public String askDeleteOk(int no,String pwd)
    {
    	String result="";
    	AskVO vo=dao.askDetailData(no);
    	boolean bCheck=false;
    	if(vo.getA_group_step()==0)
    	{
    		bCheck=dao.askDelete1(no, vo.getA_group_id(), pwd);
    	}
    	else
    	{
    		bCheck=dao.askDelete2(no, pwd);
    	}
    	
    	if(bCheck==true)
    	{
    		result="<script>location.href=\"../ask/list.do\";</script>";
    	}
    	else
    	{
    		result="<script>"
    			  +"alert(\"Password Fail!!\");"
    		      +"history.back();"
    			  +"</script>";
    	}
    	return result;
    }
}
