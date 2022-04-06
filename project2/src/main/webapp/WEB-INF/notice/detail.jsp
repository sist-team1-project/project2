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
	<div class="container bg0" id="notice_list">
		<h3 class="text-center" style="padding-bottom: 20px">공지사항</h3>
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50">

				<table class="table-checkout">
					<tr style="height: 50px">
						<th width=20% class="text-center warning">번호</th>
						<td width=30% class="text-center">{{vo.nid}}</td>
						<th width=20% class="text-center warning">작성일</th>
						<td width=30% class="text-center">{{vo.nregdate}}</td>
					</tr>
					<tr style="height: 50px">
						<th width=20% class="text-center warning">이름</th>
						<td width=30% class="text-center">{{vo.uid}}</td>
						<th width=20% class="text-center warning">조회수</th>
						<td width=30% class="text-center">{{vo.nvisits}}</td>
					</tr>
					<tr style="height: 50px">
						<th width=20% class="text-center warning">제목</th>
						<td colspan="3">{{vo.ntitle}}</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="300">
							<pre
								style="white-space: pre-wrap; background-color: white; border: none">{{vo.ncontent}}</pre>
						</td>
					</tr>
				</table>
				<div class="text-right" style="padding-top: 10px;">
					<button class="btn btn-sm" style="background-color: #eeeee6"
						v-on:click="update()">수정</button>
					<button class="btn btn-sm" style="background-color: #eeeee6"
						v-on:click="del()">삭제</button>
					<button class="btn btn-sm" style="background-color: #dbd0be"
						v-on:click="list()">목록</button>
				</div>
			</div>
		</div>
	</div>
	<script>
   new Vue({
	   	el:'#notice_list',
	   	data:{
	   		vo:{},
	   		no:${no}
	   	},
	   	mounted:function(){
	   		axios.get('http://localhost:8080/web/notice/detail_vue.do',{
	   			params:{
	   				no:this.no
	   			}
	   		}).then(res=>{
	   			console.log(res.data)
	   			this.vo=res.data;
	   		})
	   	},
	   	
		methods:{
	   		list:function(){
	   			location.href="list.do"
	   		},
	   		update:function(){
	   			location.href="update.do?no="+this.no
	   		},
	   		del:function(){
	   			location.href="delete.do?no="+this.no;
	   		}
	   	}
	   }) 
  </script>
</body>
</html>





