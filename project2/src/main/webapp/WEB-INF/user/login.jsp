<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$.ajax({
			type:'POST',
			url:'login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(res){
				if(res=='NOID')
				{
					alert("아이디가 존재하지 않습니다.")
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				}
				else if(res=='NOPWD')
				{
					alert("비밀번호가 틀립니다.")
					$('#pwd').val("");
					$('#pwd').focus();
				}
				else
			    {
					location.href="main.do";
			    }
			}
		})
	})
})

</script>
</head>
<body>
  <div class="container bg0 p-t-150 p-b-30">
    
      <div class="col-sm-12 col-lg-4 m-lr-auto m-b-50">
        <div class="bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
          <h4 class="flex-c-m mtext-109 cl2 p-b-30">회원 로그인</h4>
            <div class="row">
		      <div class="col-sm-7">
                <div class="flex-w flex-t p-t-15 p-b-22 m-l-20">
                  <input type="text" id="id" name="id" placeholder="아이디">
                </div>
            
			    <div class="flex-w flex-t p-t-15 p-b-15 m-l-20">
                  <input type="password" id="pwd" name="pwd" placeholder="비밀번호">
                </div>
              </div>
              <div class="col-sm-5 flex-c-m">
                <button class="flex-c-m stext-101 cl1 bg3 hov-btn3 p-lr-15 trans-04 pointer"
                style="width:100px; height:100px" id="logBtn"> 로그인 </button>
			  </div>
			</div>
			
			
			<div class="row flex-c-m p-t-15">
			  <div class="flex-c-m">
				<a href="#"> 아이디 찾기 </a>&nbsp;|&nbsp;
				<a href="#"> 비밀번호 찾기 </a>&nbsp;|&nbsp;
				<a href="#"> 회원가입 </a>
			  </div>
			</div>
         </div>  
       </div>
  </div>
</body>
</html>