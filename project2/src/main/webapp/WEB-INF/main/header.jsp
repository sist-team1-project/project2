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
  <!-- 헤더 -->
  <header>
  
    <!-- 데스크탑 헤더 -->
    <div class="container-menu-desktop">
      <!-- 상단 바 -->
      <div class="top-bar">
        <div class="content-topbar flex-sb-m h-full container">
          <div class="left-top-bar">3만원 이상 구매시 무료배송</div>
          
          <c:if test="${sessionScope.id==null }">
            <div class="right-top-bar flex-w h-full">
              <a href="../support/notice.do" class="flex-c-m trans-04 p-lr-25">고객센터</a>
              <a href="../user/login.do" class="flex-c-m trans-04 p-lr-25">로그인</a>
            </div>
          </c:if>
          <c:if test="${sessionScope.id!=null }">
            <div class="left-top-bar">${sessionScope.id}님 안녕하세요!</div>
            <div class="right-top-bar flex-w h-full">
              <a href="../support/notice.do" class="flex-c-m trans-04 p-lr-25">고객센터</a>
              <a href="../mypage/mypage.do" class="flex-c-m trans-04 p-lr-25">마이페이지</a>
              <c:if test="${sessionScope.grade=='0' }">
                <a href="../admin/adlist.do" class="flex-c-m trans-04 p-lr-25">관리자페이지</a>
              </c:if>
              <a href="../user/logout.do" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
            </div>
          </c:if>
        </div>
      </div>

      <div class="wrap-menu-desktop">
        <nav class="limiter-menu-desktop container">

          <!-- 데스크탑 로고 -->
          <a href="../main/main.do" class="logo">
            <img src="../images/logo.png">
          </a>

          <!-- 데스크탑 메뉴 -->
          <div class="menu-desktop">
            <ul class="main-menu">
              <li><a href="../main/main.do">홈</a></li>
              <li><a href="../goods/list.do">전체</a></li>
              <li v-for="(cate,index) in categories1"><a :href="'../goods/list.do?cid=' + cate.cid">{{cate.title}}</a>
                <ul class="sub-menu">
                  <li v-for="cate2 in categories2[index]"><a :href="'../goods/list.do?cid=' + cate2.cid">{{cate2.title}}</a></li>
                </ul>
              </li>
            </ul>
          </div>

          <!-- 아이콘 헤더 -->
          <div class="wrap-icon-header flex-w flex-r-m">
            <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-15 p-r-8 js-show-modal-search">
              <i class="zmdi zmdi-search"></i>
            </div>
            <c:if test="${sessionScope.id!=null }">
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-15 p-r-8 icon-header-noti js-show-cart" :data-notify="cart" @click="cList()">
                <i class="zmdi zmdi-shopping-cart"></i>
              </div>
            </c:if>
            <c:if test="${sessionScope.id==null }">
              <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-15 p-r-8" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
              <i class="zmdi zmdi-shopping-cart"></i>
            </div>
            </c:if>
        	<c:if test="${sessionScope.grade=='1' || sessionScope.grade=='0' }">
          	  <a href="../mypage/like.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-15 p-r-8">
                <i class="zmdi zmdi-favorite-outline"></i>
              </a>
        	</c:if>
        	<c:if test="${sessionScope.id==null }">
          	  <div class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
                <i class="zmdi zmdi-favorite-outline"></i>
              </div>
        	</c:if> 
          </div>
        </nav>
      </div>
    </div>

    <!-- 모바일 헤더 -->
    <div class="wrap-header-mobile">
      <!-- 로고 모바일 -->
      <div class="logo-mobile">
        <a href="../main/main.do"><img src="../images/logo.png"></a>
      </div>

      <!-- 아이콘 헤더 -->
      <div class="wrap-icon-header flex-w flex-r-m m-r-15">
        <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
          <i class="zmdi zmdi-search"></i>
        </div>
        <c:if test="${sessionScope.grade=='1' || sessionScope.grade=='0' }">
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" :data-notify="cart" @click="cList()">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>
        </c:if>
        <c:if test="${sessionScope.id==null }">
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>
        </c:if>
        <c:if test="${sessionScope.grade=='1' || sessionScope.grade=='0' }">
          <a href="../mypage/like.do" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-15 p-r-8 icon-header-noti">
             <i class="zmdi zmdi-favorite-outline"></i>
           </a>
        </c:if>        
        <c:if test="${sessionScope.id==null }">
          <div class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
            <i class="zmdi zmdi-favorite-outline"></i>
          </div>
        </c:if>        
      </div>

      <!-- 메뉴 보여주기 버튼 -->
      <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
        <span class="hamburger-box">
        <span class="hamburger-inner"></span>
        </span>
      </div>
    </div>


    <!-- 모바일 메뉴 -->
    <div class="menu-mobile">
      <ul class="topbar-mobile">
        <li><div class="left-top-bar">3만원 이상 구매시 무료배송</div></li>

        <li>
          <c:if test="${sessionScope.id==null }">
            <div class="right-top-bar flex-w h-full">
              <a href="../support/notice.do" class="flex-c-m p-lr-10 trans-04">고객센터</a>
              <a href="../user/login.do" class="flex-c-m p-lr-10 trans-04">로그인</a>
            </div>
          </c:if>
          <c:if test="${sessionScope.id!=null }">
            <div class="right-top-bar flex-w h-full">
              <a href="../support/notice.do" class="flex-c-m p-lr-10 trans-04">고객센터</a>
                <a href="../mypage/mypage.do" class="flex-c-m p-lr-10 trans-04">마이페이지</a>
              <c:if test="${sessionScope.grade=='0' }">
                <a href="../admin/adlist.do" class="flex-c-m p-lr-10 trans-04">관리자페이지</a>
              </c:if>
              <a href="../user/logout.do" class="flex-c-m p-lr-10 trans-04">로그아웃</a>
            </div>
          </c:if>
        </li>
      </ul>

      <ul class="main-menu-m">
        <li><a href="index.html">홈</a></li>
        <li><a href="../goods/list.do">전체</a></li>
        <li v-for="(cate,index) in categories1"><a v-bind:href="'../goods/list.do?cid=' + cate.cid">{{cate.title}}</a><span class="arrow-main-menu-m"><i class="fa fa-angle-right" aria-hidden="true"></i></span>
          <ul class="sub-menu-m">
            <li v-for="cate2 in categories2[index]"><a v-bind:href="'../goods/list.do?cid=' + cate2.cid">{{cate2.title}}</a></li>
          </ul>
        </li>
      </ul>
    </div>

    <!-- 검색 모델 -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
      <div class="container-search-header">
        <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
          <img src="../images/icons/icon-close2.png" alt="CLOSE">
        </button>

        <form method="get" action="http://localhost:8080/web/goods/list.do" class="wrap-search-header flex-w p-l-15">
          <button type=submit class="flex-c-m trans-04"><i class="zmdi zmdi-search"></i></button>
          <input class="plh3" type="text" placeholder="Search..." name="keyword">
        </form>
      </div>
    </div>
    
    <!-- 사이드 장바구니 -->
    <div class="wrap-header-cart js-panel-cart">
      <div class="s-full js-hide-cart"></div>
      <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
          <span class="mtext-103 cl2"> 장바구니 </span>
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart"><i class="zmdi zmdi-close"></i></div>
        </div>
  
        <div class="header-cart-content flex-w js-pscroll">
          <ul class="header-cart-wrapitem w-full">
            <!-- 장바구니 출력 -->
            <li class="header-cart-item flex-w flex-t m-b-12" v-for="cart in cartList">
              <div class="header-cart-item-img">
                <img :src="cart.gimage" alt="IMG">
              </div>
              <div class="header-cart-item-txt">
                <a :href="'../goods/detail.do?gid=' + cart.gid" class="header-cart-item-name m-b-10 hov-cl1 trans-04">{{cart.gname}}</a>
                <span class="header-cart-item-info">{{cart.gquantity}} x {{(cart.gprice - (cart.gprice * cart.gsale / 100)) * cart.gquantity | currency}} 원</span>
              </div>
            </li>
            <!-- -------- -->
          </ul>
          
          <div class="w-full">
            <div class="header-cart-price w-full p-b-10">합산 금액 : {{totalPrice() | currency}} 원</div>
            <div class="header-cart-price w-full p-b-10" v-if="cartList.length == 0">배송비 : 0 원</div>
            <div class="header-cart-price w-full p-b-10" v-if="cartList.length != 0">배송비 : 5,000 원</div>
            <div class="header-cart-total w-full p-b-40" v-if="cartList.length == 0">총 결제 금액 : 0 원</div>
            <div class="header-cart-total w-full p-b-40" v-if="cartList.length != 0">총 결제 금액 : {{totalPrice() + 5000 | currency}} 원</div>
            <div class="header-cart-buttons flex-w w-full">
              <a href="../cart/cart.do" class="flex-c-m w-full cl1 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">장바구니</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>

  <script>
    new Vue({
        el:'header',
        data:{
            categories1: [],
            categories2: [],
            cart: 0,
            cartList: [],
            total: 0
        },
        filters:{
            currency: function(value){
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted:function(){
            this.cate1();
            this.cate2();
            this.countCart();
        },
        methods:{
            cate1:function(){
                axios.get("http://localhost:8080/web/main/category_1_vue.do",{
                    params:{
                    }
                }).then(result=>{
                    this.categories1=result.data;
                })
            },
            cate2:function(){
                axios.get("http://localhost:8080/web/main/category_2_vue.do",{
                    params:{
                    }
                }).then(result=>{
                    this.categories2=result.data;
                })
            },
            countCart:function(){
                axios.get("http://localhost:8080/web/cart/count_cart_vue.do",{
                    params:{
                    }
                }).then(result=>{
                    this.cart = result.data.count;
                })
            },
            cList:function(){
                axios.get("http://localhost:8080/web/cart/cart_list_vue.do",{
                    params:{
                    }
                }).then(result=>{
                    console.log(result.data)
                    this.cartList = result.data;
                    this.total = result.data[0].sum;
                })
            },
            totalPrice:function(){
                let totalsum = 0;
                this.cartList.forEach((i,index)=>{totalsum += (i.gprice - (i.gprice * i.gsale / 100)) * i.gquantity })
                return totalsum;
            },
        }
    })
  </script>
  <script src="../vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
  <!-- 모바일 버전 스크롤바 -->
  <script>
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