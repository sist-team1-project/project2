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
          <tr v-for="order in orderdetail" class="">
            <tr> 
              <th>주문번호</th>
              <td>{{odd.odid}}</td>
              <th>주문일시</th>
              <td>{{od.o_regdate}}</td>
            </tr>
            <tr>
              <th>주문자</th>
              <td>{{od.u_id}</td>
              <th>연락처</th>
              <td>{{od.o_phone}}</td>
              <th>주문상태</th>
              <td>{{od.o_state}}</td>
            </tr>
            <tr>
           	  <th>상품번호</th>
              <th>상품정보</th>
              <th>상품금액(수량)</th>
            </tr>
            <tr>
              <td>{{odd.g_id}}</td>
              <td>{{odd.g_name}}</td>
              <td>{{odd.g_price}} 원 ({{odd.quantity}} 개)</td>
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
              <td>{{odd.g_price}} 원</td>
            <tr>
              <th>배송비</th>
              <td>+ 5,000 원</td>
            </tr>
            <tr>
              <th>할인금액</th>
              <td>- {{odd.g_sale }}원</td>
			</tr>
            <tr>
              <th style="color: #dbd0be;">배송정보</th>
            </tr>
            <tr>
              <th>수령자</th>
              <td>김유저</td>              
              <th>배송연락처</th>
              <td>010-1111-1234</td>
            </tr>
            <tr>
              <th>요청사항</th>
              <td>{{od.request}}</td>            
              <th>배송지</th>
              <td>({{od.post}}) {{od.address1}}{{od.address2}}</td>
            </tr>
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
          // this.dataList();
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
              })
          }
      }
  })
  </script>
</body>
</html>