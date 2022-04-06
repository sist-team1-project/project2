<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container bg0 p-t-150 p-b-30" id="pwdfind">
    
      <div class="col-sm-12 col-lg-4 m-lr-auto m-b-50">
        <div class="bor10 p-lr-40 p-t-30 p-b-25 p-lr-15-sm">
          <h4 class="flex-c-m mtext-109 cl2 p-b-30">비밀번호 찾기</h4>
            <div class="row">
		      <div class="col-sm-7">
		      	<div class="col-sm-5 flex-c-m">
               	 아이디
			  	</div>
                <div class="col-sm-7 bor10">
                  <input type="text" id="id" name="id" placeholder="아이디 입력" v-model="id">
                </div>
              </div>
              <div class="col-sm-7">
            	<div class="col-sm-5 flex-c-m">
               	 이메일
			  	</div>
			    <div class="col-sm-7 bor10">
                  <input type="text" id="email" name="email" placeholder="이메일 입력" v-model="email">
                </div>
              </div>
              
			</div>
			<div class="row flex-c-m p-t-15">
			  <div class="flex-c-m">
				<a id="pwdfind()"> 비밀번호 찾기 </a>&nbsp;|&nbsp;
				<a id=""> 취소 </a>
			  </div>
			</div>
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
 	mounted:function(){
 		
    },
 	methods:{
 		pwdfind:function(){
 			let id=$('#id').val();
 			if(id.trim()=="")
 			{
 				$('#id').focus();
 				return;
 			}
 			let email=$('#email').val();
 			if(email.trim()=="")
 			{
 				$('#email').focus();
 				return;
 			}// 서버실행 전 확인
 			
 			axios.post("http://localhost:8080/web/user/pwdfind_ok.do",null,{
 	            params:{
 	                id: this.id,
 	                email: this.email
 	            }
 	        }).then(res=>{
 	        	console.log(res.data);
 	        	if(res.data=='ADMIT')
 				{
 	        		
 	        		location.href = "../pwd/pwd.do"
 	        		
 	        		
 				}
 				else
 			    {
 					alert("올바른 정보를 입력하세요.")
 					$('#id').val("");
 					$('#email').val("");
 					$('#id').focus();
 			    }
 	        })
 		}
 	}
})
  </script>
</body>
</body>
</html>