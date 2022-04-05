<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	width: 150px;
	margin: 0px auto;
}
</style>
</head>
<body>
  <!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->
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
        <div class="fs-13">총<fmt:formatNumber value="${count }" pattern=",000" />개</div>
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
            <tr v-for="o in order" class="table_row fs-13 font-center">
              <td>{{o.regdate }}</td>
              <td>{{o.oid }}</td>
              <td>{{o.uid }}</td>
                <template v-for="od in orderListDetail">
                  <template v-if="o.oid == od.oid">
	                <td>{{od.name }}</td>
	                <td>{{od.price }}</td>
                  </template>
                </template>
              <td>{{o.state }}</td>
             </tr>
          </table>
        </div>
      </div>
    </div>
    
<!--      <div class="text-center">
	  <ul class="pagination">
		<li class="page-item" v-bind:class="{'disabled':startPage==1}">
		  <button class="page-link" :value="startPage-1" v-on:click="prev($event)">
		   <i class="fa fa-chevron-left" aria-hidden="true"></i>
		  </button>
		</li>
		<li class="page-item" v-for="i in pages" v-bind:class="{'active':i==curpage}">
		  <button class="page-link" :value="i" v-on:click="getpage($event)">{{i}}</button>
		</li>
		<li class="page-item" v-bind:class="{'disabled':endPage==totalpage}">
		  <button class="page-link" :value="endPage+1" v-on:click="next($event)">
		    <i class="fa fa-chevron-right" aria-hidden="true"></i>
		  </button>
		</li>
	  </ul>
	</div> -->
     
      <div>
      <ul class="pagination">
        <c:if test="${startPage > 1 }">
          <li class="page-item"><a class="page-link" href="adlist.do?page=${startPage-1 }">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <c:if test="${curpage==i }">
            <c:set var="style" value="active" />
          </c:if>
          <c:if test="${curpage != i }">
            <c:set var="style" value="" />
          </c:if>
          <li class="page-item ${style }"><a class="page-link" href="salelist.do?page=${i }">${i }</a></li>
        </c:forEach>
        <c:if test="${endPage < totalpage }">
          <li class="page-item"><a class="page-link" href="salelist.do?page=${endPage+1 }">&gt;</a></li>
        </c:if>
      </ul>
    </div> 
    
  </div>
  <script>
  new Vue({
      el:'#adorder',
      data:{
          oid:'${oid }',
          orderListDetail:[],
          order: [], 			
          curpage : 1,
		  totalpage : 0,
		  startPage : 0,
		  endPage : 0,
		  pages : [],
		  count : 0
      },
      mounted:function(){
          this.odList();
          this.oList();
          console.log(this.oid);
      },
      methods:{
          odList:function(){
              axios.get("http://localhost:8080/web/admin/orderlistdetail_vue.do",{
              }).then(res=>{
				console.log(res.data);
				this.orderListDetail = res.data;
              })
          },
          oList:function(){
              axios.get("http://localhost:8080/web/admin/orderlist_vue.do",{
                  params:{
                      page: this.curpage
                  }
              }).then(res=>{
				this.order = res.data;
				console.log(res.data);
				console.log("DATE : " + res.data[0].regdate)
				this.curpage=res.data[0].curpage;
                this.totalpage=res.data[0].totalpage;
                this.start=res.data[0].start;
                this.end=res.data[0].end;
              })
          }
      }
  })
  </script>
</body>
</html>