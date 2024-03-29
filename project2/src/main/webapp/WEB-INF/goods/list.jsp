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

  <div class="bg0 p-t-100">
    <div id="listpage" class="container">
      <!-- ------ 검색 필터 ------ -->
      <div id="search" class="w-full bor8">
        <div class="bg6 w-full p-t-27 p-lr-40 p-lr-15-sm">
          <div class="p-t-10 p-b-27">
            <div class="mtext-102 cl2 p-b-15">검색어</div>
            <input class="mtext-107 cl2 bor8 p-lr-15 p-tb-5" type="text" v-model="keyword" placeholder="검색어 입력">
          </div>
          
          <div class="p-b-27">
            <div class="mtext-102 cl2 p-b-15">브랜드</div>
            <span id="brand-all" class="p-tb-10 p-r-15 dis-inline-block"><input class="dis-inline-block" type=checkbox value="" v-model="checkAll" @click="brandCheckAll()"> 전체&nbsp;&nbsp;</span>
            <span class="p-tb-10 p-r-15 dis-inline-block" v-for="b in brands"><input class="dis-inline-block" type=checkbox :value="b.brand" v-model="selectedBrands" @click="checkAll=false"> {{b.brand}}&nbsp;&nbsp;</span>
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
        <button class="cl3" :class="{'activeFilter':order=='A'}" value="A" @click="searchByOrder($event)">신상품 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl3" :class="{'activeFilter':order=='B'}" value="B" @click="searchByOrder($event)">판매량 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl3" :class="{'activeFilter':order=='C'}" value="C" @click="searchByOrder($event)">낮은가격 순</button> &nbsp;&nbsp;| &nbsp;&nbsp;
        <button class="cl3" :class="{'activeFilter':order=='D'}" value="D" @click="searchByOrder($event)">높은가격 순</button>
      </div>
      <!-- --------------------- -->
      <div class="row" v-if="empty==false"> <!-- 상품이 하나도 없으면 아예 출력을하지 않는다 -->
        <!-- 아이템 -->
        <div v-for="(vo,index) in goods" class="col-sm-6 col-md-4 col-lg-3 p-b-35">
          <div class="block2">
            <div class="block2-pic hov-img0"><a :href="'../goods/detail.do?gid=' + vo.gid"><img onerror="this.src='../images/image_ready.jpg'" :src="vo.image"></a></div>
            <div class="block2-txt flex-w flex-t p-t-14">
              
              <div class="block2-txt-child1 flex-col-l short">
                <a :href="'../goods/detail.do?gid=' + vo.gid" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
                <div class="cl4">{{vo.price | currency}} 원</div>
              </div>
            
              <div class="block2-txt-child2 flex-r">
                <span class="btn-addwish-b2 dis-block pos-relative">
                  <c:if test="${sessionScope.id!=null }">
                    <img v-if="vo.lid==0" class="icon-heart1 trans-04 pointer" src="../images/icons/icon-heart-01.png" @click="like(vo.gid,index); alert('즐겨찾기에 등록되었습니다')">
                    <img v-if="vo.lid>0" class="icon-heart2 trans-04 pointer" src="../images/icons/icon-heart-02.png" @click="unlike(vo.lid); vo.lid=0; alert('즐겨찾기가 해제되었습니다')">
                  </c:if>
                  <c:if test="${sessionScope.id==null }">
                    <img class="icon-heart1 trans-04 pointer" src="../images/icons/icon-heart-01.png" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
                  </c:if>
                </span>
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
    new Vue({
        el:'#listpage',
        data:{
            cid:'${cid }',
            cname: '',
            keyword:'${keyword }',
            brands:[],
            selectedBrands:[],
            checkAll:true,
            order:'A',
            goods:[],
            totalpage:0,
            empty: false,
            curpage:1,
            start:1,
            end:1,
            pages:[]
        },
        filters:{
            currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
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
                    $("#amount").text(price1 + " 원 - " + price2 + " 원"); // 변경되는 가격 뿌려주기
                }
            });
            /* 가격 슬라이더 초기 설정 */
            let price1 = $('#slider-range').slider("values")[0].toLocaleString('ko-KR');
            let price2 = $('#slider-range').slider("values")[1].toLocaleString('ko-KR');
            $("#amount").text(price1 + " 원 - " + price2 + " 원"); // 초기 가격 뿌려주기
            this.list();
        },
        methods:{
            /* 상품 출력 */
            list:function(){
                $("#items")[0].scrollIntoView();
                axios.get("http://13.125.104.199/project2/goods/list_vue.do",{
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
                    this.goods = result.data;
                    this.curpage = result.data[0].curpage;
                    this.totalpage = result.data[0].totalpage;
                    this.start = result.data[0].start;
                    this.end = result.data[0].end;
                    
                    // 검색 결과가 없을 경우 (cid, page 등 페이지에 관한 정보는 가지고 오기 때문에 goods의 길이는 무조건 1 이상)
                    if(result.data[0].name == null) {
                        this.empty = true;
                    } else {
                        this.empty = false;
                    }
                    this.pages = [];
                    for(i = this.start; i <= this.end; i++) {
                        this.pages.push(i);
                    }
                })
            },
            /* 브랜드 목록 & 카테고리 이름 출력 (초기 1번만) */
            brandListAndCname:function(){
                axios.get("http://13.125.104.199/project2/goods/brandlist_cname_vue.do",{
                    params:{
                        cid: this.cid
                    }
                }).then(result=>{
                    this.cname = result.data[0].cname;
                    this.brands = result.data;
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
                console.log(this.order)
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
            like:function(gid, index) { // 좋아요
                axios.post("http://13.125.104.199/project2/goods/like_insert_ok.do",null,{
                    params:{gid: gid}
                }).then(result=>{
                    this.goods[index].lid = result.data.lid;
                })
            },
            unlike:function(lid) { // 싫어요
                axios.post("http://13.125.104.199/project2/goods/like_delete_ok.do",null,{params:{lid: lid}})
            }
        }
    })
  </script>
</body>
</html>