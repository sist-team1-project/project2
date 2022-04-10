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
         <td width=80%><input type=text id="uid" size=15 
         v-model="uid" :value="uid"></td>
        </tr>
        <tr>
         <th width=20% class="text-right warning">제목</th>
         <td width=80%><input type=text id="ntitle" size=50 
         v-model="ntitle" :value="ntitle"></td>
        </tr>
        <tr>
         <th width=20% class="text-right warning">내용</th>
         <td width=80%>
          <textarea rows="10" cols="55" id="ncontent" v-model="ncontent">{{vo.ncontent}}</textarea>
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
    		uid:'',
    		ntitle:'',
    		ncontent:'',
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
    			this.uid=this.vo.uid;
    			this.ntitle=this.vo.ntitle;
    			this.ncontent=this.vo.ncontent;
    		})
    	},
    	methods:{
    		write:function(){
    			if(this.uid=='')
    			{
    				let n=document.getElementById("uid");
    				n.focus();
    				return;
    			}
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
    			
    			// 전송 서버 
    			axios.get('http://localhost:8080/web/support/notice_update_ok_vue.do',{
    				params:{
    					no:this.no,
    					uid:this.uid,
    					ntitle:this.ntitle,
    					ncontent:this.ncontent
    				}
    			}).then(res=>{
    				{
    			 		location.href="notice_detail.do?no="+this.no
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
