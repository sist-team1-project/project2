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

				<table class="table">
					<tr class="table_head">
						<th width=10% class="text-center">번호</th>
						<th width=60% class="text-center">제목</th>
						<th width=10% class="text-center">작성자</th>
						<th width=20% class="text-center">작성일</th>
					</tr>

					<tr class="table_row"  v-for="vo in notice_list">
						<th width=10% class="text-center">{{vo.nid}}</th>
						<td width=60%><a :href="'detail.do?no=' + vo.nid">{{vo.ntitle}}</a></td>
						<td width=10% class="text-center">{{vo.uid}}</td>
						<td width=20% class="text-center">{{vo.nregdate}}</td>
					</tr>
				</table>
				<div class="text-right" style="padding-top: 10px;">
					<button class="btn btn-sm" style="background-color: #dbd0be" v-on:click="insert()">새글</button>
				</div>
				<div class="text-center">
					<button class="btn btn-sm" style="background-color: #eeeee6" v-on:click="prev()">이전</button>
					{{curpage}} page / {{totalpage}} pages
					<button class="btn btn-sm" style="background-color: #eeeee6" v-on:click="next()">다음</button>
				</div>
			</div>
		</div>
	</div>
	<script>
    new Vue({
    	el:'#notice_list',
    	data:{
    		notice_list:[],
    		curpage:1,
    		totalpage:0
    	},
    	// 시작 => window.onload , $(function(){})
    	mounted:function(){
    		this.dataSend();
    	},
    	methods:{
    		dataSend:function(){
    			axios.get("http://localhost:8080/web/notice/list_vue.do",{
        			params:{
        				page:this.curpage
        			}
    			}).then(res=>{
        			console.log(res.data);
        			this.notice_list=res.data;
        			this.curpage=res.data[0].curpage;
        			this.totalpage=res.data[0].totalpage;
        		})
    		},
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			this.dataSend();
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			this.dataSend();
    		},
    		insert:function(){
    			location.href="insert.do";
    		}
    	}
    })
  </script>
</body>
</html>