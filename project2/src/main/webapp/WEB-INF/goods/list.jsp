<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../css/list.css">
</head>
<body>

  <div class="bg0 p-t-100">
    <div id="listpage" class="container">
      <!-- ------ 검색 필터 ------ -->
      <div id="search" class="w-full bor8">
        <div class="bg6 w-full p-t-27 p-lr-40 p-lr-15-sm">
          <div class="p-t-10 p-b-27">
            <div class="mtext-102 cl2 p-b-15">제품 이름으로 검색</div>
            <input class="mtext-107 cl2 bor8 p-lr-15 p-tb-5" type="text" v-model="keyword" placeholder="검색어 입력">
          </div>
          
          <div class="p-b-27">
            <div class="mtext-102 cl2 p-b-15">브랜드</div>
            <span id="brand-all" class="p-tb-10 p-r-15 dis-inline-block"><input class="dis-inline-block" type=checkbox value="" v-model="checkAll" @click="brandCheckAll()"> 전체&nbsp;&nbsp;</span>
            <span class="p-tb-10 p-r-15 dis-inline-block" v-for="b in brands"><input class="dis-inline-block" type=checkbox :value="b.brand" v-model="selectedBrands" @click="brandCheck()"> {{b.brand}}&nbsp;&nbsp;</span>
          </div>
          
          <div class="p-r-15 p-b-27">
            <div class="mtext-102 cl2 p-b-15">가격</div>
            <div id="amount" class="p-b-5"></div>
            <div id="slider-range"></div>
          </div>
          
          <div class="p-b-27 flex-c-m">
            <button type=button id="search-btn" class="cl1 size-101 bg3 bor1 hov-btn3 trans-04" @click="search()">검 색</button>
          </div>
        </div>
      </div>
      <div id="items" class="row p-t-40 p-b-10"><div class="col-lg-12"><h4>{{cname}}</h4></div></div>
      <!-- --------------------- -->
      <!-- ------ 검색 순서 ------ -->
      <div id="order" class="bor8 m-tb-10 cl2 p-tb-10 p-lr-40 p-lr-15-sm">
        <button class="cl2" :class="{'activeFilter':order=='A'}" value="A" @click="searchByOrder($event)">신상품 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='B'}" value="B" @click="searchByOrder($event)">판매량 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='C'}" value="C" @click="searchByOrder($event)">낮은가격 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='D'}" value="D" @click="searchByOrder($event)">높은가격 순</button>
      </div>
      <!-- --------------------- -->
      <div class="row" v-if="empty==1"> <!-- 상품이 하나도 없으면 아예 출력을하지 않는다 -->
        <!-- 아이템 -->
        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 women" v-for="vo in goods">
          <div class="block2">
            <div class="block2-pic hov-img0"><a :href="'../goods/detail.do?gid=' + vo.gid"><img :src="vo.image"></a></div>
            <div class="block2-txt flex-w flex-t p-t-14">
              
              <div class="block2-txt-child1 flex-col-l short">
                <a :href="'../goods/detail.do?gid=' + vo.gid" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
                <div class="cl4">₩{{vo.price | makeComma}}</div>
              </div>

              <div class="block2-txt-child2 flex-r p-t-3">
                <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                  <img class="icon-heart1 dis-block trans-04" src="../images/icons/icon-heart-01.png">
                  <img class="icon-heart2 dis-block trans-04 ab-t-l" src="../images/icons/icon-heart-02.png">
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    
      <div class="text-center p-t-30 p-b-20">
        <ul class="pagination">
          <li class="page-item" :class="{'disabled':start==1}"><button class="page-link" :value="start-1" @click="paging($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
          <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}"><button class="page-link" :value="i" @click="paging($event)">{{i}}</button></li>
          <li class="page-item" :class="{'disabled':end==totalpage}"><button class="page-link" :value="end+1" @click="paging($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
        </ul>
      </div>
    </div>
    
  </div>
  <script>
    /* 제품 출력용 Vue 필터 */
    Vue.filter("makeComma", val =>{
        return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    })
    new Vue({
        el:'#listpage',
        data:{
            cid:'${cid }',
            cname: '',
            cname: '',
            keyword:'',
            brands:[],
            selectedBrands:[],
            order:'A',
            goods:[],
            totalpage:0,
            empty: 1,
            curpage:1,
            start:1,
            end:1,
            pages:[],
            checkAll:true
        },
        mounted:function(){
            
            this.brandListAndCname();
            
            /* 가격 슬라이더 */
            $("#slider-range").slider({
                range: true,
                min: 0,
                max: ${maxPrice},
                values: [0, ${maxPrice}],
                slide: function( event, ui ) {
                    let price1 = ui.values[0].toLocaleString('ko-KR');
                    let price2 = ui.values[1].toLocaleString('ko-KR');
                    $("#amount").text("₩" + price1 + " - ₩" + price2); // 변경되는 가격 뿌려주기
                }
            });
            /* 가격 슬라이더 초기 설정 */
            let price1 = $('#slider-range').slider("values")[0].toLocaleString('ko-KR');
            let price2 = $('#slider-range').slider("values")[1].toLocaleString('ko-KR');
            $("#amount").text("₩" + price1 + " - ₩" + price2); // 초기 가격 뿌려주기
            this.list();
        },
        methods:{
            /* 상품 출력 */
            list:function(){
                $("#items")[0].scrollIntoView();
                axios.get("http://localhost:8080/web/goods/list_vue.do",{
                    params:{
                        cid: this.cid,
                        page: this.curpage,
                        keyword: this.keyword,
                        brands: this.selectedBrands.join(","),
                        price1: $('#slider-range').slider("values")[0],
                        price2: $('#slider-range').slider("values")[1],
                        order: this.order
                    }
                }).then(result=>{
                    this.goods=result.data;
                    this.curpage=result.data[0].curpage;
                    this.totalpage=result.data[0].totalpage;
                    this.start=result.data[0].start;
                    this.end=result.data[0].end;
                    
                    // 검색 결과가 없을 경우
                    if(result.data[0].name == null) {
                        this.empty = 0;
                    } else {
                        this.empty = 1;
                    }
                    this.pages = [];
                    for(i = this.start; i <= this.end; i++) {
                        this.pages.push(i);
                    }
                })
            },
            /* 브랜드 목록 & 카테고리 이름 출력 (초기 1번만) */
            brandListAndCname:function(){
                axios.get("http://localhost:8080/web/goods/brandlist_cname_vue.do",{
                    params:{
                        cid: this.cid
                    }
                }).then(result=>{
                    this.brands=result.data;
                    this.cname=result.data[0].cname;
                })
            },
            /* 페이지 전환 */
            paging:function(event) {
                this.curpage = event.currentTarget.value;
                this.list();
            },
            /* 검색 버튼 */
            search:function() {
                this.order = 'A'; // 검색 순서 초기화
                this.curpage = 1; // 페이지 초기화
                this.list();      // 목록 출력
            },
            /* 검색 순서 버튼 */
            searchByOrder:function(event) {
                this.curpage = 1; // 페이지 초기화
                this.order = event.currentTarget.value; // 누른 버튼의 값(원하는 순서)을 가지고옴
                this.list();      // 목록 출력
            },
            /* 브랜드 전체 체크 버튼 */
            brandCheckAll:function() {
                if(this.checkAll == false) {  // 전체 체크 버튼을 선택
                    this.checkAll = true;
                    this.selectedBrands = []; // 브랜드 목록 초기화 (빈 배열일시 쿼리문에서 브랜드를 조건에 넣지 않음)
                } else {                      // 전체 체크 버튼을 해제
                    this.checkAll = false;
                }
            },
            /* 브랜드 전체 체크 해제 버튼 */
            brandCheck:function() {
                this.checkAll = false;
            }
        }
    })
  </script>
</body>
</html>