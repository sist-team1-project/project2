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
	<div class="container bg0 p-t-150 p-b-30" id="notice_detail">
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50">
				<div class="wrap-table js-pscroll">
				  <div class="text left">{{vo.n_title}}</div>
				  <div class="text left">{{vo.u_id}}</div>
   			      <div class="text left">{{vo.n_regdate}}</div>
					<table class="table-checkout">
						<tr class="table_head">
						<tr>
							<th width=20% class="text-center warning">{{vo.n_title}}</th>
						</tr>
						<tr>
							<th width=20% class="text-center warning">{{vo.n_content}}</th>
						</tr>
						<tr>
							<td colspan="4" class="text-right">
								<button class="btn btn-sm btn-danger">수정</button>
								<button class="btn btn-sm btn-success">삭제</button>
								<button class="btn btn-sm btn-primary" v-on:click="list()">목록</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
   new Vue({
	   	el:'#notice_detail',
	   	data:{
	   		vo:{},
	   		no:${no}
	   	},
	   	mounted:function(){
	   		axios.get('http://localhost:8080/web/support/notice_detail_vue.do',{
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
	   			location.href="notice.do"
	   		}
	   	}
	   })
   </script>
</body>
</html>





