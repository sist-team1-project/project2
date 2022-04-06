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
         <th width=15% class="text-right warning">제목</th>
         <td width=85%><input type=text id="subject" size=50 v-model="subject"></td>
        </tr>
        <tr>
         <th width=15% class="text-right warning">내용</th>
         <td width=85%>
          <textarea rows="10" cols="55" id="content" v-model="content"></textarea>
         </td>
        </tr>
        <tr>
         <th width=15% class="text-right warning">비밀번호</th>
         <td width=85%><input type=password id="pwd" size=10 v-model="pwd"></td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
           <button class="btn btn-sm btn-info" v-on:click="write()">글쓰기</button>
           <button class="btn btn-sm btn-success" v-on:click="cancel()">취소</button>
          </td>
        </tr>
       </table>
     </div>
   </div>
   <script>
    new Vue({
    	el:'#notice_insert',
    	data:{
    		subject:'',
    		content:'',
    		pwd:''
    	},
    	methods:{
    		write:function(){
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
    			
    			axios.get('http://localhost:8080/web/notice/insert_ok.do',{
    				params:{
    					subject:this.subject,
    					content:this.content,
    					pwd:this.pwd
    				}
    			}).then(res=>{
    				location.href="list.do"
    				
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










