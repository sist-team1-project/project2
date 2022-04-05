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
              <th class="adtable" colspan="6">주문상세정보</th>
            </tr>
            <tr> 
              <th class="adt-light">주문번호</th>
              <td>{{order.oid}}</td>
              <th class="adt-light">주문일시</th>
              <td>{{order.regdate}}</td>
            </tr>
            <tr>
              <th class="adt-light">주문자</th>
                <td>{{order.uid}}</td>
              <th class="adt-light">연락처</th>
                <td>{{order.phone}}</td>
              <th class="adt-light">주문상태</th>
                <td v-if="order.state==-1">주문취소</td>
                <td v-if="order.state==0">수락</td>
                <td v-if="order.state==1">상품준비중</td>
                <td v-if="order.state==2">배송중</td>
                <td v-if="order.state==3">배송완료</td>
            </tr>
            <tr>
           	  <th class="adt-light" colspan="2">상품번호</th>
              <th class="adt-light" colspan="2">상품정보</th>
              <th class="adt-light" colspan="2">상품금액(수량)</th>
            </tr>
            <template v-for="od in orderDetailList">
            <tr>
              <td colspan="2">{{od.gid}}</td>
              <td colspan="2">{{od.name}}</td>
              <td colspan="2" class="cash">{{od.price | currency }} 원 ( {{od.quantity}} 개)</td>
            </tr>
            <tr>
              <th class="adtable" colspan="6">주문/결제금액</th>
            </tr>
            <tr>
              <th rowspan="3" class="adt-light">총 주문금액</th>
              <th rowspan="3" class="adt-light cash">{{od.price | currency}} 원</th>
            </tr> 	     
            <tr>
              <th class="adt-light">상품금액</th>
              <td class="cash">{{od.price | currency}} 원</td>
            <tr>
              <th class="adt-light">배송비</th>
              <td class="cash">{{order.shippting}} 원</td>
            </tr>
            <tr>
              <th class="adt-light">할인금액</th>
              <td>- {{od.sale | currency }}원</td>
			</tr>
            <tr>
              <th class="adtable" colspan="6">배송정보</th>
            </tr>
            </template>
            <tr>
              <th class="adt-light">수령자</th>
              <td>{{order.receiver}}</td>              
              <th class="adt-light">배송연락처</th>
              <td>{{order.phone}}</td>
              <th class="adt-light">요청사항</th>
              <td>{{order.request}}</td> 
            </tr>
            <tr>
              <th class="adt-light">배송지</th>
              <td colspan="4">({{order.post}}) {{order.addr1}}{{order.addr2}}</td>
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
      filters:{
			currency: function(value){
				var num = new Number(value);
				return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
			}
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