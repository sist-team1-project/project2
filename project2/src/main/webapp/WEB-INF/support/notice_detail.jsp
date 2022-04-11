<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
	<div class="container bg0" id="notice_detail">
		<h3 class="text-center" style="padding-bottom: 20px">공지사항</h3>
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50">

				<table class="table-checkout">
					<tr style="height: 50px">
						<th width=20% class="text-center warning">번호</th>
						<td width=30% class="text-center">{{vo.n_id}}</td>
						<th width=20% class="text-center warning">작성일</th>
						<td width=30% class="text-center">{{vo.n_regdate}}</td>
					</tr>
					<tr style="height: 50px">
						<th width=20% class="text-center warning">이름</th>
						<td width=30% class="text-center">{{vo.u_id}}</td>
						<th width=20% class="text-center warning">조회수</th>
						<td width=30% class="text-center">{{vo.n_visits}}</td>
					</tr>
					<tr style="height: 50px">
						<th width=20% class="text-center warning">제목</th>
						<td colspan="3">{{vo.n_title}}</td>
					</tr>
					<tr>
						<td colspan="4" class="text-left" valign="top" height="300">
							<pre
								style="white-space: pre-wrap; background-color: white; border: none">{{vo.n_content}}</pre>
						</td>
					</tr>
				</table>
				<div class="text-right p-t-10">
					<c:if test="${sessionScope.grade=='0' }">
					<button class="btn btn-sm" style="background-color: #eeeee6"
						v-on:click="update()">수정</button>
					<button class="btn btn-sm" style="background-color: #eeeee6"
						v-on:click="del()">삭제</button>
					</c:if>
					<button class="btn btn-sm" style="background-color: #dbd0be"
						v-on:click="list()">목록</button>
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
  	   		},
  	   		update:function(){
  	   			location.href="notice_update.do?no="+this.no
  	   		},
  	   		del:function(){
  	   			location.href="notice_delete.do?no="+this.no;
  	   		}
  	   	}
	}) 
  </script>
</body>
</html>




