<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/linearicons-v1.0.0/icon-font.min.css">
  <link rel="stylesheet" type="text/css" href="../css/util.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container" id="pwdfind">
    <div class="flex-c-m">
        <h4 class="mtext-109 cl2 p-b-10">비밀번호 찾기</h4>
    </div>
    <div class="flex-c-m p-tb-10">
      아이디&nbsp;&nbsp;<input class="dis-inline-block bor10 p-lr-6 p-tb-6" type="text" ref="id" name="id" placeholder="아이디 입력" v-model="id">
    </div>
    <div class="flex-c-m p-tb-10">
       이메일&nbsp;&nbsp;<input class="dis-inline-block bor10 p-lr-6 p-tb-6" type="text" ref="email" name="email" placeholder="이메일 입력" v-model="email">
    </div>
    
    <div class="row flex-c-m p-t-10">
      <div class="flex-c-m">
        <a href="#" @click="pwdfind" style="color:#666666"> 비밀번호 찾기 </a>
      </div>
    </div>
  </div>
  <script>
    new Vue({
        el:'#pwdfind',
        data:{
            id:'',
            email:''
        },
        methods:{
            pwdfind:function(){
                if(this.id == '') {
                    this.$refs.id.focus();
                    return;
                }
                if(this.email == '') {
                    this.$refs.email.focus();
                    return;
                }
                axios.get("http://13.125.104.199/project2/user/pwdfind_ok.do",{
                    params:{
                        id: this.id,
                        email: this.email
                    }
                }).then(res=>{
                    if(res.data == 'NORESULT'){
                        alert("해당 정보로 일치하는 아이디가 존재하지 않습니다");
                    }
                    else {
                        location.href = "../user/pwdfind2.do?id=" + this.id + "&email=" + this.email + "&question=" + res.data;
                    }
                })
            }
        }
    })
  </script>
</body>
</body>
</html>