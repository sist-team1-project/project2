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
  <div class="container bg0 p-t-70 p-b-10" id="adorder">
    <div class="row" id="orderpage">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-10">
          <h3>판매 목록</h3>
        </div>
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-md-12 dis-flex flex-sb">
        <div class="p-tb-10 flex-l">
          <div class="fs-13">
              총 {{count | currency}} 개
          </div>
        </div>
        
        <!---------------- 주문상태 정렬  -------------------->
        <div id="sort" class="p-tb-10 flex-r p-tb-3 p-lr-5">
          <button class="cl2" :class="{'activeFilter':sort=='A'}" value="A" @click="orderstate($event)">전체</button> &nbsp;&nbsp;| &nbsp;&nbsp;
  	      <button class="cl2" :class="{'activeFilter':sort=='B'}" value="B" @click="orderstate($event)">주문취소</button> &nbsp;&nbsp;| &nbsp;&nbsp;
  	      <button class="cl2" :class="{'activeFilter':sort=='C'}" value="C" @click="orderstate($event)">대기중</button> &nbsp;&nbsp;| &nbsp;&nbsp;
          <button class="cl2" :class="{'activeFilter':sort=='D'}" value="D" @click="orderstate($event)">상품준비중</button> &nbsp;&nbsp;| &nbsp;&nbsp;
          <button class="cl2" :class="{'activeFilter':sort=='E'}" value="E" @click="orderstate($event)">배송중</button> &nbsp;&nbsp;| &nbsp;&nbsp;
          <button class="cl2" :class="{'activeFilter':sort=='F'}" value="F" @click="orderstate($event)">배송완료</button>
        </div>
      </div>
      <!----------------------------------------------->
      
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">
          <table class="table-order text-center">
            <tr class="table_head text-center">
              <th>주문일시</th>
              <th>주문번호</th>
              <th>주문자</th>
              <th>상품명</th>
              <th>주문금액</th>
              <th>주문상태</th>
            </tr>
            <tr v-for="o in orderFullList" class="table_row_order fs-13 text-center">
              <td>{{o.regdate}}</td>
              <td><a class="cl8" href="#" data-toggle="modal" @click="odetail(o.oid)">{{o.oid}}</a></td>
              <td>{{o.usid}}</td>
              <td>{{o.name}}</td>
              <td>{{o.price | currency }} 원</td>
              <td id="select" class="state">
              <select @change="selecteOrder($event, o.oid)">
                <option :selected="o.state==-1" value="-1">주문취소</option>
                <option :selected="o.state==0" value="0">대기중</option>
                <option :selected="o.state==1" value="1">상품준비중</option>
                <option :selected="o.state==2" value="2">배송중</option>
                <option :selected="o.state==3" value="3">배송완료</option>
              </select>
              </td>
             </tr>
          </table>
        </div>
      </div>
    </div>
    
    <!------------- 페이징 ------------->
    <div class="text-center">
      <ul class="pagination">
        <li class="page-item" :class="{'disabled':startPage==1}">
          <button class="page-link" :value="startPage-1" @click="getpage($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
        </li>
        <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}">
          <button class="page-link" :value="i" @click="getpage($event)">{{i}}</button>
        </li>
        <li class="page-item" :class="{'disabled':endPage==totalpage}">
          <button class="page-link" :value="endPage+1" @click="getpage($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
        </li>
      </ul>
    </div>
      
    
    <!-- 사이드 Detail -->
    <div class="wrap-header-admin js-panel-admin">
      <div class="s-full" v-on:click="odetail_close"></div>
      <div class="header-admin flex-col-l p-l-65 p-r-25">
        <div class="header-admin-title flex-w flex-sb flex-b p-b-8">
          <span class="mtext-103 cl2"> 주문 상세 정보 </span>
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04">
            <i class="zmdi zmdi-close" v-on:click="odetail_close"></i>
          </div>
        </div>
        <div class="header-admin-content flex-w">
          <iframe height="100%" width="580px" :src="iframe"></iframe>
        </div>
      </div>
    </div>
  </div>
  
  <script>
    new Vue({
        el:'#adorder',
        data:{
            oid:'${oid }',
            orderFullList: [],        
            curpage : 1,
            totalpage : 0,
            startPage : 0,
            endPage : 0,
            pages : [],
            count : 0,
            iframe :'',
            selected : [],
            state : 0,
            sort : 'A'
        },
        filters:{
              currency: function(value){
                  var num = new Number(value);
                  return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              }
          },
        mounted:function(){
            this.oList();
        },
        methods:{
            oList:function(){
                axios.get("http://localhost:8080/web/admin/orderlist_vue.do",{
                    params:{
                        page: this.curpage,
                        sort: this.sort
                    }
                }).then(res=>{
                    this.orderFullList = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.startPage = res.data[0].startPage;
                    this.endPage = res.data[0].endPage;
                    this.count = res.data[0].count;
                    console.log(this.count);
                    this.pages=[];
                    for(i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
                })
            },
            getpage : function(event){
                this.curpage = event.currentTarget.value;
                this.oList();
            },
            selecteOrder:function(event, oid) {
                let state = event.currentTarget.value;
                axios.post("http://localhost:8080/web/admin/order_state_update_ok.do",null,{
                    params:{
                        state: state,
                        oid: oid
                    }
                })
            },
            /* 디테일 열기 */
            odetail : function(oid) {
                this.iframe = '../admin/orderdetail.do?oid=' + oid;
                $('.js-panel-admin').addClass('show-header-admin');
            },
            /* 디테일 닫기 */
            odetail_close : function(){
                $('.js-panel-admin').removeClass('show-header-admin');
            },
            orderstate:function(event) {
                this.curpage = 1; // 페이지 초기화
                this.sort = event.currentTarget.value; // 누른 버튼의 값(원하는 순서)을 가지고옴
                this.oList();      // 목록 출력
            }
        }
    })
  </script>
</body>
</html>