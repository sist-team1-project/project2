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
    <div class="col-md-7"><h4>&nbsp;&nbsp;<i class="fa fa-user-times" aria-hidden="true"></i>&nbsp;회원탈퇴 </h4></div>
  </div>
  <form @submit.prevent="submitForm">
    <div class="border col-md-6 p-lr-50 p-t-40 p-b-25">
      <div class="row flex-c">
        <div class="p-b-25">
          <div class="fs-16 flex-c p-b-15"><b>비밀번호 확인</b></div>
          <div class="bor10 fs-15 m-b-10">
            <input type="text" name="password" id="password" placeholder="비밀번호를 입력하세요" ref="password" v-model="form.password">
          </div>
          <div class="flex-c p-t-20">
            <input type="submit" id="submit-btn" class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 fs-13" style="background-color:#dbd0be" value="제출">
          </div>
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
 			
 			axios.get("http://localhost:8080/web/mypage/delete_ok.do", {
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