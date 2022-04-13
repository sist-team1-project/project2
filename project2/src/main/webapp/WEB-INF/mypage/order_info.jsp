<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mypage/order.css">
</head>
<body>
  <div class="container" id="orderinfo">
    <div class="row" id="orderpage">
      <div class="col-md-12">
        <div class="p-b-10">
          <h3><i class="fa fa-truck" aria-hidden="true"></i>&nbsp;주문 정보</h3>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="p-tb-10 flex-l">
          <div class="fs-13">총 {{count | currency}} 건 </div>
        </div>
      </div>
      <div class="col-md-12 m-b-50" id="order-min-width">
        <div class="wrap-table js-pscroll">
          <table class="table-order text-center">
            <tr class="table_head text-center">
              <th class="column-1">주문자</th>
              <th class="column-2">주문일시</th>
              <th class="column-3">주문번호</th>
              <th class="column-4">주문상태</th>
            </tr>
            <tr v-for="my in orderInfoList" class="table_row_order fs-13 text-center">
              <td class="column-1"> {{my.uid}} </td>
              <td class="column-2"> {{my.regdate}} </td>
              <td class="column-3"><a class="cl8 link" href="#" data-toggle="modal" @click="odetail(my.oid)">{{my.oid}}</a></td>
              <td class="column-4" v-if="my.state==-1">주문취소</td>
              <td class="column-4" v-if="my.state==0">대기중 <br>
               <button class="bor20 cl2 btn-pro-color2 p-tb-4 p-lr-10" value=-1 @click="cancel($event, my.oid); my.state=-1">주문취소</button>
              </td>
              <td class="column-4" v-if="my.state==1">상품준비중</td>
              <td class="column-4" v-if="my.state==2">배송중</td>
              <td class="column-4" v-if="my.state==3">배송완료</td>
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
      <div class="s-full" @click="odetail_close"></div>
      <div class="header-admin flex-col-l p-l-65 p-r-25">
        <div class="header-admin-title flex-w flex-sb flex-b p-b-8">
          <span class="mtext-103 cl2"> 주문 상세 정보 </span>
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04">
            <i class="zmdi zmdi-close" @click="odetail_close"></i>
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
        el:'#orderinfo',
        data:{
            orderInfoList: [],        
            curpage : 1,
            totalpage : 0,
            startPage : 0,
            endPage : 0,
            pages : [],
            count : 0,
            iframe :''
        },
        mounted:function(){
            this.infoList();
        },
        methods:{
            infoList:function(){
                axios.get("http://localhost:8080/web/mypage/orderInfoList_vue.do",{
                    params:{
                    	page: this.curpage
                    }
                }).then(res=>{
                    this.orderInfoList = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.startPage = res.data[0].startPage;
                    this.endPage = res.data[0].endPage;
                    this.count = res.data[0].count;
                    this.pages=[];
                    for(i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
                })
            },
            getpage : function(event){
                this.curpage = event.currentTarget.value;
                this.infoList();
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
            /* 주문취소 */
            cancel:function(event, oid) { 
        	    let state = event.currentTarget.value;
                axios.post("http://localhost:8080/web/mypage/user_state_cancel_ok.do",null,{
                    params:{
                    	state: state,
                    	oid : oid
                    }
                })
            }
        }
    })
  </script>
</body>
</html>