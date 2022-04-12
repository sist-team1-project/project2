<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/checkout.css">
  <script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
  <div class="container" id="checkout">
    <form method="post" action="../checkout/checkout_ok_vue.do" @submit="checkForm">
      <div class="container bg0 p-t-150 p-b-30">
        <div class="row">
          <div class="col-lg-12 m-lr-auto m-b-50">
            <div class="wrap-table js-pscroll">
              <table class="table-checkout">
                <tr class="table_head">
                  <th class="column-1"></th>
                  <th class="column-2">제품</th>
                  <th class="column-3">수량</th>
                  <th class="column-4">가격</th>
                  <th class="column-5">할인율</th>
                  <th class="column-6">할인가격</th>
                  <th class="column-7">총가격</th>
                </tr>
                <tr class="table_row" v-for="(g,index) in goodsList">
                  <td class="column-1"><div class="item"><img :src="g.image" onerror="this.src='../images/image_ready.jpg'"></div></td>
                  <td class="column-2"><a class="link" :href="'../goods/detail.do?gid=' + g.id">{{g.name}}</a></td>
                  <td class="column-3">{{g.quantity}}</td>
                  <td class="column-4">{{g.price | currency }}원</td>
                  <td class="column-5">{{g.sale }}</td>
                  <td class="column-6">{{g.price - (g.price * g.sale / 100) | currency }} 원 </td>
                  <td class="column-7">{{(g.price - (g.price * g.sale / 100)) * g.quantity | currency }} 원</td>
                  <input type=hidden :name="'orderDetailVOList[' + index + '].g_id'" :value="g.id">
                  <input type=hidden :name="'orderDetailVOList[' + index + '].g_name'" :value="g.name">
                  <input type=hidden :name="'orderDetailVOList[' + index + '].g_price'" :value="g.price">
                  <input type=hidden :name="'orderDetailVOList[' + index + '].g_sale'" :value="g.sale">
                  <input type=hidden :name="'orderDetailVOList[' + index + '].g_quantity'" :value="g.quantity">
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
                  <input class="stext-111 bor8 bg0 cl8 plh3 size-111-2 p-lr-15 m-b-12" type="text" v-model="receiver" name="o_receiver" placeholder="이름">
                  
                  <div class="stext-111 p-tb-10">연락처</div>
                  <div class="m-b-12">
                    <input class="stext-111 bor8 bg0 cl8 plh3 size-111-2 p-lr-15 m-b-12 dis-inline-block" type="tel" v-model="phone" name="o_phone" placeholder="연락처">
                  </div>
                  
                  <div class="stext-111 p-tb-10">주소</div>
                  <div class="bor8-2 m-b-12 size-111-2 of-hidden pos-relative">
                    <input class="stext-111 cl8 bg0 plh3 size-111-2 p-lr-15" type="text" v-model="post" name="o_post" placeholder="우편번호" readonly>
                    <button type=button @click="postFind" class="stext-111 cl1 bg3 size-111-3 ab-t-r hov-btn3 flex-c-m">우편번호 찾기</button>
                  </div>
                  <div class="bor8 bg0 m-b-12">
                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" v-model="address1" name="o_address1" placeholder="주소" readonly>
                  </div>
                  <div class="bor8 bg0 m-b-12">
                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" v-model="address2" name="o_address2" placeholder="상세 주소">
                  </div>
                  
                  <div class="stext-111 p-tb-10">요청사항</div>
                  <div class="bor8 bg0 m-b-12">
                    <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" v-model="request" name="o_request" placeholder="요청사항">
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-sm-12 col-md-6 m-lr-auto m-b-50">
            <div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-15-sm">
              <h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>
  
              <div class="flex-w flex-t bor12 p-b-13">
                <div class="size-208"><span class="cl2"> 금액: </span></div>
                <div class="size-209"><span class="cl2"> {{totalPrice() | currency}} 원 </span></div>
              </div>
  
              <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                <div class="size-208 w-full-ssm"><span class="l2"> 배송비: </span></div>
                <div class="size-209"><span class="cl2"> 5,000 원 </span></div>
              </div>
  
              <div class="flex-w flex-t p-t-27 p-b-33">
                <div class="size-208"><span class="cl2"> 총 금액: </span></div>
                <div class="size-209 p-t-1"><span class="cl2"> {{totalPrice() + 5000 | currency}} 원 </span></div>
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
        el:'#checkout',
        data:{
            gidList:${glist },
            goodsList: [],
            receiver: '',
            phone: '',
            post: '',
            address1: '',
            address2: '',
            request: ''
        },
        filters:{
            currency: function(value){
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted:function(){
            // 유저 정보
            axios.get("http://localhost:8080/web/checkout/checkout_user_vue.do",{
            }).then(result=>{
                this.receiver = result.data.name;
                this.phone = result.data.phone;
                this.post = result.data.post;
                this.address1 = result.data.address1;
                this.address2 = result.data.address2;
            })
            
            this.gList();
        },
        methods:{
            gList:function(){
                axios.get("http://localhost:8080/web/checkout/checkout_list_vue.do",{
                    params:{
                        gid: this.gidList.join(",")
                    }
                }).then(result=>{
                    this.goodsList = result.data;
                })
            },
            totalPrice:function(){
                let totalsum = 0;
                this.goodsList.forEach((i,index)=>{totalsum += (i.price - (i.price * i.sale / 100)) * i.quantity })
                return totalsum;
            },
            postFind:function() {
                this_ = this;
                new daum.Postcode({
                    oncomplete:function(data) {
                        this_.post = data.zonecode;
                        this_.address1 = data.address;
                    }
                }).open()
            },
            checkForm:function(e) {
                if(this.receiver && this.phone && this.post && this.address1) {
                    return true;
                } else {
                    alert("입력칸을 채워주세요");
                }
                e.preventDefault();
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