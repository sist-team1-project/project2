<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/find.css">
</head>
<body>
  <div class="container bg0 p-t-150 p-b-30" id="login">
      <div class="col-lg-4 col-sm-6 m-lr-auto m-b-50">
        <div class="bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
          <h4 class="flex-c-m mtext-109 cl2 p-b-30">회원 로그인</h4>
            <div class="row p-b-15">
		      <div class="col-sm-8">
                <div class="p-b-20 flex-c">
                  <input @keyup.enter="login()" style="height:33px" class="bor10" type="text" id="id" name="id" placeholder="아이디" v-model="id">
                </div>
			    <div class="flex-c">
                  <input @keyup.enter="login()" style="height:33px" class="bor10" type="password" size=20 id="pwd" name="pwd" placeholder="비밀번호" v-model="pwd">
                </div>
              </div>
              <div class="col-sm-4 flex-c">
                <button class="flex-c-m stext-101 cl1 bg3 hov-btn3 p-lr-15 trans-04 pointer" style="width:100px; height:auto" id="logBtn" v-on:click="login()"> 로그인 </button>
			  </div>
			</div>
			<div class="row flex-c-m p-t-15">
			  <div class="flex-c-m">
				<a href="#" style="color:#666666" data-toggle="modal" data-target="#iframeModal"> 아이디 찾기 </a>&nbsp;|&nbsp;
				<a id="pwfind" style="color:#666666"> 비밀번호 찾기 </a>&nbsp;|&nbsp;
				<a href="../user/join.do" style="color:#666666"> 회원가입 </a>
			  </div>
			</div>
         </div>  
       </div>
  </div>
  <div class="modal fade" id="iframeModal" tabindex="-1" role="dialog" aria-labelledby="iframeModalLable" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-body">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <div>
            <iframe width="100%" height="200" src="../user/idfind.do"></iframe>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
new Vue({
 	el:'#login',
 	data:{
 		id:'',
 		pwd:'',
 		iframe:'',
 	},
 	mounted:function(){
    },
 	methods:{
 		login:function(){
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
 			}// 서버실행 전 확인

 			axios.post("http://localhost:8080/web/user/login_ok.do",null,{
 	            params:{
 	                id: this.id, // data에 있는 것
 	                pwd: this.pwd
 	            }
 	        }).then(res=>{
 	        	console.log(res.data);
 	        	if(res.data=='NOID')
 				{
 					alert("아이디가 존재하지 않습니다.")
 					$('#id').val("");
 					$('#pwd').val("");
 					$('#id').focus();
 				}
 				else if(res.data=='NOPWD')
 				{
 					alert("비밀번호가 틀립니다.")
 					$('#pwd').val("");
 					$('#pwd').focus();
 				}
 				else
 			    {
 					location.href="../main/main.do";
 			    }
 	        })
 		}
 	}
})
/* $(function(){
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
				location.href="../main/main.do";
		    }
		}
	})
})
})*/
  </script>
</body>
</html>