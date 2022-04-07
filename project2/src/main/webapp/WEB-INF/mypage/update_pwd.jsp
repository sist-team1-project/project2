<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="update_pwd" class="container bg0 p-t-50 p-b-30">
  <div class="row p-b-20">
    <div class="col-md-7"><h4>&nbsp;&nbsp;<i class="fa fa-user-circle" aria-hidden="true"></i> 마이페이지 / 비밀번호 변경</h4></div>
  </div>
  <div class="border col-md-7">
      <div class="row">
        <div class="col-md-7">
          <div>기존 비밀번호</div>
          <div><input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" v-model="password"></div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-7">
          <div>새 비밀번호</div>
          <div><input type="password" name="new_password" id="new_password" placeholder="새 비밀번호를 입력하세요" v-model="new_password"></div>
          <div><input type="password" id="new_password2" placeholder="새 비밀번호를 재입력하세요" v-model="new_password2"></div>
          <div><input type="button" id="submit-btn" class="btn btn-primary" value="제출" v-on:click="submit()"></div>
        </div>
      </div>
    </div>
  </div>
  <script>
new Vue({
 	el:'#update_pwd',
 	data:{
 		password:'',
 		new_password:'',
 		new_password2:''
 	},
 	mounted:function(){
 		
    },
 	methods:{
 		submit:function(){
 			let password=$('#password').val();
 			if(password.trim()=="")
 			{
 				$('#password').focus();
 				return;
 			}
 			let new_password=$('#new_password').val();
 			if(new_password.trim()=="")
 			{
 				$('#new_password').focus();
 				return;
 			}
 			let new_password2=$('#new_password2').val();
 			if(new_password2.trim()=="")
 			{
 				$('#new_password2').focus();
 				return;
 			}
 			// 서버실행 전 확인
 			axios.post("http://localhost:8080/web/user/update_pwd_ok.do",null,{
 	            params:{
 	            	
 	            }
 	        }).then(res=>{
 	        	
 	        })
 		}
 	}
})
  </script>
</body>
</html>