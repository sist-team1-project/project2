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
		<h3 class="text-left" style="padding-bottom: 20px">공지사항</h3>
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50">

				<table class="table-checkout">
					<tr class="table_head">
					<tr>
						<th width=20% class="text-center warning">번호</th>
						<td width=30% class="text-center">{{vo.nid}}</td>
						<th width=20% class="text-center warning">작성일</th>
						<td width=30% class="text-center">{{vo.nregdate}}</td>
					</tr>
					<tr>
						<th width=20% class="text-center warning">이름</th>
						<td width=30% class="text-center">{{vo.uid}}</td>
						<th width=20% class="text-center warning">조회수</th>
						<td width=30% class="text-center">{{vo.nvisits}}</td>
					</tr>
					<tr>
						<th width=20% class="text-center warning">제목</th>
						<td colspan="3">{{vo.ntitle}}</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="200">
							<pre
								style="white-space: pre-wrap; background-color: white; border: none">{{vo.ncontent}}</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right">
							<button class="btn btn-sm btn-danger" v-on:click="update()">수정</button>
							<button class="btn btn-sm btn-success" v-on:click="del()">삭제</button>
							<button class="btn btn-sm btn-primary" v-on:click="list()">목록</button>
						</td>
					</tr>
				</table>
			</div>
			<div class="row">
				<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
			</div>
		</div>
	</div>
	<script>
   new Vue({
	   	el:'#notice_list',
	   	data:{
	   		vo:{},
	   		nid:${nid}
	   	},
	   	mounted:function(){
	   		axios.get('http://localhost:8080/web/notice/detail_vue.do',{
	   			params:{
	   				nid:this.nid
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
	   			location.href="update.do?nid="+this.nid
	   		},
	   		del:function(){
	   			location.href="delete.do?nid="+this.nid;
	   		}
	   	}
	   }) 
  </script>
</body>
</html>





