<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/cart.css">
</head>
<body>
  <div class="container" id="cart">
    <form method="post" action="../checkout/checkout.do" id="frm">
      <div class="container bg0 p-t-150 p-b-30">
        <div class="row">
          <div class="col-lg-12 m-lr-auto m-b-50">
            <div class="wrap-table js-pscroll">
              <table class="table-cart">
                <tr class="table_head">
                  <th class="column-1"><input type="checkbox" value="" v-model="checkAll" @click="checkAllBtn"></th>
                  <th class="column-2"></th>
                  <th class="column-3">상품명</th>
                  <th class="column-4">수량</th>
                  <th class="column-5">상품단가</th>
                  <th class="column-6">할인율</th>
                  <th class="column-7">할인금액</th>
                  <th class="column-8">총 금액</th>
                  <th class="column-9">삭제</th>
                </tr>
                <tr class="table_row" v-for="(cart,index) in cartList" >
                  <td class="column-1"><input type="checkbox" name="gid" v-model="selectedGoods" :value="cart.gid" @change="clickCheck"></td>
                  <td class="column-2"><div class="item"><img :src="cart.gimage"></div></td>
                  <td class="column-3"><a class="link" :href="'../goods/detail.do?gid=' + cart.gid">{{cart.gname }}</a></td>
                  
                  <td class="column-4">
                    <div class="wrap-num-product flex-w m-lr-20 m-tb-10">
                      <div @click="numDown(index);" class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                      <input :value="cart.gquantity" class="mtext-104 cl3 text-center num-product" type="number" name="num-product">
                      <div @click="numUp(index);" class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                    </div>
                  </td>
                  
                  <td class="column-5">{{cart.gprice | currency }}원 </td>
                  <td class="column-6">{{cart.gsale }} %</td>
                  <td class="column-7">{{(cart.gprice * cart.gsale / 100) * cart.gquantity | currency }}원 </td>
    			  <td class="column-8">{{(cart.gprice - (cart.gprice * cart.gsale / 100)) * cart.gquantity | currency }}원</td>
    			  <td class="column-9">
    			  <button type=button @click="cartDelete($event)" :value="cart.cid">삭제</button></td>
                </tr>
              </table>
            </div>
          </div>
          <div class="col-sm-12 col-lg-6 m-lr-auto m-b-50">
            <div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-15-sm">
              <h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>
  
              <div class="flex-w flex-t bor12 p-b-13">
                <div class="size-208"><span class="cl2"> 상품합산금액: </span></div>
                <div class="size-209"><span class="cl2">{{totalPrice(selectedGoods) | currency}} 원 </span></div>
              </div>
  
              <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                <div class="size-208 w-full-ssm"><span class="cl2"> 배송비: </span></div>
                <div class="size-209">
                  <span class="cl2" v-if="selectedGoods.length == 0">0 원</span>
                  <span class="cl2" v-if="selectedGoods.length != 0">5,000 원</span>
                </div>
              </div>
  
              <div class="flex-w flex-t p-t-27 p-b-33">
                <div class="size-208"><span class="cl2"> 총 결제금액: </span></div>
                <div class="size-209 p-t-1">
                  <span class="cl2" v-if="selectedGoods.length == 0">0 원</span>
                  <span class="cl2" v-if="selectedGoods.length != 0">{{totalPrice(selectedGoods) + 5000 | currency}} 원</span>
                </div>
              </div>
  
              <button type=submit class="flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"> 결제하기</button>
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
            cartList: [],
            checkAll: true,
            selectedGoods: []
        },
        filters:{
            currency: function(value){
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted:function(){
            this.cList();
        },
        methods:{
            cList:function(){
                axios.get("http://localhost:8080/web/cart/cart_list_vue.do",{
                    params:{
                    }
                }).then(result=>{
                    this.cartList = result.data;
                    for(i = 0; i < this.cartList.length; i++) {
                        this.selectedGoods.push(this.cartList[i].gid);
                    }
                })
            },
            totalPrice:function(arr){
                let list = [];
                for (i = 0; i < arr.length; i++) {
                    for(j = 0; j < this.cartList.length; j++) {
                        if(this.cartList[j].gid == arr[i]) {                
                            list.push([this.cartList[j].gprice, this.cartList[j].gsale, this.cartList[j].gquantity]);
                        }
                    }
                }
                let totalsum = 0;
            	list.forEach(i=>{totalsum += (i[0] - (i[0] * i[1] / 100)) * i[2]})
            	return totalsum;
            },
            cartDelete:function(event) {
                axios.post("http://localhost:8080/web/cart/delete_ok.do",null,{
                    params:{cid: event.currentTarget.value}
                }).then(result=>{
                    this.cList();     
                })
            },
            numUp:function(index) {
                this_ = this.cartList[index];
                this_.gquantity = parseInt(this_.gquantity) + 1;
                axios.post("http://localhost:8080/web/cart/cart_num_update.do",null,{
                    params:{num: 1, gid:this_.gid}
                })
            },
            numDown:function(index) {
                this_ = this.cartList[index];
                if(this_.gquantity > 1){
                    this_.gquantity = parseInt(this_.gquantity) - 1;
                    axios.post("http://localhost:8080/web/cart/cart_num_update.do",null,{
                        params:{num: -1, gid:this_.gid}
                    })
                }
            },
            checkAllBtn:function() {
                if(this.checkAll == false) {
                    for(i = 0; i < this.cartList.length; i++) {
                        this.selectedGoods.push(this.cartList[i].gid);
                    }
                    this.checkAll = true;
                } else {
                    this.selectedGoods = [];
                    this.checkAll = false;
                }
            },
            clickCheck:function() {
                if(this.selectedGoods.length == this.cartList.length) {
                    this.checkAll = true;
                } else {
                    this.checkAll = false;
                }
            },
        }
    })
  </script>
</body>
</html>