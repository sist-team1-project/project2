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
	<div class="container bg0" id="notice_update">
		<h3 class="text-center" style="padding-bottom: 20px">수정하기</h3>
		<div class="row">
       <table class="table">
        <tr>
         <th width=20% class="text-right warning">작성자</th>
         <td width=80%><input type=text id="u_id" size=15 
         v-model="u_id" :value="u_id"></td>
        </tr>
        <tr>
         <th width=20% class="text-right warning">제목</th>
         <td width=80%><input type=text id="n_title" size=50 
         v-model="n_title" :value="n_title"></td>
        </tr>
        <tr>
         <th width=20% class="text-right warning">내용</th>
         <td width=80%>
          <textarea rows="10" cols="55" id="n_content" 
          v-model="n_content" :value="n_content"></textarea>
         </td>
        </tr>
       </table>
     </div>
       <div class="text-right" style="padding-top: 10px;">
			<button class="btn btn-sm" style="background-color: #eeeee6"
				v-on:click="write()">수정</button>
			<button class="btn btn-sm" style="background-color: #dbd0be"
				v-on:click="cancel()">취소</button>
		</div>
   </div>
   <script>
    new Vue({
    	el:'#notice_update',
    	data:{
    		u_id:'',
    		n_title:'',
    		n_content:'',
    		no:${no},
    		vo:{}
    	},
    	mounted:function(){
    		axios.get('http://localhost:8080/web/support/notice_update_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(res=>{
    			console.log(res.data);
    			this.vo=res.data;
    			this.u_id=this.vo.u_id;
    			this.n_title=this.vo.n_title;
    			this.n_content=this.vo.n_content;
    		})
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
    			
    			axios.get('http://localhost:8080/web/support/notice_update_ok_vue.do',{
    				params:{
    					no:this.no,
    					u_id:this.u_id,
    					n_title:this.n_title,
    					n_content:this.n_content
    				}
    			}).then(res=>{
    				if(res.data=="YES")
    				{
    			 		location.href="../support/notice_detail.do?no="+this.no
    				}
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

