<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="delete" class="container bg0 p-t-50 p-b-30">
  <div class="row p-b-20">
    <div class="col-md-7"><h4>&nbsp;&nbsp;<i class="fa fa-user-circle" aria-hidden="true"></i> 회원탈퇴 </h4></div>
  </div>
  <div class="border col-md-7">
      <div class="row">
        <div class="col-md-7">
          <div>비밀번호:</div>
          <div><input type="text" name="password" id="password" placeholder="비밀번호를 입력하세요" v-model="password"></div>
          <div><input type="button" id="submit-btn" class="btn btn-primary" value="제출" v-on:click="submit()"></div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
  <script>
new Vue({
 	el:'#delete',
 	data:{
 		password:'',
 		id:'${id}',
 		vo:{}
 	},
 	mounted:function(){
 		
    },
 	methods:{
 		submit:function(){
 			//let _this=this;
 			let password=$('#password').val();
 			if(password.trim()=="")
 			{
 				$('#password').focus();
 				return;
 			}
 			// 서버실행 전 확인
 			axios.get("http://localhost:8080/web/mypage/delete_ok.do",{
 	            params:{
 	            	id:this.id,
 	            	password:this.password
 	            }
 	        }).then(res => {
 	        	//_this.data=res.data;
 	        	if(res.data=="YES") {
                    alert("회원탈퇴 완료");
                } else {
                	console.log(res)
                	alert("잘못된 비밀번호");
                }
 	        })
 		}
 	}
})
  </script>