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
              <td>{{order.o_regdate}}</td>
            </tr>
            <tr>
              <th>주문자</th>
              <td>{{order.u_id}}</td>
              <th>연락처</th>
              <td>{{order.o_phone}}</td>
              <th>주문상태</th>
              <td>{{order.o_state}}</td>
            </tr>
            <template v-for="od in orderDetailList">
            <tr>
           	  <th>상품번호</th>
              <th>상품정보</th>
              <th>상품금액(수량)</th>
            </tr>
            <tr>
              <td>{{od.g_id}}</td>
              <td>{{od.g_name}}</td>
              <td>{{od.g_price}} 원 ({{od.quantity}} 개)</td>
            </tr>
            <tr>
              <th style="color: #dbd0be;">주문/결제금액</th>
            </tr>
            <tr>
              <th rowspan="3">총 주문금액</th>
              <th rowspan="3">212,000 원</th>
            </tr> 	     
            <tr>
              <th>상품금액</th>
              <td>{{od.g_price}} 원</td>
            <tr>
              <th>배송비</th>
              <td>+ 5,000 원</td>
            </tr>
            <tr>
              <th>할인금액</th>
              <td>- {{od.g_sale }}원</td>
			</tr>
            <tr>
              <th style="color: #dbd0be;">배송정보</th>
            </tr>
            </template>
            <tr>
              <th>수령자</th>
              <td>김유저</td>              
              <th>배송연락처</th>
              <td>010-1111-1234</td>
            </tr>
            <tr>
              <th>요청사항</th>
              <td>{{order.request}}</td>            
              <th>배송지</th>
              <td>({{order.post}}) {{order.address1}}{{order.address2}}</td>
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
          this.dataList();
          console.log(this.oid);
      },
      methods:{
          dataList:function(){
              axios.get("http://localhost:8080/web/admin/orderdetail.do",{
                  params:{
                      oid: this.oid
                  }
              }).then(res=>{
				console.log(res.data);
				this.orderDetailList = res.data;
				this.order = res.data[0].od;
              })
          }
      }
  })
  </script>
</body>
</html>