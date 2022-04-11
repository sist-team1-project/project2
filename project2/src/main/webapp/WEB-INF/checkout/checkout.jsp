<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/cart.css">
</head>
<body>
  <form method="post" action="../cart/checkout_ok.do" id="frm">
    <div class="container bg0 p-t-150 p-b-30">
      <div class="row">
        <div class="col-lg-12 m-lr-auto m-b-50">
          <div class="wrap-table js-pscroll">
            <table class="table-cart">
              <tr class="table_head">
                <th class="column-1"><input type="checkbox" value="" v-model="checkAll" @click="checkAllBtn"></th>
                <th class="column-2"></th>
                <th class="column-3">제품</th>
                <th class="column-4">수량</th>
                <th class="column-5">가격</th>
                <th class="column-6">할인율</th>
                <th class="column-7">할인가격</th>
                <th class="column-8">총가격</th>
                <th class="column-9">삭제</th>
              </tr>
              <tr class="table_row" v-for="cart in cartList" >
                <td class="column-1"><input type="checkbox" name="gid" v-model="selectedGoods" :value="cart" @change="clickCheck"></td>
                <td class="column-2"><div class="how-itemcart1"><img :src="cart.gimage"></div></td>
                <td class="column-3" >{{cart.gname }}</td>
                <td class="column-4">{{cart.gquantity }}</td>
                <td class="column-5">{{cart.gprice | currency }}원 </td>
                <td class="column-6">{{cart.gsale }}</td>
                <td class="column-7">{{cart.gprice - (cart.gprice * cart.gsale / 100) | currency }}원 </td>
                <td class="column-8">{{(cart.gprice - (cart.gprice * cart.gsale / 100)) * cart.gquantity | currency }}원</td>
                <td class="column-9">
                <button type=button @click="cartDelete($event)" :value="cart.cid">삭제</button></td>
              </tr>
            </table>
          </div>
        </div>
        
        <div class="col-sm-12 col-md-6 m-lr-auto m-b-50">
          <div class="bor10 p-lr-40 p-t-30 p-b-20 p-lr-15-sm">
            <h4 class="mtext-109 cl2 p-b-30">배송 정보</h4>
            <div class="flex-w flex-t">
              <div class="w-full">
                <div class="stext-111 p-tb-10">수령인</div>
                <input class="stext-111 bor8 bg0 cl8 plh3 size-111-2 p-lr-15 m-b-12" type="text" name="name" placeholder="이름">
                
                <div class="stext-111 p-tb-10">연락처</div>
                <div class="m-b-12">
                  <input class="stext-111 bor8 bg0 cl8 plh3 size-111-4 p-lr-15 dis-inline-block" type="tel" name="phone1"> -
                  <input class="stext-111 bor8 bg0 cl8 plh3 size-111-4 p-lr-15 dis-inline-block" type="tel" name="phone2"> -
                  <input class="stext-111 bor8 bg0 cl8 plh3 size-111-4 p-lr-15 dis-inline-block" type="tel" name="phone3">
                </div>
                
                <div class="stext-111 p-tb-10">주소</div>
                <div class="bor8-2 m-b-12 size-111-2 of-hidden pos-relative">
                  <input class="stext-111 cl8 bg0 plh3 size-111-2 p-lr-15" type="text" name="state" placeholder="우편번호" readonly>
                  <button class="stext-111 cl1 bg3 size-111-3 ab-t-r hov-btn3 flex-c-m">우편번호 찾기</button>
                </div>
                <div class="bor8 bg0 m-b-12">
                  <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address1" placeholder="주소" readonly>
                </div>
                <div class="bor8 bg0 m-b-12">
                  <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address2" placeholder="상세 주소">
                </div>
                
                <div class="stext-111 p-tb-10">요청사항</div>
                <div class="bor8 bg0 m-b-12">
                  <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="address2" placeholder="요청사항">
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <div class="col-sm-12 col-md-6 m-lr-auto m-b-50">
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
  <script>
    new Vue({
        el:'#cart',
        data:{
            cart:0,
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
                    this.selectedGoods = result.data;
                })
            },
            totalPrice:function(list){
              let totalsum = 0;
              list.forEach(i=>{totalsum += (i.gprice - (i.gprice * i.gsale / 100)) * i.gquantity})
              return totalsum;
            },
            checkAllBtn:function() {
                if(this.checkAll == false) {
                    this.selectedGoods = this.cartList;
                    this.checkAll = true;
                } else {
                    this.selectedGoods = [];
                    this.checkAll = false;
                }
            },
            cartDelete:function(event) {
                axios.post("http://localhost:8080/web/cart/delete_ok.do",null,{
                    params:{cid: event.currentTarget.value}
                }).then(result=>{
                    this.cList();                    
                })
            },
            clickCheck:function() {
                if(this.selectedGoods.length == this.cartList.length) {
                    this.checkAll = true;
                } else {
                    this.checkAll = false;
                }
            }
        }
    })
    $('.js-pscroll').each(function(){
        $(this).css('position','relative');
        $(this).css('overflow','hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });
  
        $(window).on('resize', function(){
            ps.update();
        })
    });
  </script>
</body>
</html>