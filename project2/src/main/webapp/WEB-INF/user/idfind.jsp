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
  <div class="container bg0" id="idfind">
    <div class="flex-c-m">
        <h4 class="mtext-109 cl2 p-b-20">아이디 찾기</h4>
    </div>
    <div class="flex-c-m p-tb-10">
      이름&nbsp;&nbsp;<input class="dis-inline-block bor10" type="text" id="name" name="name" placeholder="이름 입력" v-model="name">
    </div>
    <div class="flex-c-m p-tb-10">
       이메일&nbsp;&nbsp;<input class="dis-inline-block bor10" type="text" id="email" name="email" placeholder="이메일 입력" v-model="email">
    </div>
    
    <div class="row flex-c-m p-t-15">
      <div class="flex-c-m">
        <a href="#" v-on:click="idfind()" style="color:#666666"> 아이디 찾기 </a>&nbsp;|&nbsp;
        <a id=""> 취소 </a>
      </div>
    </div>
  </div>
  <script>
new Vue({
 	el:'#idfind',
 	data:{
 		name:'',
 		email:''
 	},
 	mounted:function(){
 		
    },
 	methods:{
 		idfind:function(){
 			let name=$('#name').val();
 			if(name.trim()=="")
 			{
 				$('#name').focus();
 				return;
 			}
 			let email=$('#email').val();
 			if(email.trim()=="")
 			{
 				$('#email').focus();
 				return;
 			}// 서버실행 전 확인
 			axios.get("http://localhost:8080/web/user/idfind_ok.do",{
 	            params:{
 	            	name: this.name,
 	                email: this.email
 	            }
 	        }).then(res=>{
 	        	console.log(res.data);
 	        	if(res.data=='NORESULT'){
 	        	    alert("아이디가 존재하지 않습니다");
 				}
 				else {
 				    $('#idfind').html('<div class="text-center p-t-50">'+ '고객님의 아이디는 ' + res.data + '입니다.' + '</div>')
 			    }
 	        })
 		}
 	}
})
  </script>
</body>
</body>
</html>