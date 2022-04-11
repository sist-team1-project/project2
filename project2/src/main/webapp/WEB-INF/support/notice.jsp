<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class="container bg0" id="notice">
		<h3 class="text-left" style="padding-bottom: 20px">공지사항</h3>
		<div class="row">
			<div class="col-lg-12 m-lr-auto m-b-50">

				<table class="table">
					<tr class="table_head">
						<th width=10% class="text-center">번호</th>
						<th width=50% class="text-center">제목</th>
						<th width=10% class="text-center">작성자</th>
						<th width=20% class="text-center">작성일</th>
						<th width=10% class="text-center">조회수</th>
					</tr>

					<tr class="table_row"  v-for="vo in notice_list">
						<th width=10% class="text-center">{{vo.n_id}}</th>
						<td width=50%><a :href="'notice_detail.do?no=' + vo.n_id">{{vo.n_title}}</a></td>
						<td width=10% class="text-center">{{vo.u_id}}</td>
						<td width=20% class="text-center">{{vo.n_regdate}}</td>
						<td width=10% class="text-center">{{vo.n_visits}}</td>
					</tr>
				</table>
				<c:if test="${sessionScope.grade=='0'}">
				<div class="text-right" style="padding-top: 10px;">
					<button class="btn btn-sm" style="background-color: #dbd0be" v-on:click="insert()">글쓰기</button>
				</div>
				</c:if>
				<div class="text-center p-t-20 p-b-20">
       			 <ul class="pagination">
       			   <li class="page-item" :class="{'disabled':start==1}"><button class="page-link" :value="start-1" @click="paging($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
       			   <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}"><button class="page-link" :value="i" @click="paging($event)">{{i}}</button></li>
       			   <li class="page-item" :class="{'disabled':end==totalpage}"><button class="page-link" :value="end+1" @click="paging($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
      			  </ul>
				</div>
			</div>
		</div>
	</div>
	<script>
    new Vue({
    	el:'#notice',
    	data:{
    		notice_list:[],
    		totalpage:0,
            empty: false,
            curpage:1,
            start:1,
            end:1,
            pages:[]
    	},

    	mounted:function(){
    		this.dataSend();
    	},
    	
    	methods:{
    		dataSend:function(){
    			axios.get("http://localhost:8080/web/support/notice_vue.do",{
        			params:{
        				page:this.curpage
        			}
    			}).then(result=>{
        			console.log(result.data);
        			this.notice_list=result.data;
        			this.curpage = result.data[0].curpage;
                    this.totalpage = result.data[0].totalpage;
                    this.start = result.data[0].start;
                    this.end = result.data[0].end;
                    
                    if(result.data[0].name == null) {
                        this.empty = true;
                    } else {
                        this.empty = false;
                    }
                    this.pages = [];
                    for(i = this.start; i <= this.end; i++) {
                        this.pages.push(i);
                    }
        		})
    		},
    		paging:function(event) {
                this.curpage = event.currentTarget.value;
                this.dataSend();
            },
    		insert:function(){
    			location.href="../support/notice_insert.do";
    		}
    	}
    })
  </script>
</body>
</html> 