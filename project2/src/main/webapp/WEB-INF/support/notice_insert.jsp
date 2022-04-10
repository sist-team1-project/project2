<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container" id="notice_insert">
		<h3 class="text-center" style="padding-bottom: 20px">글쓰기</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width=20% class="text-right warning">제목</th>
					<td width=80%><input type=text id="ntitle" size=50
						v-model="ntitle"></td>
				</tr>
				<tr>
					<th width=20% class="text-right warning">내용</th>
					<td width=80%><textarea rows="10" cols="55" id="ncontent"
						v-model="ncontent"></textarea></td>
				</tr>
			</table>
		</div>
		<div colspan="2" class="text-right">
			<button class="btn btn-sm" v-on:click="write()"
				style="background-color: #eeeee6">글쓰기</button>
			<button class="btn btn-sm" v-on:click="cancel()"
				style="background-color: #dbd0be">취소</button>
		</div>
	</div>
	
	<script>
    new Vue({
    	el:'#notice_insert',
    	data:{
    		ntitle:'',
    		ncontent:''
    	},
    	methods:{
    		write:function(){
    			if(this.ntitle=='')
    			{
    				let n=document.getElementById("ntitle");
    				n.focus();
    				return;
    			}
    			if(this.ncontent=='')
    			{
    				let n=document.getElementById("ncontent");
    				n.focus();
    				return;
    			}
    			
    			
    			axios.get('http://localhost:8080/web/support/notice_insert_ok.do',{
    				params:{
    					ntitle:this.ntitle,
    					ncontent:this.ncontent
    				}
    			}).then(res=>{
    				location.href="../support/notice.do"
    				
    			})
    		},
    		cancel:function(){
    			history.back();
    		}
    	}
    })
   </script>

</body>
</html>










