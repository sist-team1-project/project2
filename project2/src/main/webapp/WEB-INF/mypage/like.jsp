<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/like.css">
</head>
<body>
  <div id="likePage">
    <div class="wrap-table js-pscroll">
      <table class="table-like">
        <tr class="table_head">
          <th class="column-1">제품</th>
          <th class="column-2">즐겨찾기</th>
        </tr>
        <tr class="table_row" v-for="l in likeList">
          <td class="column-1">{{l.gname}}</td>
          <td class="column-2"><a id="del-btn" class="bg3 bor1 hov-btn3 p-tb-5 p-lr-15 trans-04 fs-13 pointer" @click="unlike(l.lid)">삭제</button></td>
        </tr>
  
      </table>
    </div>
    <div class="p-t-30 p-b-20">
      <ul class="pagination">
        <li class="page-item" :class="{'disabled':start==1}"><button class="page-link" :value="start-1" @click="paging($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
        <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}"><button class="page-link" :value="i" @click="paging($event)">{{i}}</button></li>
        <li class="page-item" :class="{'disabled':end==totalpage}"><button class="page-link" :value="end+1" @click="paging($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
      </ul>
    </div>
  </div>
  <script>
    new Vue({
        el:'#likePage',
        data:{
            likeList: [],
            curpage: 1,
            totalpage:0,
            start:1,
            end:1,
            pages:[]
        },
        mounted:function(){
            this.list();
        },
        methods:{
            list:function(){
                axios.get("http://localhost:8080/web/mypage/likeList_vue.do",{
                    params: {
                        page: this.curpage
                    }
                }).then(result=>{
                    this.likeList=result.data;
                    this.curpage = result.data[0].curpage;
                    this.totalpage = result.data[0].totalpage;
                    this.start = result.data[0].startPage;
                    this.end = result.data[0].endPage;
                    this.pages = [];
                    for(i = this.start; i <= this.end; i++) {
                        this.pages.push(i);
                    }
                })
            },
            /* 페이지 전환 */
            paging:function(event) {
                this.curpage = event.currentTarget.value;
                this.list();
            },
            unlike:function(lid) { // 싫어요
                axios.post("http://localhost:8080/web/goods/like_delete_ok.do",null,{
                    params:{lid: lid}
                })
                this.list();
            }
        }
    })
  </script>
</body>
</html>