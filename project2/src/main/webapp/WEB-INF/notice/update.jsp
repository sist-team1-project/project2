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
         <th width=15% class="text-right warning">이름</th>
         <td width=85%><input type=text id="name" size=15 
         v-model="name" :value="name"></td>
         <%-- value="${name}" --%>
        </tr>
        <tr>
         <th width=15% class="text-right warning">제목</th>
         <td width=85%><input type=text id="subject" size=50 
         v-model="subject" :value="subject"></td>
        </tr>
        <tr>
         <th width=15% class="text-right warning">내용</th>
         <td width=85%>
          <textarea rows="10" cols="55" id="content" v-model="content">{{vo.ncontent}}</textarea>
         </td>
        </tr>
        <tr>
         <th width=15% class="text-right warning">비밀번호</th>
         <td width=85%><input type=password id="pwd" size=10 v-model="pwd"></td>
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
    		name:'',
    		subject:'',
    		content:'',
    		pwd:'',
    		no:${no},
    		vo:{}
    	},
    	mounted:function(){
    		axios.get('http://localhost:8080/web/notice/update_vue.do',{
    			params:{
    				no:this.no
    			}
    		}).then(res=>{
    			console.log(res.data);
    			this.vo=res.data;
    			this.name=this.vo.name;
    			this.subject=this.vo.subject;
    			this.content=this.vo.content;
    		})
    	},
    	methods:{
    		write:function(){
    			if(this.name=='')
    			{
    				let n=document.getElementById("name");
    				n.focus();
    				return;
    			}
    			if(this.subject=='')
    			{
    				let n=document.getElementById("subject");
    				n.focus();
    				return;
    			}
    			if(this.content=='')
    			{
    				let n=document.getElementById("content");
    				n.focus();
    				return;
    			}
    			if(this.pwd=='')
    			{
    				let n=document.getElementById("pwd");
    				n.focus();
    				return;
    			} 
    			
    			// 전송 서버 
    			axios.get('http://localhost:8080/web/notice/update_ok_vue.do',{
    				params:{
    					no:this.no,
    					name:this.name,
    					subject:this.subject,
    					content:this.content,
    					pwd:this.pwd
    				}
    			}).then(res=>{
    				if(res.data=="YES")
    				{
    					location.href="detail.do?no="+this.no
        				// return "redirect:board_detail.do?no="+no
    				}
    				else
    				{
    					alert("비밀번호가 틀립니다!!")
    					let n=document.getElementById("pwd");
    					this.pwd="";
    					n.focus();
        				
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
