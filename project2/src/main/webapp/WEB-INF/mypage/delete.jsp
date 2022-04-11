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
  <form @submit.prevent="submitForm">
    <div class="border col-md-7">
      <div class="row">
        <div class="col-md-7">
          <div>비밀번호:</div>
          <div><input type="text" name="password" id="password" placeholder="비밀번호를 입력하세요" ref="password" v-model="form.password"></div>
          <div><input type="button" id="submit-btn" class="btn btn-primary" value="제출"></div>
        </div>
      </div>
    </div>
  </form>
  </div>
</body>
</html>
  <script>
new Vue({
 	el:'#delete',
 	data:{
 		form: {
 			password:''
 		}
 	},
 	mounted:function(){
    },
 	methods:{
 		submitForm:function(){
 			if(this.form.password == '') {
 				this.$refs.password.focus();
                return;
            }
 			// 서버실행 전 확인
 			
 			axios.post("http://localhost:8080/web/mypage/delete_ok.do", this.form, {
 	        }).then(res => {
 	        	
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