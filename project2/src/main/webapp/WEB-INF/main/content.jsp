<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="http://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
  <!-- 슬라이더 -->
  <section class="section-slide">
    <div class="wrap-slick1">
      <div class="slick1">
        <div class="item-slick1" style="background-image: url(../images/slide-01.jpg);">
          <div class="container h-full">
            <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
              <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                <span class="ltext-101 text-white respon2">Healing Camp</span></div>
              <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                <h2 class="ltext-201 text-white p-t-19 p-b-43 respon1">2022년 신상 모음</h2>
              </div>
              <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                <a href="product.html" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">상품 보러가기</a>
              </div>
            </div>
          </div>
        </div>
        <div class="item-slick1" style="background-image: url(../images/slide-02.jpg);">
          <div class="container h-full">
            <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
              <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                <span class="ltext-101 text-black respon2">Healing Camp</span></div>
              <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                <h2 class="ltext-201 text-black p-t-19 p-b-43 respon1">텐트 모음</h2>
              </div>
              <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                <a href="product.html" class="flex-c-m stext-101 cl1 size-101 bg3 bor1 hov-btn3 p-lr-15 trans-04">상품 보러가기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  
  <div class="sec-banner bg0 p-t-80 p-b-50">
    <div id="event" class="container">
      <!-- 배너 -->
      <section>
        <div class="row">
          <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
            <!-- 배너 1 -->
            <div class="block1 wrap-pic-w">
              <img src="../images/banner-01.jpg">
              <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                <div class="block1-txt-child1 flex-col-l">
                  <span class="block1-name ltext-102 trans-04 p-b-8">텐트 </span>
                  <span class="block1-info stext-102 trans-04">인기 제품 </span>
                </div>
  
                <div class="block1-txt-child2 p-b-4 trans-05">
                  <div class="block1-link stext-101 cl0 trans-09">구경하기</div>
                </div>
              </a>
            </div>
          </div>
          
          
          <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
            <!-- 배너 2 -->
            <div class="block1 wrap-pic-w">
              <img src="../images/banner-02.jpg">
              <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                <div class="block1-txt-child1 flex-col-l">
                  <span class="block1-name ltext-102 trans-04 p-b-8">타프 </span>
                  <span class="block1-info stext-102 trans-04">인기 제품 </span>
                </div>
  
                <div class="block1-txt-child2 p-b-4 trans-05">
                  <div class="block1-link stext-101 cl0 trans-09">구경하기</div>
                </div>
              </a>
            </div>
          </div>
  
          <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
            <!-- 배너 3 -->
            <div class="block1 wrap-pic-w">
              <img src="../images/banner-03.jpg">
              <a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
                <div class="block1-txt-child1 flex-col-l">
                  <span class="block1-name ltext-102 trans-04 p-b-8">그릴 </span>
                  <span class="block1-info stext-102 trans-04">인기 제품 </span>
                </div>
  
                <div class="block1-txt-child2 p-b-4 trans-05">
                  <div class="block1-link stext-101 cl0 trans-09">구경하기</div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </section>
      
      <!-- 상품 -->
      <section>
        <div class="bg0 p-t-23 p-b-140">
          <div class="p-tb-20"><h3 class="ltext-103 cl5">Product Overview</h3></div>
          <div class="p-t-40 p-b-10"><h4>인기 상품</h4></div>
          <div class="row">
            <!-- 아이템 루프로 돌리기 -->
            <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 women" v-for="vo in goods">
              <div class="block2">
                <div class="block2-pic hov-img0"><img :src="vo.image"></div>
    
                <div class="block2-txt flex-w flex-t p-t-14">
                  <div class="block2-txt-child1 flex-col-l ">
                    <a href="../goods/detail.do" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
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
          
          <div class="p-t-40 p-b-10"><h4>추천 상품</h4></div>
          <div class="row">
            <!-- 아이템 루프로 돌리기 -->
            <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 women" v-for="vo in goods">
              <div class="block2">
                <div class="block2-pic hov-img0"><img :src="vo.image"></div>
    
                <div class="block2-txt flex-w flex-t p-t-14">
                  <div class="block2-txt-child1 flex-col-l ">
                    <a href="../goods/detail.do" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{vo.name}}</a>
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
          
        </div>
      </section>
    </div>
  </div>
  <script>
    new Vue({
        el:'#event',
        data:{
            goods:[]
        },
        mounted:function(){
            axios.get("http://localhost:8080/web/main/events.do",{
                
            }).then(result=>{
                this.goods=result.data;
            })
        }
    })
  </script>



</body>
</html>