<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
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
                <h2 class="ltext-201 text-white p-t-19 p-b-43 respon1">2022년 제품 모음</h2>
              </div>
              <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                <a href="../goods/list.do" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">상품 보러가기</a>
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
                <a href="../goods/list.do?cid=001" class="flex-c-m stext-101 cl1 size-101 bg3 bor1 hov-btn3 p-lr-15 trans-04">상품 보러가기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  
  <div id="event" class="sec-banner bg0 p-t-80 p-b-50">
    <div class="container">
      <!-- 배너 -->
      <section>
        <div class="row">
          <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
            <!-- 배너 1 -->
            <div class="block1 wrap-pic-w">
              <img src="../images/banner-01.jpg">
              <a href="../goods/list.do?cid=001" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
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
              <a href="../goods/list.do?cid=002" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
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
              <a href="../goods/list.do?cid=008" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
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
      
      <!-- 이벤트 타이틀 -->
      <section>
        <div class="bg0 p-t-23 p-b-30">
          <div class="p-tb-20"><h3 class="ltext-103 cl5">Product Overview</h3></div>
          <div v-for="e in events">
            <div class="p-t-40 p-b-10"><h4><i class="fa fa-rocket" aria-hidden="true"></i>&nbsp; {{e.title}}</h4></div>
            <div class="row">
              <!--    상 품    -->
              <div v-for="(eg,index) in event_goods" v-if="eg.eid == e.eid" class="col-sm-6 col-md-4 col-lg-3 p-b-35">
                <div class="block2">
                  <div class="block2-pic hov-img0"><a :href="'../goods/detail.do?gid=' + eg.gid"><img onerror="this.src='../images/image_ready.jpg'" :src="eg.image"></a></div>
                  <div class="block2-txt flex-w flex-t p-t-14">
                    
                    <div class="block2-txt-child1 flex-col-l short">
                      <a :href="'../goods/detail.do?gid=' + eg.gid" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">{{eg.name}}</a>
                      <div class="cl4">{{eg.price | currency}} 원</div>
                    </div>
                  
                    <div class="block2-txt-child2 flex-r">
                      <span class="btn-addwish-b2 dis-block pos-relative">
                        <c:if test="${sessionScope.id!=null }">
                          <img v-if="eg.lid==0" class="icon-heart1 trans-04 pointer" src="../images/icons/icon-heart-01.png" @click="like(eg.gid,index); alert('즐겨찾기에 등록되었습니다')">
                          <img v-if="eg.lid>0" class="icon-heart2 trans-04 pointer" src="../images/icons/icon-heart-02.png" @click="unlike(eg.lid); eg.lid=0; alert('즐겨찾기가 해제되었습니다')">
                        </c:if>
                        <c:if test="${sessionScope.id==null }">
                          <img class="icon-heart1 trans-04 pointer" src="../images/icons/icon-heart-01.png" @click="if(confirm('로그인창으로 이동하시겠습니까?')) return location.href='../user/login.do'">
                        </c:if>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- -------- -->
            </div>
          </div>
        </div>
      </section>
      <!-- -------- -->
      <c:if test="${sessionScope.id!=null }">
        <section>
          <div class="p-t-23 p-b-140">
            <div class="row">
              <div class="col-md-12 p-tb-30"><h4>${sessionScope.id } 님 근처의 추천 캠핑장</h4></div>
              <div class="col-md-3" v-for="(c,index) in campingList">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-text">{{c.title}}</h4>
                    <p class="card-text">{{c.address}}</p>
                    <div><button type="button" class="bg3 cl1 bor20 hov-btn1 p-tb-10 size-115 p-lr-15 dis-inline-block" data-toggle="modal" data-target="#iframeModal" @click="open(c.address,c.title,event)">지도 보기</button></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </c:if>
    </div>
    
    <div id="iframeModal" class="modal fade" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="iframeModalLable" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true" @click="close">&times;</button>
            <div>
              <iframe ref="iframe" width="480px" height="300px" :src="iframe"></iframe>
            </div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
  
  <script>
    new Vue({
        el:'#event',
        data:{
            events:[],
            event_goods:[],
            campingList:[],
            iframe: ''
        },
        filters:{ // 금액 3자리 수 마다 따옴표 필터
            currency: function(value){
                let num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted:function(){ // 이벤트 상품 정보를 가져옴
            axios.get("http://localhost:8080/web/main/event_list.do",{
                
            }).then(result=>{
                this.events=result.data[0];
                this.event_goods=result.data[1];
                this.getCampingList();
            })
        },
        methods:{
            like:function(gid, index) { // 좋아요
                axios.post("http://localhost:8080/web/goods/like_insert_ok.do",null,{
                    params:{gid: gid}
                }).then(result=>{
                    this.event_goods[index].lid = result.data.lid;
                })
            },
            unlike:function(lid) { // 싫어요
                axios.post("http://localhost:8080/web/goods/like_delete_ok.do",null,{params:{lid: lid}})
            }, 
            getCampingList:function() {
                axios.get("http://localhost:8080/web/main/camping_list.do",{}).then(result=>{
                    this.campingList = result.data
                })
            },
            open:function(address, title, $event) {
                this.iframe = "../main/map.do?address=" + address + "&title=" + title;
                console.log(this.iframe)
            },
            close:function() {
                this.iframe = '';
            }
        }
    })
  </script>

</body>
</html>