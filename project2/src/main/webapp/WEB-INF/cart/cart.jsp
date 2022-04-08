<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div class="container" id="cart">
  <form method="post" action="../cart/checkout.do" id="frm">
    <div class="container bg0 p-t-150 p-b-30">
      <div class="row">
        <div class="col-lg-12 m-lr-auto m-b-50">
          <div class="wrap-table js-pscroll">
            <table class="table-checkout">
              <tr class="table_head">
                <th class="column-1"><input type="checkbox"></th>
                <th class="column-2"></th>
                <th class="column-3">제품</th>
                <th class="column-4">수량</th>
                <th class="column-5">가격</th>
                <th class="column-6">할인율</th>
                <th class="column-7">할인가격</th>
              </tr>

              <tr class v-for="cart in cartList" class="table_row">
                <td class="column-1"><input type="checkbox"></td>
                <td class="column-2"><div class="how-itemcart1"><img :src="cart.Gimage" ></div></td>
                <td class="column-3">{{cart.Gname }}</td>
                <td class="column-4">{{cart.Gquantity }}</td>
                <td class="column-5">{{cart.Gprice }}</td>
                <td class="column-6">{{cart.Gsale }}</td>
                <td class="column-7">{{cart.Gprice - (cart.Gprice * cart.Gsale / 100) }}</td>
              </tr>
              
            </table>
          </div>
        </div>
        <div class="col-sm-12 col-lg-6 m-lr-auto m-b-50">
          <div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-15-sm">
            <h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

            <div class="flex-w flex-t bor12 p-b-13">
              <div class="size-208"><span class="stext-110 cl2"> 금액: </span></div>
              <div class="size-209"><span class="mtext-110 cl2"> $79.65 </span></div>
            </div>

            <div class="flex-w flex-t bor12 p-t-15 p-b-30">
              <div class="size-208 w-full-ssm"><span class="stext-110 cl2"> 배송비: </span></div>
              <div class="size-209"><span class="mtext-110 cl2"> $10 </span></div>
            </div>

            <div class="flex-w flex-t p-t-27 p-b-33">
              <div class="size-208"><span class="mtext-101 cl2"> 총 금액: </span></div>
              <div class="size-209 p-t-1"><span class="mtext-110 cl2"> $89.65 </span></div>
            </div>

            <button class="flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"> 결제하기</button>
          </div>
        </div>
      </div>
    </div>
  </form>
 </div>
  <script>
  new Vue({
	  el:'#cart',
	  data:{
		  cart:0,
		  cartList: [],
		  total: 0
	  },
	  mounted:function(){
		  this.cList();
		  this.countCart();
	  },
	  methods:{
          countCart:function(){
              axios.get("http://localhost:8080/web/cart/Count_cart_vue.do",{
                  params:{
                  }
              }).then(result=>{
                  this.cart = result.data.Count;
              })
          },
          cList:function(){
              axios.get("http://localhost:8080/web/cart/Cart_list_vue.do",{
                  params:{
                  }
              }).then(result=>{
                  this.cartList = result.data;
                  colsole.log(result.data);
                  this.total = result.data[0].Sum;
              })
          }
      }
  })
  </script>
</body>
</html>