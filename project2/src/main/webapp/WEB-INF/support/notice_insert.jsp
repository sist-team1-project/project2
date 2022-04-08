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
	<div class="container" id="notice_insert">
		<h3 class="text-center" style="padding-bottom: 20px">글쓰기</h3>
		<div class="row">
			<table class="table">
				<tr>
					<th width=20% class="text-right">작성자</th>
					<td width=80%><input type=text name="u_id" size=15
					    v-model="u_id"></td>
				</tr>
				<tr>
					<th width=20% class="text-right warning">제목</th>
					<td width=80%><input type=text id="n_title" size=50
						v-model="n_title"></td>
				</tr>
				<tr>
					<th width=20% class="text-right warning">내용</th>
					<td width=80%><textarea rows="10" cols="55" id="n_content"
							v-model="n_content"></textarea></td>
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
    		u_id:'',
    		n_title:'',
    		n_content:''
    	},
    	methods:{
    		write:function(){
    			if(this.u_id=='')
    			{
    				let n=document.getElementById("u_id");
    				n.focus();
    				return;
    			}
    			if(this.n_title=='')
    			{
    				let n=document.getElementById("n_title");
    				n.focus();
    				return;
    			}
    			if(this.n_content=='')
    			{
    				let n=document.getElementById("n_content");
    				n.focus();
    				return;
    			}
    			
    			axios.get('http://localhost:8080/web/support/notice_insert_ok.do',{
    				params:{
    					u_id:this.u_id,
    					n_title:this.n_title,
    					n_content:this.n_content
    				}
    			}).then(res=>{
    				location.href="notice.do"
    				
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










