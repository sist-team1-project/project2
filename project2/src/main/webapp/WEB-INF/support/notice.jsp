<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/support.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
    <div class="container bg0 p-b-30" id="notice_list">
      <div class="row">
      <h3 style="padding-bottom: 20px;"><b>공지사항</b></h3>
            <table class="table-checkout">
              <tr class="table_head">
    		    <th width=70% class="text-center">제목</th>
    		    <th width=10% class="text-center">작성자</th>
    		    <th width=20% class="text-center">작성일</th>
              </tr>

              <tr class="table_row" v-for="vo in notice_list">
                <td width=70% class="text-left p-l-20"><a v-bind:href="'notice_detail.do?nid=' + vo.n_id">{{vo.ntitle}}</a></td>
                <td width=10% class="text-center"><a v-bind:href="'notice_detail.do?nid=' + vo.n_id">{{vo.uid}}</a></td>
                <td width=20% class="text-center"><a v-bind:href="'notice_detail.do?nid=' + vo.n_id">{{vo.nregdate}}</a></td>
              </tr>
           </table>
          
           <button class="btn btn-sm btn-success" v-on:click="insert()">글쓰기</button>
         
           <table class="table">
             <tr>
               <td class="text-center"> 
                 <button class="btn btn-sm btn-danger" v-on:click="prev()">이전</button>
                 {{curpage}} page / {{totalpage}} pages
                 <button class="btn btn-sm btn-primary" v-on:click="next()">다음</button>
               </td>
             </tr> 
          </table>
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
    	mounted:function(){
    		this.dataSend();
    	},
    	methods:{
    		dataSend:function(){
    			axios.get("http://localhost:8080/web/support/notice_vue.do",{
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