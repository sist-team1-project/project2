<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
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
            <input class="bor8 p-lr-15 p-tb-5 dis-inline-block" type=number min="0" step="1000" v-model="price1"> 원 ~ <input class="bor8 p-lr-15 p-tb-5 dis-inline-block" type=number min="0" step="1000" v-model="price2"> 원
          </div>
          
          <div class="p-b-27 flex-c-m">
            <button type=button id="search-btn" class="cl1 size-101 bg3 bor1 hov-btn3 trans-04" @click="search()">검 색</button>
          </div>
        </div>
      </div>
      <!-- --------------------- -->
      <!-- ------ 검색 순서 ------ -->
      <div id="order" class="bor8 m-t-20 cl2 p-tb-10 p-lr-40 p-lr-15-sm">
        <button class="cl2" :class="{'activeFilter':order=='A'}" value="A" @click="order=event.currentTarget.value">판매량 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='B'}" value="B" @click="order=event.currentTarget.value">신상품 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='C'}" value="C" @click="order=event.currentTarget.value">낮은가격 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl2" :class="{'activeFilter':order=='D'}" value="D" @click="order=event.currentTarget.value">높은가격 순</button>
      </div>
      <!-- --------------------- -->
      <div id="items" class="row p-t-70 p-b-20"><div class="col-lg-12"><h4>제품</h4></div></div>
      <div class="row" v-if="empty==1">
        <!-- 아이템 -->
        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 women" v-for="vo in goods">
          <div class="block2">
            <div class="block2-pic hov-img0"><a :href="'../goods/detail.do?gid=' + vo.gid"><img :src="vo.image"></a></div>
            <div class="block2-txt flex-w flex-t p-t-14">
              <div class="block2-txt-child1 flex-col-l ">
                <a :href="'../goods/detail.do?gid=' + vo.gid" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
                <span class="stext-105 cl3"></span>
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
    
      <div class="text-center">
        <ul class="pagination">
          <li class="page-item" :class="{'disabled':start==1}"><button class="page-link" :value="start-1" @click="paging($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
          <li class="page-item" v-for="i in pages" :class="{'active':i==curpage}"><button class="page-link" :value="i" @click="paging($event)">{{i}}</button></li>
          <li class="page-item" :class="{'disabled':end==totalpage}"><button class="page-link" :value="end+1" @click="paging($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
        </ul>
      </div>
    </div>
    
  </div>
  <script>
    new Vue({
        el:'#listpage',
        data:{
            cid:'${cid }',
            keyword:'',
            brands:[],
            selectedBrands:[],
            price1: null,
            price2: null,
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
            this.list();
        },
        methods:{
            list:function(){
                this.brandList();
                $("#items")[0].scrollIntoView();
                axios.get("http://localhost:8080/web/goods/list_vue.do",{
                    params:{
                        cid: this.cid,
                        page: this.curpage,
                        keyword: this.keyword,
                        brands: this.selectedBrands.join(",")
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
                    this.pages=[];
                    for(i = this.start; i <= this.end; i++) {
                        this.pages.push(i);
                    }
                    
                })
            },
            brandList:function(){
                axios.get("http://localhost:8080/web/goods/list_brand_vue.do",{
                    params:{
                        cid: this.cid,
                        keyword: this.keyword
                    }
                }).then(result=>{
                    this.brands=result.data;
                })
            },
            paging:function(event) {
                this.curpage = event.currentTarget.value;
                this.list();
            },
            search:function() {
                this.curpage = 1;
                this.list();
            },
            brandCheckAll:function() {
                if(this.checkAll==false) {
                    this.checkAll=true;
                    this.selectedBrands = [];
                } else {
                    this.checkAll=false;
                }
            },
            brandCheck:function() {
                this.checkAll=false;
            }
        }
    })
  </script>
</body>
</html>