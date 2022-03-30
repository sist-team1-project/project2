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
  <div class="container">
    <section class="sec-product-detail bg0 p-t-150 p-b-30">
      <div class="row">
        <div class="col-md-6 col-lg-7 p-b-30">
          <div class="p-l-25 p-r-30 p-lr-0-lg">
            <!-- 지금은 slick slider를 사용했지만 선생님이 보여주신 예제를 이용해서 Vue로 한번 시도해보세요 -->
            <!-- 참고: Chapter352_RestProject1(Front-End) -->
            <div class="wrap-slick3 flex-sb flex-w">
              <div class="wrap-slick3-dots"></div>
              <div class="wrap-slick3-arrows flex-sb-m flex-w"></div>
              <!-- ----------- 갤러리 ------------ -->
              <div class="slick3 gallery-lb">
                <!-- 사진1 -->
                <div class="item-slick3" data-thumb="../images/product-detail-01.jpg">
                  <div class="wrap-pic-w pos-relative">
                    <img src="../images/product-detail-01.jpg" alt="IMG-PRODUCT">
                    <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../images/product-detail-01.jpg">
                      <i class="fa fa-expand"></i>
                    </a>
                  </div>
                </div>
                <!-- -------------- -->
                <!-- 사진2 -->
                <div class="item-slick3" data-thumb="../images/product-detail-02.jpg">
                  <div class="wrap-pic-w pos-relative">
                    <img src="../images/product-detail-02.jpg" alt="IMG-PRODUCT">
                    <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="../images/product-detail-02.jpg">
                      <i class="fa fa-expand"></i>
                    </a>
                  </div>
                </div>
                <!-- -------------- -->
              </div>
              <!-- -------------- -->
            </div>
            <!-- ------------------------------------- -->
          </div>
        </div>
                  
        <div class="col-md-6 col-lg-5 p-b-30">
          <div class="p-r-50 p-t-5 p-lr-0-lg">
            <h4 class="mtext-105 cl2 js-name-detail p-b-14">상품이름</h4>
            <span class="mtext-106 cl2">$58.79</span>
            <!--  -->
            <div class="p-t-33">
              <div class="flex-w flex-r-m p-b-10">
                <div class="size-204 flex-w flex-m respon6-next">
                  <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                    <div class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                    <input class="mtext-104 cl3 text-center num-product" type="number" name="num-product" value="1">
                    <div class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                  </div>
                  <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">장바구니</button>
                </div>
              </div>  
            </div>
            <!--  -->
            <div class="flex-w flex-m p-l-100 p-t-40 respon7">
              <div class="flex-m bor9 p-r-10 m-r-11">
                <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist"><i class="zmdi zmdi-favorite"></i></a>
              </div>
              <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter"><i class="fa fa-twitter"></i></a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="bor10 p-t-43 p-b-40">
      <!-- 탭 -->
      <div class="tab01">
        <!-- 탭 네비게이션 -->
        <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item p-b-10">
            <a class="nav-link active" data-toggle="tab" href="#description" role="tab">설명</a>
          </li>
          <li class="nav-item p-b-10">
            <a class="nav-link" data-toggle="tab" href="#reviews" role="tab">리뷰 (1)</a>
          </li>
        </ul>
        <!-- --------- -->
        
        <!-- 탭 패널 -->
        <div class="tab-content p-t-43">
          <!-- 설명 -->
          <div class="tab-pane fade show active" id="description" role="tabpanel">
            <div class="how-pos2 p-lr-15-md">
              <p class="stext-102 cl6">
              Aenean sit amet gravida nisi. Nam fermentum est felis, quis feugiat nunc fringilla sit amet. Ut in blandit ipsum. Quisque luctus dui at ante aliquet, in hendrerit lectus interdum. Morbi elementum sapien rhoncus pretium maximus. Nulla lectus enim, cursus et elementum sed, sodales vitae eros. Ut ex quam, porta consequat interdum in, faucibus eu velit. Quisque rhoncus ex ac libero varius molestie. Aenean tempor sit amet orci nec iaculis. Cras sit amet nulla libero. Curabitur dignissim, nunc nec laoreet consequat, purus nunc porta lacus, vel efficitur tellus augue in ipsum. Cras in arcu sed metus rutrum iaculis. Nulla non tempor erat. Duis in egestas nunc.
              </p>
            </div>
          </div>
          <!-- --------- -->
                    
          <!-- - -->
          <div class="tab-pane fade" id="reviews" role="tabpanel">
            <div class="row">
              <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                <div class="p-b-30 m-lr-15-sm">
                  <!-- 평점 -->
                  <div class="flex-w flex-t p-b-68">
                    <div class="size-207">
                      <div class="flex-w flex-sb-m p-b-17">
                        <span class="mtext-107 cl2 p-r-20">Ariana Grande</span> <!-- 아이디 -->
                        <span class="fs-18 cl11"> <!-- 평점 -->
                          <i class="zmdi zmdi-star"></i>
                          <i class="zmdi zmdi-star"></i>
                          <i class="zmdi zmdi-star"></i>
                          <i class="zmdi zmdi-star"></i>
                          <i class="zmdi zmdi-star-half"></i>
                        </span>
                      </div>
                      <p class="stext-102 cl6">Quod autem in homine praestantissimum atque optimum est, id deseruit. Apud ceteros autem philosophos</p>
                    </div>
                  </div>
                  <!-- 리뷰 작성 -->
                  <form class="w-full">
                    <h5 class="mtext-108 cl2 p-b-7">리뷰 작성</h5>
                    <p class="stext-102 cl6">Your email address will not be published. Required fields are marked *</p>
                    <div class="flex-w flex-m p-t-50 p-b-23">
                      <span class="stext-102 cl3 m-r-16">Your Rating</span>
                      <span class="wrap-rating fs-18 cl11 pointer">
                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                        <i class="item-rating pointer zmdi zmdi-star-outline"></i>
                        <input class="dis-none" type="number" name="rating">
                      </span>
                    </div>
                    <div class="row p-b-25">
                      <div class="col-12 p-b-5">
                        <label class="stext-102 cl3" for="review">Your review</label>
                        <textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="review" name="review"></textarea>
                      </div>
                    </div>
                    <button class="flex-c-m stext-101 cl0 size-112 bg1 bor11 hov-btn1 p-lr-15 trans-04 m-b-10">작성</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 탭 패널 끝 -->
        
      </div>
    </section>
  </div>
  <!-- 사진 크게보여주는 팝업 -->
  <script>
/* 
    new Vue({
    	el:'.container',
    	data:{
    		goods:[]
    	},
    	mounted:function(){
    	    axios.get("http://localhost:8080/web/goods/detail_vue.do",{
        		params:{
        		    gid: this.gid
        		}
    	    }).then(function(res){
                this.goods = res.data;
            })
    	}
    })
     */
    $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled:true
            },
            mainClass: 'mfp-fade'
        });
    });
  </script>

</body>
</html>