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
  <div class="container bg0" id="idcheck">
    <div class="flex-c-m">
        <h4 class="mtext-109 cl2 p-b-20">아이디 중복 체크</h4>
    </div>
    <div class="flex-c-m p-tb-10">
      아이디&nbsp;&nbsp;<input class="dis-inline-block bor10" type="text" id="id" name="id" placeholder="아이디 입력" v-model="id">
    </div>
    
    
    <div class="row flex-c-m p-t-15">
      <div class="flex-c-m">
        <a href="#" v-on:click="idcheck()" style="color:#666666"> 아이디 확인 </a>&nbsp;|&nbsp;
        <a id=""> 취소 </a>
      </div>
    </div>
  </div>
  <script>
new Vue({
 	el:'#idcheck',
 	data:{
 		id:''
 	},
 	mounted:function(){
 		
    },
 	methods:{
 		idcheck:function(){
 			let id=$('#id').val();
 			if(id.trim()=="")
 			{
 				$('#id').focus();
 				return;
 			}
 			// 서버실행 전 확인
 			axios.get("http://localhost:8080/web/user/idcheck_ok.do",{
 	            params:{
 	                id: this.id
 	            }
 	        }).then(res=>{
 	        	if(res.data=='no'){
 	        	    alert("아이디 사용 불가");
 				}
 				else {
 				    $('#idcheck').html('<div>'+ res.data +'</div>')
 			    }
 	        })
 		}
 	}
})
  </script>
</body>
</body>
</html>