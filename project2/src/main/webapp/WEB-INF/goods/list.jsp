<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

  <div class="bg0 p-t-150">
    <div id="listpage" class="container">
      <div class="flex-w flex-sb-m">
        
        <!-- Search product -->
        <div class="panel-search p-t-10 p-b-15">
          <div class="bor8 dis-flex p-l-15">
            <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <input class="mtext-107 cl2 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
          </div>
        </div>

        <!-- Filter -->
        <div class="panel-filter w-full p-t-10">
          <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
            <div class="filter-col1 p-r-15 p-b-27">
              <div class="mtext-102 cl2 p-b-15">Sort By</div>
              <ul>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> Default </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> Popularity</a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> Average rating </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04 filter-link-active"> Newness </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> Price: Low to High </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> Price: High to Low </a></li>
              </ul>
            </div>

            <div class="filter-col2 p-r-15 p-b-27">
              <div class="mtext-102 cl2 p-b-15">Price</div>
              <ul>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04 filter-link-active"> All </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> $0.00 - $50.00 </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> $50.00 -$100.00 </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> $100.00 -$150.00 </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> $150.00 - $200.00 </a></li>
                <li class="p-b-6"><a href="#" class="filter-link stext-106 trans-04"> $200.00+ </a></li>
              </ul>
            </div>

            <div class="filter-col3 p-r-15 p-b-27">
              <div class="mtext-102 cl2 p-b-15">Color</div>
              <ul>
                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #222;"> <i class="zmdi zmdi-circle"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04">Black </a>
                </li>

                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #4272d7;"><i class="zmdi zmdi-circle"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04 filter-link-active">Blue </a>
                </li>

                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;"><i class="zmdi zmdi-circle"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04">Grey </a>
                </li>

                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;"><i class="zmdi zmdi-circle"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04">Green </a>
                </li>

                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04">Red </a>
                </li>

                <li class="p-b-6">
                  <span class="fs-15 lh-12 m-r-6" style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i></span>
                  <a href="#" class="filter-link stext-106 trans-04">White </a>
                </li>
              </ul>
            </div>
        
            <div class="filter-col4 p-b-27">
              <div class="mtext-102 cl2 p-b-15">Tags</div>
              <div class="flex-w p-t-4 m-r--5">
                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Fashion </a>
                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Lifestyle </a>
                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Denim </a>
                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Streetstyle </a>
                <a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">Crafts </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="items" class="row p-t-70 p-b-20"><div class="col-lg-12"><h4>제품</h4></div></div>
      <div class="row" v-if="empty==1">
        <!-- 아이템 루프로 돌리기 -->
        <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 women" v-for="vo in goods">
          <div class="block2">
            <div class="block2-pic hov-img0"><a v-bind:href="'../goods/detail.do?gid=' + vo.gid"><img :src="vo.image"></a></div>
            <div class="block2-txt flex-w flex-t p-t-14">
              <div class="block2-txt-child1 flex-col-l ">
                <a v-bind:href="'../goods/detail.do?gid=' + vo.gid" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
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