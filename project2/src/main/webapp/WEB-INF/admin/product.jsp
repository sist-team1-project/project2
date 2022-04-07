<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->

	<div class="container bg0 p-t-70 p-b-10" id="adminGoods">
		<div class="row">
			<div class="col-lg-12 m-lr-auto">
				<div class="p-b-20">
					<h3>상품 목록</h3>
				</div>
			</div>
			<div class="col-lg-12 flex-m">

				<input type="checkbox" v-model="fs" value="N">
				&nbsp; 상품번호&nbsp; &nbsp;
				<input type="checkbox" v-model="fs" value="S">
				&nbsp; 카테고리&nbsp; &nbsp;
				<input type="checkbox" v-model="fs" value="C">
				&nbsp; 제품명&nbsp; &nbsp;
				<input type="checkbox" v-model="fs" value="D">
				&nbsp; 브랜드&nbsp; &nbsp;
				<input type=text size=15 @keyup.enter="gfind()" class="input-sm wrap-search-admin" v-model="ss" ref="goodsfind">
				&nbsp; &nbsp;
				<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail fs-10" v-on:click="gfind()">검색</button>
				&nbsp; &nbsp;
				<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail fs-10" onclick="location.href='../admin/adlist.do'">초기화</button>
				
			</div>
		</div>
		<div class="row p-t-10">
			<div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
				<div class="fs-13">
					총
					{{count | currency}}
					개
				</div>
				<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04  fs-10" onclick="location.href='../admin/goods_add.do'">상품 등록</button>
			</div>
			<div class="col-lg-12 m-lr-auto m-b-50">
				<div class="wrap-table js-pscroll">

					<table class="table-checkout">
						<thead>
							<tr class="table_head font-center">
								<th></th>
								<th>상품번호</th>
								<th>카테고리</th>
								<th>제품명</th>
								<th>브랜드</th>
								<th>가격</th>
								<th>할인율</th>
								<th>재고</th>
								<th>판매량</th>
								<th>판매상태</th>
								<th>제품 등록일</th>
								<th>상세</th>
								<th></th>
							</tr>
						</thead>
						<tbody>

							<tr v-for="(goods, index) in goodsList" class="table_row fs-13 font-center p-t-20-admin-td">
								<td>
									<div>
										<img :src="goods.g_image" class="size-109">
									</div>
								</td>
								<td>{{goods.g_id}}</td>
								<td>{{goods.c_id}}</td>
								<td>{{goods.g_name}}</td>
								<td>{{goods.g_brand}}</td>
								<td>{{goods.g_price | currency}}</td>
								<td>{{goods.g_sale }}</td>
								<td>{{goods.g_stock }}</td>
								<td>{{goods.g_sold }}</td>
								<td>{{goods.g_status }}</td>
								<td>{{goods.g_regdate }}</td>
								<td>
									<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 ">
										<i class="fa fa-search" v-on:click="goods_detail(goods.g_detail)" aria-hidden="true"></i>
									</div>
								</td>
								<td>
									<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04  fs-10" :index="index" v-on:click="goods_update($event)">수정</button>
								</td>
							</tr>

						</tbody>

					</table>
				</div>
			</div>
		</div>
		<div>


			<div class="text-center">
				<ul class="pagination">
					<li class="page-item" v-bind:class="{'disabled':startPage==1}"><button class="page-link" :value="startPage-1" v-on:click="prev($event)">
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
						</button></li>
					<li class="page-item" v-for="i in pages" v-bind:class="{'active':i==curpage}"><button class="page-link" :value="i" v-on:click="getpage($event)">{{i}}</button></li>
					<li class="page-item" v-bind:class="{'disabled':endPage==totalpage}"><button class="page-link" :value="endPage+1" v-on:click="next($event)">
							<i class="fa fa-chevron-right" aria-hidden="true"></i>
						</button></li>
				</ul>
			</div>



		</div>

		<!-- 사이드 Detail -->

		<div class="wrap-header-admin js-panel-admin">
			<div class="s-full" v-on:click="goods_detail_close"></div>
			<div class="header-admin flex-col-l p-l-65 p-r-25">
				<div class="header-admin-title flex-w flex-sb-m p-b-8">
					<span class="mtext-103 cl2"> Detail </span>
					<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04">
						<i class="zmdi zmdi-close" v-on:click="goods_detail_close"></i>
					</div>
				</div>
				<div class="header-admin-content flex-w js-pscroll">
					<ul class="header-admin-wrapitem w-2full">
						<li class="header-admin-item flex-w flex-t m-b-12">
							<div class="header-admin-item-img">
								<img :src="gdetail" alt="IMG">
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>

	</div>


	<script>
			new Vue({
				el : '#adminGoods', // 제어하는 영역 
				data : {
					ss : '',
					goodsList : [],
					curpage : 1,
					totalpage : 0,
					startPage : 0,
					endPage : 0,
					gdetail : '',
					pages : [],
					count : 0,
					g_id : 0,
					 
					selected : '',
    			   	fs : ["N","S","C","D"],
    			   	ss : ''
				},
				filters:{
					currency: function(value){
						var num = new Number(value);
						return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
					}
				},
				mounted : function() {
					this.dataSend();
				},
				methods : {
					dataSend:function(){
						if (!this.ss) {
							console.log("ss null :  " + this.ss)
						}
						
						axios.get("http://localhost:8080/web/admin/adlist_vue.do", {
							params : {
									page : this.curpage,
									fs : this.fs.join(","),
									ss : this.ss
							}
						}).then(res => {
							this.goodsList = res.data;
							console.log(this.goodsList);
							this.curpage = res.data[0].curpage;
							this.totalpage = res.data[0].totalpage;
							this.gdetail = res.data[0].g_detail;
							this.startPage = res.data[0].startPage;
							this.endPage = res.data[0].endPage;
							this.count = res.data[0].count;
							
							this.pages=[];
              for(i = this.startPage; i <= this.endPage; i++) {
                  this.pages.push(i);
              }
						})
					},
					prev:function(event){
		    			this.curpage = event.currentTarget.getAttribute('value');
		    			this.dataSend();
    		    	},
    	    		next:function(event){
    	    				this.curpage = event.currentTarget.getAttribute('value');
    	    				this.dataSend();
    	    		},
    	    		getpage : function(event){
    	    				this.curpage = event.currentTarget.getAttribute('value');
    	    				this.dataSend();
    	    		},
					gfind : function() {	
						console.log("검색버튼이다")
						if (!this.ss) {
							console.log("ss null")
							this.$refs.goodsfind.focus();
							return;
						}
						if (this.fs.length == 0) {
							console.log("fs null")
							this.fs.push("N", "S", "C", "D");
							console.log(this.fs)
						}
						this.dataSend();				
					},
					goods_update : function() {
						console.log("상품 수정");
						var index = event.currentTarget.getAttribute('index');
						this.g_id = this.goodsList[index].g_id;
						console.log(this.g_id);
						
						location.href = '../admin/goods_update.do?g_id=' + this.g_id;
					},
					goods_detail : function(detailId) {
						this.gdetail = detailId;
						$('.js-panel-admin').addClass('show-header-admin');
					},
					goods_detail_close : function(){
						$('.js-panel-admin').removeClass('show-header-admin');
					}
				}
			})
		</script>
</body>
</html>