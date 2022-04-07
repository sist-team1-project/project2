<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container bg0" id="notice_delete">
		<h3 class="text-center" style="padding-bottom: 20px">삭제하기</h3>
		<div class="row">
				    	비밀번호 : <input type=password id="pwd" size=15 v-model="pwd">
		</div>
		<div class="text-right" style="padding-top: 10px;">
			<button class="btn btn-sm" style="background-color: #eeeee6"
				v-on:click="del()">삭제</button>
			<button class="btn btn-sm" style="background-color: #dbd0be"
				v-on:click="cancel()">취소</button>
		</div>
	</div>
	<script>
    new Vue({
    	el:'#notice_delete',
    	data:{
    		pwd:'',
    		no:${no},
    		msg:''
    	},
    	methods:{
    		cancel:function(){
    			history.back();
    		},
    		del:function(){
    			let _this=this;
    			if(this.pwd=="")
    			{
    				let p=document.getEelementById("pwd");
    				p.focus();
    				return;
    			}
    			axios.get('http://localhost:8080/web/notice/delete_ok.do',{
    				params:{
    					no:this.no,
    					pwd:this.pwd
    				}
    			}).then(function(res){
    				console.log(res.data);
    				_this.msg=res.data
    				if(_this.msg=="YES")
    				{
    					location.href="notice.do";
    				}
    				else
    				{
    					alert("비밀번호가 틀립니다!!")
    					let i=document.getElementById("pwd");
    					_this.pwd="";
    					i.focus();
    				}
    			})
    		}
    	}
    })
   </script>
</body>
</html>





