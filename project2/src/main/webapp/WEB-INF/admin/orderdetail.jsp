<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/order.css">
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
</style>
</head>
<body>
  <div class="container bg0" id="adorderdetail">
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-order fs-11">
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
                <td>{{order.uid}}</td>
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
          <table class="table-order fs-11">
            <tr>
           	  <th class="adt-light">상품번호</th>
              <th class="adt-light" colspan="3">상품명</th>
              <th class="adt-light"> 상품금액(수량)</th>
            </tr>
            <template v-for="od in orderDetailList">
            <tr>
              <td>{{od.gid}}</td>
              <td colspan="3" class="tleft">{{od.name}}</td>
              <td colspan="2" class="tright">{{od.price | currency }}원<br>
              ( {{od.quantity}} 개)</td>
            </tr>
			</template>
          </table>
			<!---------------------------------------------------->
          <table class="table-order fs-11">
            <tr>
              <th class="adtable" colspan="6">주문/결제금액</th>
            </tr>
            <tr>
              <th class="adt-light">상품금액</th>
              <th class="adt-light">배송비</th>
              <th class="adt-light">할인금액</th>
              <th class="adt-light">총<br>주문금액</th>
            </tr> 
            <tr>
              <td class="tright" >{{sumPrice(orderDetailList) | currency}}원</td>
              <td class="tright">5,000원</td>
              <td class="tright">- 원</td>
              <th class="tright">
                 원
              </th>
            </tr>
			<!-- <template v-for="od in orderDetailList">
            <tr>
              <td class="tright" >{{od.price | currency}}원</td>
              <td class="tright">{{order.shipping | currency}}원</td>
              <td class="tright">- {{od.price * (od.sale/100) | currency}}원</td>
              <th class="tright">
              	{{od.price + order.shipping - (od.price * (od.sale/100)) | currency}} 원
              </th>
			</tr>
			</template> -->
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
            this.orList();
            
        },
        methods:{
            odList:function(){
                axios.get("http://localhost:8080/web/admin/orderdetail_vue.do",{
                    params:{
                        oid: this.oid
                    }
                }).then(res=>{

  				this.orderDetailList = res.data;
                })
            },
            orList:function(){
                axios.get("http://localhost:8080/web/admin/order.do",{
                    params:{
                        oid: this.oid
                    }
                }).then(res=>{

  				this.order = res.data;
                })
            },
            sumPrice:function(list) {
                let sum = 0;
                list.forEach(i=>{sum+=i.price*i.quantity})
                return sum;
            }
        }
    })
  </script>
</body>
</html>