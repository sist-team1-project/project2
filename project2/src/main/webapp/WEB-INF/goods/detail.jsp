<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/detail.css">
</head>
<body>
  <div class="container" id="goodsDetail">
    <section class="sec-product-detail bg0 p-t-150 p-b-30">
      <div class="row">
        <div class="col-md-6 col-lg-7 p-b-30">
          <div class="p-l-25 p-r-30 p-lr-0-lg">
            <!-- ----------- 갤러리 ------------ -->
            <div class="gallery-lb">
              <div id="img-area" class="wrap-pic-w pos-relative">
                <img class="bor8" :src="image">
                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" :href="image">
                    <i class="fa fa-expand"></i>
                </a>
              </div>
              <div id="thumbnails">
                <img v-for="img in images" v-on:click="showImg(img)" class="w-30 bor8" :src="img">
              </div>
            </div>
            <!-- -------------- -->
          </div>  
        </div>
                  
        <div class="col-md-6 col-lg-5 p-b-30">
          <div class="p-r-50 p-t-5 p-lr-0-lg">
            <h4 class="cl2 js-name-detail p-b-14">{{goods.name}}</h4>
            <span class="fs-14 cl2 p-t-20 p-b-10 dis-block"><b>가격</b>&emsp;{{goods.price }}<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>브랜드</b>&emsp;{{goods.brand }}<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>배송비</b>&emsp;5,000원<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>할인율</b>&emsp;{{goods.sale }}</span>
            <!--  -->
            <div class="p-t-20">
              <c:if test="${sessionScope.grade=='1' }">
                <div class="flex-w flex-c-m p-b-10">
                  <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                    <div v-on:click="qDown()" class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                    <input v-model="quantity" class="mtext-104 cl3 text-center num-product" type="number" name="num-product">
                    <div v-on:click="qUp()" class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                  </div>
                  <button v-on:click="insertCart()" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-10 trans-04 js-addcart-detail">장바구니</button>
                </div>  
              </c:if>
            </div>
            <!--  -->
            <div class="flex-w flex-c-m p-t-10">
              <div class="flex-m bor9 p-r-10 m-r-11">
                <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist"><i class="zmdi zmdi-favorite"></i></a>
              </div>
              <a href="https://www.facebook.com/" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook"><i class="fa fa-facebook"></i></a>
              <a href="https://www.twitter.com/" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter"><i class="fa fa-twitter"></i></a>
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
            <div class="how-pos2 p-lr-15-md flex-c-m flex-column">
              <img v-for="d in details" :src="d" class="dis-block">
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

  <script>
    new Vue({
        el:'#goodsDetail',
        data:{
            gid:${gid},
            goods:{},
            images:[],
            image:'',
            details:[],
            quantity:1
        },
        mounted:function(){
    	   	axios.get('http://localhost:8080/web/goods/detail_vue.do',{
    	  		params:{
    	   		    gid:this.gid
    	   		}
    	    }).then(res=>{
    	   		this.goods=res.data;
    	   		this.images=this.goods.image.split(";");
    	   		this.details=this.goods.detail.split(";");
    	   		this.image=this.images[0];
    	    })
        },
        methods: {
            showImg:function(link){
                this.image=link;
            },
            insertCart:function(){
            	axios.post('http://localhost:8080/web/cart/insert_ok.do',null,{
        	  		params:{
        	   		    g_id:this.gid,
        	   		    g_quantity:this.quantity
        	   		}
        	    }).then(res=>{
        	   		alert("장바구니에 저장 되었습니다.")
        	    })
            },
            qUp:function(){
            	if(this.quantity<this.goods.stock){
            		this.quantity=this.quantity+1;
            	}
            	else{
            		alert("최대 재고는 " + this.goods.stock + "개 입니다.")
            	}
            		
            },
            qDown:function(){
            	if(this.quantity>1){
            		this.quantity=this.quantity-1;
            	}
            }
        }
        
    })
    
    
   <!-- 사진 크게보여주는 팝업 -->
    $('.gallery-lb').each(function() {
        $(this).magnificPopup({
            delegate: 'a',
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