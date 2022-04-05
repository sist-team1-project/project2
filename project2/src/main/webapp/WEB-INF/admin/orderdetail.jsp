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
  <div class="container bg0 p-t-70 p-b-10" id="adorderdetail">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-20">
          <h3>주문 상세정보</h3>
        </div>
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">

          <table class="table-checkout">
            <tr> 
              <th>주문번호</th>
              <td>{{order.oid}}</td>
              <th>주문일시</th>
              <td>{{order.regdate}}</td>
            </tr>
            <tr>
              <th>주문자</th>
                <td>{{order.uid}}</td>
              <th>연락처</th>
                <td>{{order.phone}}</td>
              <th>주문상태</th>
                <td v-if="order.state==-1">주문취소</td>
                <td v-if="order.state==0">수락</td>
                <td v-if="order.state==1">상품준비중</td>
                <td v-if="order.state==2">배송중</td>
                <td v-if="order.state==3">배송완료</td>
            </tr>
            <template v-for="od in orderDetailList">
            <tr>
           	  <th>상품번호</th>
              <th>상품정보</th>
              <th>상품금액(수량)</th>
            </tr>
            <tr>
              <td>{{od.gid}}</td>
              <td>{{od.name}}</td>
              <td>{{od.price}} 원 ({{od.quantity}} 개)</td>
            </tr>
            <tr>
              <th style="color: #dbd0be;">주문/결제금액</th>
            </tr>
            <tr>
              <th rowspan="3">총 주문금액</th>
              <th rowspan="3">{{od.price}} 원</th>
            </tr> 	     
            <tr>
              <th>상품금액</th>
              <td>{{od.price}} 원</td>
            <tr>
              <th>배송비</th>
              <td>+ 5,000 원</td>
            </tr>
            <tr>
              <th>할인금액</th>
              <td>- {{od.sale }}원</td>
			</tr>
            <tr>
              <th style="color: #dbd0be;">배송정보</th>
            </tr>
            </template>
            <tr>
              <th>수령자</th>
              <td>{{order.receiver}}</td>              
              <th>배송연락처</th>
              <td>{{order.phone}}</td>
            </tr>
            <tr>
              <th>요청사항</th>
              <td>{{order.request}}</td>            
              <th>배송지</th>
              <td>({{order.post}}) {{order.addr1}}{{order.addr2}}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script>
  new Vue({
      el:'#adorderdetail',
      data:{
          oid:'${oid }',
          orderDetailList:[],	// List
          order: {} 			// vo
      },
      mounted:function(){
          this.odList();
          this.oList();
          console.log(this.oid);
      },
      methods:{
          odList:function(){
              axios.get("http://localhost:8080/web/admin/orderdetail.do",{
                  params:{
                      oid: this.oid
                  }
              }).then(res=>{
				console.log(res.data);
				this.orderDetailList = res.data;
              })
          },
          oList:function(){
              axios.get("http://localhost:8080/web/admin/order.do",{
                  params:{
                      oid: this.oid
                  }
              }).then(res=>{
				console.log(res.data);
				this.order = res.data;
              })
          }
      }
  })
  </script>
</body>
</html>