<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin/goods.css">
</head>
<body>
	<div class="container p-b-10" id="adminGoods">
		<div class="row">
			<div class="col-lg-12 m-lr-auto p-b-10">
				<h3><i class="fa fa-file-text" aria-hidden="true"></i>&nbsp; 상품 목록</h3>
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
				<input type=text @keyup.enter="gfind()" class="text-111 bor8 bg0 cl8 size-127 p-lr-10" v-model="ss" ref="goodsfind">
				&nbsp; &nbsp;
				<button class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 size-126" v-on:click="gfind()">검색</button>
				&nbsp;
				<button class="flex-c-m cl0 btn-sm btn-pro-color2 bor2 hov-btn3 p-lr-15 size-126" @click="reset">초기화</button>
			</div>
		</div>
		<!-- ------ 검색 순서 ------ -->
		<div class="p-t-10 p-b-5 fs-13">
			<button class="p-r-5 cl3" :class="{'activeFilter':order=='A'}" value="A" @click="searchByOrder($event)">신상품 순</button>|
			<button class="p-lr-5 cl3" :class="{'activeFilter':order=='B'}" value="B" @click="searchByOrder($event)">오래된 순</button>
		</div>
		<!-- --------------------- -->
		<!-- ------ 상품 상태 ------ -->
		<div class="p-b-5 fs-13">
			<button class="p-r-5 cl3" :class="{'activeFilter':status=='1'}" value="1" @click="searchByStatus($event)">판매 중</button>|
			<button class="p-lr-5 cl3" :class="{'activeFilter':status=='0'}" value="0" @click="searchByStatus($event)">판매 중단</button>
		</div>
		<!-- --------------------- -->
		<div class="row p-t-10">
			<div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
				<div class="fs-13">총 {{count | currency}} 개</div>
				<button class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 size-126" onclick="location.href='../admin/goods_add.do'">상품 등록</button>
			</div>
			<div class="col-lg-12 m-lr-auto m-b-50" id="goodsAdmin">
				<div class="wrap-table js-pscroll">

					<table class="table-goods">
						<thead>
							<tr class="table_head font-center">
								<th class="column-1"></th>
								<th class="column-2">상품번호</th>
								<th class="column-3">카테고리</th>
								<th class="column-4">제품명</th>
								<th class="column-5">브랜드</th>
								<th class="column-6">가격</th>
								<th class="column-7">할인</th>
								<th class="column-8">판매량</th>
								<th class="column-9">상태</th>
								<th class="column-10">제품 등록일</th>
								<th class="column-11">상세</th>
								<th class="column-12"></th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(goods, index) in goodsList" class="table_row_admin fs-13 font-center p-t-20-admin-td p-b-20" v-if="empty==false">
								<td class="column-1"><div><img :src="goods.g_image" onerror="this.src='../images/image_ready.jpg'" class="size-109"></div></td>
								<td class="column-2">{{goods.g_id}}</td>
								<td class="column-3">{{goods.c_title}}</td>
								<td class="column-4"><a class="link" :href="'../goods/detail.do?gid=' + goods.g_id">{{goods.g_name}}</a></td>
								<td class="column-5">{{goods.g_brand}}</td>
								<td class="column-6">{{goods.g_price | currency}}</td>
								<td class="column-7">{{goods.g_sale }}%</td>
								<td class="column-8">{{goods.g_sold }}</td>
								<td class="column-9" v-if="goods.g_status==0">판매중지</td>
								<td class="column-9" v-if="goods.g_status==1">판매중</td>
								<td class="column-10">{{goods.g_regdate }}</td>
								<td class="column-11">
									<div class="icon-header-item cl2 hov-cl1 trans-04"><i class="fa fa-search" @click="goods_detail(goods.g_detail)" aria-hidden="true"></i></div>
								</td>
								<td class="column-12">
									<a :href="'../admin/goods_update.do?g_id='+goods.g_id" value="{{goods.g_id}}"><button class="cl0 btn-sm btn-pro-color2 bor1 hov-btn1 trans-04">수정</button></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
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
            status: 1,
            empty: false
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
                axios.get("http://13.125.104.199/project2/admin/adlist_vue.do", {
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
                    
                    if(res.data[0].g_name == null) {
                        this.empty = true;
                    } else {
                        this.empty = false;
                    }
                    
                    this.pages = [];
                    for (i = this.startPage; i <= this.endPage; i++) {
                        this.pages.push(i);
                    }
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