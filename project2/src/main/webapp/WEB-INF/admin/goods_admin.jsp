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
				<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail fs-10" @click="reset">초기화</button>
			</div>
		</div>
		<!-- ------ 검색 순서 ------ -->
		<div id="order" class="m-tb-10 cl2 p-tb-10">
			<button class="cl2" :class="{'activeFilter':order=='A'}" value="A" @click="searchByOrder($event)">신상품 순</button>
			&nbsp;&nbsp;| &nbsp;&nbsp;
			<button class="cl2" :class="{'activeFilter':order=='B'}" value="B" @click="searchByOrder($event)">오래된 순</button>
		</div>
		<!-- --------------------- -->
		<!-- ------ 상품 상태 ------ -->
		<div id="order" class="m-tb-10 cl2 p-tb-10">
			<button class="cl2" :class="{'activeFilter':status=='1'}" value="1" @click="searchByStatus($event)">판매 중</button>
			&nbsp;&nbsp;| &nbsp;&nbsp;
			<button class="cl2" :class="{'activeFilter':status=='0'}" value="0" @click="searchByStatus($event)">판매 중단</button>
		</div>
		<!-- --------------------- -->
		<div class="row p-t-10">
			<div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
				<div class="fs-13">총 {{count | currency}} 개</div>
				<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04  fs-10" onclick="location.href='../admin/goods_add.do'">상품 등록</button>
			</div>
			<div class="col-lg-12 m-lr-auto m-b-50">
				<div class="wrap-table js-pscroll">

					<table class="table-checkout-admin">
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
							<tr v-for="(goods, index) in goodsList" class="table_row_admin fs-13 font-center p-t-20-admin-td p-b-20">
								<td>
									<div>
										<img :src="goods.g_image" onerror="this.src='../images/image_ready.jpg'" class="size-109">
									</div>
								</td>
								<td>{{goods.g_id}}</td>
								<td>{{goods.c_title}}</td>
								<td>
									<a :href="'../goods/detail.do?gid=' + goods.g_id">{{goods.g_name}}</a>
								</td>
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
									<a :href="'../admin/goods_update.do?g_id='+goods.g_id" value="{{goods.g_id}}">
										<button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04  fs-10">수정</button>
									</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
	<!-- ------ 페이징  ----- --->
			<div class="text-center">
				<ul class="pagination">
					<li class="page-item" v-bind:class="{'disabled':startPage==1}">
						<button class="page-link" :value="startPage-1" v-on:click="paging($event)">
							<i class="fa fa-chevron-left" aria-hidden="true"></i>
						</button>
					</li>
					<li class="page-item" v-for="i in pages" v-bind:class="{'active':i==curpage}">
						<button class="page-link" :value="i" v-on:click="paging($event)">{{i}}</button>
					</li>
					<li class="page-item" v-bind:class="{'disabled':endPage==totalpage}">
						<button class="page-link" :value="endPage+1" v-on:click="paging($event)">
							<i class="fa fa-chevron-right" aria-hidden="true"></i>
						</button>
					</li>
				</ul>
			</div>

		</div>

		<!-- 사이드 Detail -->
		<div class="wrap-header-admin js-panel-admin">
			<div class="s-full" @click="goods_detail_close"></div>
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
								<img v-for="d in gdetail" :src="d" onerror="this.src='../images/image_ready.jpg'">
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>
    new Vue({
        el: '#adminGoods', // 제어하는 영역 
        data: {
            ss: '',
            goodsList: [],
            curpage: 1,
            totalpage: 0,
            startPage: 0,
            endPage: 0,
            gdetail: [],
            pages: [],
            gdetail: [],
            count: 0,
            g_id: 0,
            selected: '',
            fs: ["N", "S", "C", "D"],
            ss: '',
            order: 'A',
            status: 1
        },
        filters: {
            currency: function(value) {
                var num = new Number(value);
                return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
            }
        },
        mounted: function() {
            this.dataSend();
        },
        methods: {
            dataSend: function() {
                axios.get("http://localhost:8080/web/admin/adlist_vue.do", {
                    params: {
                        page: this.curpage,
                        fs: this.fs.join(","),
                        ss: this.ss,
                        order: this.order,
                        status: this.status
                    }
                }).then(res => {
                    this.goodsList = res.data;
                    this.curpage = res.data[0].curpage;
                    this.totalpage = res.data[0].totalpage;
                    this.startPage = res.data[0].startPage;
                    this.endPage = res.data[0].endPage;
                    this.count = res.data[0].count;
                    this.pages = [];
                    for (i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
                    console.log(res.data);
                })
            },
            paging: function(event) {
                this.curpage = event.currentTarget.value;
                this.dataSend();
            },
            gfind: function() {
                this.curpage = 1;
                if (!this.ss) {
                    this.$refs.goodsfind.focus();
                    return;
                }
                if (this.fs.length == 0) {
                    this.fs.push("N", "S", "C", "D");
                }
                this.dataSend();
            },
            /* 사이드 상세보기 오픈  */
            goods_detail: function(detailId) {
                this.gdetail = detailId.split(';');
                $('.js-panel-admin').addClass('show-header-admin');
            },
            /* 사이드 상세보기창 닫기 */
            goods_detail_close: function() {
                $('.js-panel-admin').removeClass('show-header-admin');
            },
            /* 검색 초기화 */
            reset: function() {
                this.ss = '';
                this.curpage = 1;
                this.dataSend();
            },
            /* 검색 순서 버튼 */
            searchByOrder:function(event) {
                this.curpage = 1; // 페이지 초기화
                this.order = event.currentTarget.value; // 누른 버튼의 값(원하는 순서)을 가지고옴
                this.dataSend();      // 목록 출력
            },
            /* 상태 버튼 */
            searchByStatus:function(event) {
                this.curpage = 1; // 페이지 초기화
                this.status = event.currentTarget.value; // 누른 버튼의 값(원하는 순서)을 가지고옴
                this.dataSend();      // 목록 출력
            }
        }
    })
    </script>
</body>
</html>