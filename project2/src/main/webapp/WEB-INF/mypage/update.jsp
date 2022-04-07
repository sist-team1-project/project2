<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="userUpdate" class="container bg0 p-t-50 p-b-30">
    <div class="row col-md-12">
      <div class="col-md-6 p-b-20"><h3>회원정보 수정</h3></div>
    </div>
    <div class="border col-md-6 p-t-15 p-b-15">
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">아이디</div>
          <div><input type="text" name="id" id="id" class="bor10 col-md-12" :value="info.uid" readonly></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">이메일</div>
          <div><input type="text" name="email" id="email" class="bor10 col-md-12" :value="info.email"></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">전화번호</div>
          <div><input type="text" name="phone" id="phone" class="bor10 col-md-12" :value="info.phone"></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">우편번호</div>
          <div><input type="text" name="post" id="post" class="bor10 col-md-12" :value="info.post" readonly></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">주소</div>
          <div><input type="text" name="address1" id="address1" class="bor10 col-md-12" :value="info.address1" readonly></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">상세주소</div>
          <div><input type="text" name="address2" id="address2" class="bor10 col-md-12" :value="info.address2"></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">비밀번호 찾기 질문</div>
          <div><input type="text" name="question" id="question" class="bor10 col-md-12"></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">비밀번호 찾기 답변</div>
          <div><input type="text" name="answer" id="answer" class="bor10 col-md-12"></div>
        </div>
      </div>
      <div class="row p-b-10">
        <div class="col-md-12">
          <div class="p-b-5">비밀번호 확인</div>
          <div class="p-b-5"><input type="password" name="password1" id="password1" class="bor10 col-md-12"></div>
          <div><input type="password" name="password2" id="password2" class="bor10 col-md-12"></div>
        </div>
      </div>
      
      <div>
          <input type="button" id="join-btn" class="btn btn-primary" v-on:click="update()" value="수정">
          <a href="../mypage/update.do" id="cancle-btn" class="btn btn-primary">취소</a>
        </div>
    
    </div>
  </div>
  <script>
  new Vue({
	 	el:'#userUpdate',
	 	data:{
	 		info:{}, // vo
	 		uid:'',				// 이미 로그인된 사람의 값이 입력되어 있어야함/////////////
            password1:'',
            email:'',
            phone:'',
            post:'',
            address1:'',
            address2:'',
            question:'기억에 남는 추억의 장소는?',
            answer:''
	 	},
	 	mounted:function(){
	 		axios.get("http://localhost:8080/web/mypage/info_vue.do",{
                params:{
                    
                }
            }).then(res=>{
                this.info=res.data;
            })
	    },
        methods:{
            update:function(){
                let password1=$('#password1').val();
                if(password1.trim()=="")
                {
                    $('#password1').focus();
                    return;
                }
                let password2=$('#password2').val();
                if(password2.trim()=="")
                {
                    $('#password2').focus();
                    return;
                }
                let email=$('#email').val();
                if(email.trim()=="")
                {
                    $('#email').focus();
                    return;
                }
                let phone=$('#phone').val();
                if(phone.trim()=="")
                {
                    $('#phone').focus();
                    return;
                }
                let post=$('#post').val();
                if(post.trim()=="")
                {
                    return;
                }
                let address1=$('#address1').val();
                if(address1.trim()=="")
                {
                    $('#address1').focus();
                    return;
                }
                let question=$('#question').val();
                if(question.trim()=="")
                {
                    $('#question').focus();
                    return;
                }
                let answer=$('#answer').val();
                if(answer.trim()=="")
                {
                    $('#answer').focus();
                    return;
                }
                axios.post("http://localhost:8080/web/mypage/update_ok.do",null,{
                    params:{
                        u_phone: this.phone,
                        u_email: this.email,
                        u_post: this.post,
                        u_address1: this.address1,
                        u_address2: this.address2,
                        u_question: this.question,
                        u_answer: this.answer
                    }
                }).then(res=>{
                    alert("회원정보 변경이 완료되었습니다.")
                })
            }
        }
	})
  </script>
</body>
</html>