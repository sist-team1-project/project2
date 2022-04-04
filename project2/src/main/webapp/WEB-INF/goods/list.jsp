<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

  <div class="bg0 p-t-100">
    <div id="listpage" class="container">
      <div id="search" class="w-full p-t-10">
        <div class="bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
        
          <!-- Search product -->
          <div class="p-t-10 p-b-15">
            <div class="mtext-102 cl2 p-b-15">검색어</div>
            <input class="mtext-107 cl2 bor8 p-lr-15 p-tb-5" type="text" name="search-product" placeholder="검색어 입력">
          </div>
          
          <div class="p-b-27">
            <div class="mtext-102 cl2 p-b-15">브랜드</div>
            <span class="p-tb-10 p-r-15 dis-inline-block" v-for="b in brands"><input class="dis-inline-block" type=checkbox name="brand" :value="b.brand"> {{b.brand}}&nbsp;&nbsp;</span>
          </div>
          
          <div class="p-r-15 p-b-27">
            <div class="mtext-102 cl2 p-b-15">가격</div>
            <input class="bor8 p-lr-15 p-tb-5 dis-inline-block" type=number name=price1 placeholder="최소 금액 입력"> 원 ~ <input class="bor8 p-lr-15 p-tb-5 dis-inline-block" type=number name=price2 placeholder="최대 금액 입력"> 원
          </div>
        </div>
      </div>
      <div id="items" class="row p-t-70 p-b-20"><div class="col-lg-12"><h4>제품</h4></div></div>
      <div class="row" v-if="empty==1">
        <!-- 아이템 루프로 돌리기 -->
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
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    
      <div class="text-center">
        <ul class="pagination">
          <li class="page-item" v-bind:class="{'disabled':start==1}"><button class="page-link" :value="start-1" v-on:click="prev($event)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
          <li class="page-item" v-for="i in pages" v-bind:class="{'active':i==curpage}"><button class="page-link" :value="i" v-on:click="curr($event)">{{i}}</button></li>
          <li class="page-item" v-bind:class="{'disabled':end==totalpage}"><button class="page-link" :value="end+1" v-on:click="next($event)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
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
            goods:[],
            totalpage:0,
            empty: 1,
            curpage:1,
            start:1,
            end:1,
            pages:[]
        },
        mounted:function(){
            this.list();
            this.brandList();
        },
        methods:{
            list:function(){
                axios.get("http://localhost:8080/web/goods/list_vue.do",{
                    params:{
                        cid: this.cid,
                        page: this.curpage,
                        keyword: this.keyword
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
            curr:function(event) {
                $("#items")[0].scrollIntoView();
                this.curpage = event.currentTarget.getAttribute('value');
                this.list();
            },
            prev:function(event) {
                $("#items")[0].scrollIntoView();
                this.curpage = event.currentTarget.getAttribute('value');
                this.list();
            },
            next:function(event) {
                $("#items")[0].scrollIntoView();
                this.curpage = event.currentTarget.getAttribute('value');
                this.list();
            }
        }
    })
  </script>
</body>
</html>