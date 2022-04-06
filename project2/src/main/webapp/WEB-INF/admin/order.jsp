<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/order.css">
<style type="text/css">
td {
	width: 150px;
	margin: 0px auto;
}
</style>
</head>
<body>
  <div class="container bg0 p-t-70 p-b-10" id="adorder">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-20">
          <h3>판매 목록</h3>
        </div>
      </div>
      <div class="col-lg-12 flex-m">
        <input type="text" size=20 class="bor4 p-tb-4 dis-inline-block">
          &nbsp;&nbsp;
        <input type="button" class="btn btn-sm btn-pro-color2 p-tb-4 dis-inline-block" value="검색" v-on:click="ofind()">
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
        <div class="fs-13">
        	총 {{count | currency}} 개
        </div>
        <input type="button" class="btn btn-sm btn-pro-color2 p-tb-4 dis-inline-block" v-on:click="orderdetail()" value="상세">
      </div>
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-checkout">
            <tr class="table_head font-center">
              <th>주문일시</th>
              <th>주문번호</th>
              <th>주문자</th>
              <th>상품명</th>
              <th>주문금액</th>
              <th>주문상태</th>
            </tr>
            <tr v-for="o in orderFullList" class="table_row fs-13 font-center">
              <td>{{o.regdate}}</td>
              <td>{{o.oid}}</td>
              <td>{{o.usid}}</td>
              <td>{{o.name}}</td>
              <td>{{o.price | currency }} 원</td>
              <td>{{o.state}}</td>
             </tr>
          </table>
        </div>
      </div>
    </div>
    
	<!------------- 페이징 ------------->
    <div class="text-center">
	  <ul class="pagination">
		<li class="page-item" v-bind:class="{'disabled':startPage==1}">
		  <button class="page-link" :value="startPage-1" v-on:click="prev($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
		</li>
		<li class="page-item" v-for="i in pages" v-bind:class="{'active':i==curpage}">
		  <button class="page-link" :value="i" v-on:click="getpage($event)">{{i}}</button>
		</li>
		<li class="page-item" v-bind:class="{'disabled':endPage==totalpage}">
		  <button class="page-link" :value="endPage+1" v-on:click="next($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
		</li>
	  </ul>
	</div>
     
  </div>
  <script>
  new Vue({
      el:'#adorder',
      data:{
          oid:'${oid }',
          orderFullList: [],
          //order: [], 			
          curpage : 1,
		  totalpage : 0,
		  startPage : 0,
		  endPage : 0,
		  pages : [],
		  count : 0
      },
      filters:{
			currency: function(value){
				var num = new Number(value);
				return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
			}
		},
      mounted:function(){
          this.oList();
          //console.log(this.oid);
      },
      methods:{
          oList:function(){
              axios.get("http://localhost:8080/web/admin/orderlist_vue.do",{
                  params:{
                	  page: this.curpage
                  }
              }).then(res=>{
				this.orderFullList = res.data;
				console.log(res.data);
				//console.log("DATE : " + res.data[0].regdate)
				this.curpage=res.data[0].curpage;
                this.totalpage=res.data[0].totalpage;
                this.startPage = res.data[0].startPage;
				this.endPage = res.data[0].endPage;
				this.count = res.data[0].count;
                this.pages=[];
                
                for(i = this.startPage; i <= this.endPage; i++) {
                    this.pages.push(i);
                }
              })
          },
          prev:function(event){
  			  this.curpage = event.currentTarget.getAttribute('value');
  			  this.oList();
	      },
  		  next:function(event){
  			  this.curpage = event.currentTarget.getAttribute('value');
  			  this.oList();
  		  },
  		  getpage : function(event){
  			  this.curpage = event.currentTarget.getAttribute('value');
  			  this.oList();
  		  }
      }
  })
  </script>
</body>
</html>