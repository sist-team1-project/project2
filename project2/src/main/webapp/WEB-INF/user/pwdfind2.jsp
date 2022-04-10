<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <div class="container" id="pwdfind2">
    <div class="flex-c-m">
        <h4 class="mtext-109 cl2 p-b-20">비밀번호 찾기</h4>
    </div>
    <div class="flex-c-m p-tb-10">
      ${question}
    </div>
    <div class="flex-c-m p-tb-10">
       <input class="dis-inline-block bor10 p-lr-6 p-tb-6" type="text" ref="answer" name="answer" placeholder="답 입력" v-model="answer">
    </div>
    
    <div class="row flex-c-m p-t-15">
      <div class="flex-c-m">
        <a href="#" @click="pwdfind2" style="color:#666666"> 제출 </a>
      </div>
    </div>
  </div>
  <script>
    new Vue({
     	el:'#pwdfind2',
     	data:{
     		answer:''
     	},
     	methods:{
     		pwdfind2:function(){
     			if(this.answer == '') {
     				this.$refs.answer.focus();
     				return;
     			}
     			axios.get("http://localhost:8080/web/user/pwdfind2_ok.do",{
                    params:{
                        id: '${id}',
                        email: '${email}',
                        question: '${question}',
                        answer: this.answer
                    }
                }).then(res=>{
                    if(res.data == "NORESULT") {
                        alert("일치하지 않습니다");
                    } else {
                        location.href = "../user/pwdfind3.do";
                    }
                })
     		}
     	}
    })
  </script>
</body>
</body>
</html>