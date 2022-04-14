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
                <img onerror="this.src='../images/image_ready.jpg'" class="bor8" :src="image">
                <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" :href="image">
                  <i class="fa fa-expand"></i>
                </a>
              </div>
              <div id="thumbnails">
                <img onerror="this.src='../images/image_ready.jpg'" v-for="img in images" v-on:click="showImg(img)" class="w-30 bor8" :src="img">
              </div>
            </div>
            <!-- -------------- -->
          </div>  
        </div>
                  
        <div class="col-md-6 col-lg-5 p-b-30">
          <div class="p-r-50 p-t-5 p-lr-0-lg">
            <h4 class="cl2 js-name-detail p-b-14">{{goods.name}}</h4>
            <span class="fs-14 cl2 p-t-20 p-b-10 dis-block"><b>가격&emsp;</b>&emsp;{{goods.price|currency}}원<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>브랜드</b>&emsp;{{goods.brand }}<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>배송비</b>&emsp;5,000원<br></span>
            <span class="fs-14 cl2 p-tb-10 dis-block"><b>할인율</b>&emsp;{{goods.sale }} %</span>
            <!--  -->
            <div class="p-t-20">
              <c:if test="${sessionScope.id!=null }">
                <div class="flex-w flex-c-m p-b-10">
                  <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                    <div @click="qDown()" class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                    <input v-model="quantity" class="mtext-104 cl3 text-center num-product" type="number" name="num-product">
                    <div @click="qUp()" class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                  </div>
                  <button @click="insertCart()" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-10 trans-04 js-addcart-detail">장바구니</button>
                </div>  
              </c:if>
            </div>
            <!--  -->
            <div class="flex-w flex-c-m p-t-10">
              <div class="flex-m bor9 p-r-10 m-r-11">
              <c:if test="${sessionScope.id!=null }">
                <a v-if="goods.lid==0" href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="like(goods.gid); alert('즐겨찾기에 등록되었습니다')"><i class="zmdi zmdi-favorite-outline"></i></a>
                <a v-if="goods.lid>0" href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="unlike(goods.lid); goods.lid=0; alert('즐겨찾기가 해제되었습니다')"><i class="zmdi zmdi-favorite"></i></a>
              </c:if>
              <c:if test="${sessionScope.id==null }">
                <a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'"><i class="zmdi zmdi-favorite-outline"></i></a>
              </c:if>
              </div>
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
              <img onerror="this.src='../images/image_ready.jpg'" v-for="d in details" :src="d" class="dis-block">
            </div>
          </div>
          <!-- --------- -->
                    
          <!-- - -->
          <div class="tab-pane fade" id="reviews" role="tabpanel">
            <div class="row">
              <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                <div class="p-b-30 m-lr-15-sm">
                  <!-- 평점 -->
                  <div v-for="r in reviews" class="flex-w flex-t p-b-68">
                    <div class="size-207">
                      <div class="flex-w flex-sb-m p-b-17">
                        <span class="mtext-107 cl2 p-r-20"></span> <!-- 아이디 -->
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
            quantity:1,
            reviews:[],
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
    	    //this.replyList();
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
        	        if (res.data == "ADD") {
        	            alert("장바구니에 추가되었습니다");        	            
        	        } else if (res.data == "UPDATE") {
        	            alert("장바구니가 업데이트되었습니다.")
        	        }
        	    })
            },
            qUp:function(){
                this.quantity=this.quantity+1;
            },
            qDown:function(){
            	if(this.quantity>1){
            		this.quantity=this.quantity-1;
            	}
            },
            replyList:function(){
                axios.get('http://localhost:8080/web/goods/review_vue.do',{
                    params:{
                        g_id:this.gid,
                        page: this.curpage
                    }
                }).then(res=>{
                    this.reviews = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.start = res.data[0].start;
                    this.end = res.data[0].end;
                })
            },
            like:function(gid) { // 좋아요
                axios.post("http://localhost:8080/web/goods/like_insert_ok.do",null,{
                    params:{gid: gid}
                }).then(result=>{
                    this.goods.lid = result.data.lid;
                })
            },
            unlike:function(lid) { // 싫어요
                axios.post("http://localhost:8080/web/goods/like_delete_ok.do",null,{params:{lid: lid}})
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