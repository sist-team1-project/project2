<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container bg0 p-t-70 p-b-10" id="orderinfo">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-10">
          <h3>주문 정보</h3>
        </div>
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-checkout text-center">
            <tr class="table_head text-center">
              <th>주문자</th>
              <th>주문일시</th>
              <th>주문번호</th>
              <th>주문상태</th>
            </tr>
            <tr v-for="my in orderInfoList" class="table_row_order fs-13 text-center">
              <td> {{my.uid}} </td>
              <td> {{my.regdate}}  </td>
              <td><a class="cl8" href="#"> {{my.oid}} </a></td>
              <td> {{my.state}} </td>
             </tr>
          </table>
        </div>
      </div>
    </div>
    
    <!------------- 페이징 ------------->
    <div class="text-center">
      <ul class="pagination">
        <li class="page-item" :class="{'disabled':startPage==1}">
          <button class="page-link" :value="startPage-1" @click="getpage($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
        </li>
        <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}">
          <button class="page-link" :value="i" @click="getpage($event)">{{i}}</button>
        </li>
        <li class="page-item" :class="{'disabled':endPage==totalpage}">
          <button class="page-link" :value="endPage+1" @click="getpage($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
        </li>
      </ul>
    </div>
      
  <script>
    new Vue({
        el:'#orderinfo',
        data:{
            orderInfoList: [],        
            curpage : 1,
            totalpage : 0,
            startPage : 0,
            endPage : 0,
            pages : []
           // count : 0
        },
        mounted:function(){
            this.infoList();
        },
        methods:{
            infoList:function(){
                axios.get("http://localhost:8080/web/mypage/orderInfoList_vue.do",{
                    params:{
                    	page: this.curpage
                    }
                }).then(res=>{
                	console.log(result.data);
                    this.orderInfoList = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.startPage = res.data[0].startPage;
                    this.endPage = res.data[0].endPage;
                  //  this.count = res.data[0].count;
                  //  console.log(this.count);
                    this.pages=[];
                    for(i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
                })
            },
            getpage : function(event){
                this.curpage = event.currentTarget.value;
                this.infoList();
            }
        }
    })
  </script>
</body>
</html>