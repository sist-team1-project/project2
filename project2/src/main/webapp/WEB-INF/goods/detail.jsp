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
            <!--수량 및 장바구니-->
            <div class="p-t-20">
              <c:if test="${sessionScope.id!=null }">
                <div class="flex-w flex-c-m p-b-10">
                  <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                    <div @click="qDown()" class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                    <input v-model="quantity" class="mtext-104 cl3 text-center num-product" type="number" name="num-product">
                    <div @click="qUp()" class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                  </div>
                  <button @click="insertCart()" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-10 trans-04 js-addcart-detail">장바구니</button>
                   <a v-if="goods.lid==0" href="#" class="fs-20 cl3 hov-cl1 trans-04 lh-10 p-lr-15 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="like(goods.gid); alert('즐겨찾기에 등록되었습니다')"><i class="zmdi zmdi-favorite-outline"></i></a>
                   <a v-if="goods.lid>0" href="#" class="fs-20 cl3 hov-cl1 trans-04 lh-10 p-lr-15 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="unlike(goods.lid); goods.lid=0; alert('즐겨찾기가 해제되었습니다')"><i class="zmdi zmdi-favorite"></i></a>
                </div>  
              </c:if>
              <c:if test="${sessionScope.id==null }">
                <div class="flex-w flex-c-m p-b-10">
                  <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                    <div @click="qDown()" class="btn-num-product-down cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-minus"></i></div>
                    <input v-model="quantity" class="mtext-104 cl3 text-center num-product" type="number" name="num-product">
                    <div @click="qUp()" class="btn-num-product-up cl8 hov-btn1 trans-04 flex-c-m"><i class="fs-16 zmdi zmdi-plus"></i></div>
                  </div>
                  <button @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'" class="stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-10 trans-04 js-addcart-detail">장바구니</button>
                  <a href="#" class="fs-20 cl3 hov-cl1 trans-04 lh-10 p-lr-15 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'"><i class="zmdi zmdi-favorite-outline"></i></a>
                </div>  
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="bor10 p-t-43 p-b-40">
      <div class="flex-c-m"><h4>상품 상세</h4></div>
      <div class="how-pos2 p-lr-15-md flex-c-m flex-column">
        <img onerror="this.src='../images/image_ready.jpg'" v-for="d in details" :src="d" class="dis-block">
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