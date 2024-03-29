<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/iconic/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="../fonts/linearicons-v1.0.0/icon-font.min.css">
  <link rel="stylesheet" type="text/css" href="../css/util.css">
  <link rel="stylesheet" type="text/css" href="../css/main.css">
  <link rel="stylesheet" type="text/css" href="../css/orderdetail.css">
  <script src="../vendor/jquery/jquery-3.2.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <div class="container bg0" id="adorderdetail">
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-order fs-13">
            <tr>
              <th class="adtable" colspan="6">주문상세정보</th>
            </tr>
            <tr class="ft"> 
              <th class="adt-light">주문번호</th>
              <td colspan="2">{{order.oid}}</td>
              <th class="adt-light">주문일시</th>
              <td colspan="2">{{order.regdate}}</td>
            </tr>
            <tr>
              <th class="adt-light">주문자</th>
                <td colspan="2">{{order.uid}}</td>
              <th class="adt-light">연락처</th>
                <td colspan="2">{{order.phone}}</td>
            </tr>
            <tr>
              <th class="adt-light">주문상태</th>
                <td v-if="order.state==-1" class="tleft" colspan="3">주문취소</td>
                <td v-if="order.state==0" class="tleft" colspan="3">대기중</td>
                <td v-if="order.state==1" class="tleft" colspan="3">상품준비중</td>
                <td v-if="order.state==2" class="tleft" colspan="3">배송중</td>
                <td v-if="order.state==3" class="tleft" colspan="3">배송완료</td>
            </tr>
            <tr>
              <th class="adtable" colspan="6">배송정보</th>
            </tr>
            <tr>
              <th class="adt-light">수령자</th>
              <td>{{order.receiver}}</td>              
              <th class="adt-light">연락처</th>
              <td colspan="3">{{order.phone}}</td>
            </tr>
            <tr>
              <th class="adt-light">요청사항</th>
              <td colspan="5" class="tleft">{{order.request}}</td> 
            </tr>
            <tr>
              <th class="adt-light">배송지</th>
              <td colspan="5" class="tleft">({{order.post}}) {{order.addr1}}{{order.addr2}}</td>
            </tr>
          </table>
            <!----------------------------------------------------->
          <table class="table-order fs-13">
            <tr>
           	  <th class="adt-light">상품번호</th>
              <th class="adt-light" colspan="3">상품명</th>
              <th class="adt-light"> 상품금액<br>(수량)</th>
            </tr>
            <template v-for="od in orderDetailList">
            <tr class="lineframe">
              <td>{{od.gid}}</td>
              <td colspan="3" class="tleft">{{od.name}}</td>
              <td colspan="2" class="tright framsize">{{od.price | currency }}원 <br>({{od.quantity}}개)</td>
            </tr>
			</template>
          </table>
			<!---------------------------------------------------->
          <table class="table-order fs-13">
            <tr>
              <th class="adtable" colspan="6">주문/결제금액</th>
            </tr>
            <tr>
              <th class="adt-light">상품금액</th>
              <th class="adt-light">배송비</th>
              <th class="adt-light">할인금액</th>
              <th class="adt-light">총 주문금액</th>
            </tr> 
            <tr>
              <td>{{sumPrice() | currency}}원</td>
              <td>5,000원</td>
              <td>- {{salePrice() | currency }}원</td>
              <th class="tcenter">{{totalPrice() + 5000 | currency}}원 </th>
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
            orderDetailList:[],	
            order: {} 			
        },
        filters:{
  			currency: function(value){
  				var num = new Number(value);
  				return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
  			}
  		},
        mounted:function(){
            this.odList();
            this.orList();
            
        },
        methods:{
            odList:function(){
                axios.get("http://13.125.104.199/project2/admin/orderdetail_vue.do",{
                    params:{
                        oid: this.oid
                    }
                }).then(res=>{

  				this.orderDetailList = res.data;
                })
            },
            orList:function(){
                axios.get("http://13.125.104.199/project2/admin/order.do",{
                    params:{
                        oid: this.oid
                    }
                }).then(res=>{

  				this.order = res.data;
                })
            },
            // 합계금액
            sumPrice:function() {
                let sum = 0;
                this.orderDetailList.forEach(i=>{sum += i.price * i.quantity})
                return sum;
            },
            // 할인금액
            salePrice:function() {
                let salesum = 0;
                this.orderDetailList.forEach(i=>{salesum += i.price * (i.sale/100) })
                //od.price * (od.sale/100)
                return salesum;
            },
            // 총 주문금액
            totalPrice:function() {
                let totalsum = 0;
                this.orderDetailList.forEach(i=>{totalsum += (i.price*i.quantity) - (i.price * (i.sale/100)) })
                return totalsum;
            }
        }
    })
  </script>
</body>
</html>