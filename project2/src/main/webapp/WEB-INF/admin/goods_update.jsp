<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
</head>
<body>
	<!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->

	<div class="container bg0 p-t-70 p-b-10" id="GoodsAdd">
		<div class="row">
			<div class="col-lg-12 m-lr-auto">
				<div class="p-b-20">
					<h3>상품 수정</h3>
				</div>
			</div>
			<div class="col-lg-12-add flex-m">
				<div class="col-sm-12-add col-md-12 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-0-sm">

						<form name="adminAdd" method="post" action="goods_add_ok.do">

							<div class="flex-w flex-t bor12 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 카테고리 </span>
								</div>
								<div class="size-209">
									<select v-model="cid1" id="select1" v-model="selectedCate">
										<option v-for="cate in categories1" :value="cate.cid">{{cate.title}}</option>
									</select>
									&nbsp;&nbsp;
									<select id="good" v-model="cid2">
										<option v-for="cate2 in categories2" v-if="cate2.cid.indexOf(cid1) > -1" :value="cate2.cid">{{cate2.title}}</option>
									</select>
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상품명 </span>
								</div>
								<div class="size-209">
									<input id="gname" type=text size=65 class="input-sm bor15" v-model="gname" value={{g_name}}>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 브랜드 </span>
								</div>
								<div class="size-209">
									<input id="gbrand" type=text size=65 class="input-sm bor15" v-model="gbrand">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 가격 </span>
								</div>
								<div class="size-209">
									<input id="gprice" type=text size=65 class="input-sm bor15" v-model="gprice">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 할인율 </span>
								</div>
								<div class="size-209">
									<input id="gsale" type=text size=65 class="input-sm bor15" v-model="gsale">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 재고수량 </span>
								</div>
								<div class="size-209">
									<input id="gstock" type=text size=65 class="input-sm bor15" v-model="gstock">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 판매 상태 </span>
								</div>
								<div class="size-209">
									<select id="gstatus" v-model="gstatus">
										<option value="">판매상태</option>
										<option value="1">판매중</option>
										<option value="0">판매중단</option>
									</select>
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208">
									<span class="stext-110 cl2"> 대표이미지 첨부 </span>
								</div>
								<div class="size-209">
									<input id="gimage" type=text size=65 class="input-sm bor15" v-model="gimage">
									<!-- <span class="mtext-110 cl2"> $89.65 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 상세정보 </span>
								</div>
								<div class="size-209">
									<input id="gdetail" type=text size=65 class="input-sm bor15" v-model="gdetail">
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="flex-w flex-t bor12 p-t-20 p-b-20">
								<div class="size-208 w-full-ssm">
									<span class="stext-110 cl2"> 이벤트 여부 </span>
								</div>
								<div class="row size-209">
									<input type="checkbox" class="input-sm bor15" v-model="eid" value="1">
									&nbsp; 인기상품 &nbsp; &nbsp;
									<input type="checkbox" class="input-sm bor15" v-model="eid" value="2">
									&nbsp; 추천상품 &nbsp; &nbsp;
									<input type="checkbox" class="input-sm bor15" v-model="eid" value="3">
									&nbsp; 할인상품 &nbsp; &nbsp;
									<!-- <span class="mtext-110 cl2"> $10 </span> -->
								</div>
							</div>

							<div class="row">
								<div class="p-t-35 col-md-6">
									<input type=button class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" v-on:click="submit()" value="수정">
								</div>
								<div class="p-t-35 col-md-6">
									<input type=button class="btn flex-c-m stext-101 cl1 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" value="취소" onclick="javascript:history.back()">
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	new Vue({
	    el: '#GoodsAdd',
	    data: {
	        cid1: '',
	        cid2: '',
	        gname: '',
	        gbrand: '',
	        gprice: '',
	        gsale: '',
	        gdetail: '',
	        gstock: '',
	        gstatus: '',
	        gimage: '',
	        eid: [],
	        categories1: [],
	        categories2: [],

	    },
	    mounted: function() {
	        this.cate1();
	        this.cate2();
	    },
	    methods: {
	        cate1: function() {
	            axios.get("http://localhost:8080/web/main/category_1_vue.do", {}).then(result => {
	                this.categories1 = result.data;
	                this.cid1 = result.data[0].cid
	            })
	        },
	        cate2: function() {
	            axios.get("http://localhost:8080/web/main/category_2_vue.do", {}).then(result => {
	                this.categories2 = result.data;
	                this.cid2 = result.data[0].cid
	            })
	        },
	        submit: function() {
	            if (this.gname == "") {
	                $('#gname').focus();
	                return;
	            } else if (this.gbrand == "") {
	                $('#gbrand').focus();
	                return;
	            } else if (this.gprice == "") {
	                $('#gprice').focus();
	                return;
	            } else if (this.gsale == "") {
	                $('#gsale').focus();
	                return;
	            } else if (this.gstock == "") {
	                $('#gstock').focus();
	                return;
	            } else if (this.gimage == "") {
	                $('#giamge').focus();
	                return;
	            } else if (!$('#gstatus>option:selected').val()) {
	                alert("상태 확인 필요");
	                return;
	            }

	            console.log("======= vue ========")
	            console.log("cid1 : " + this.cid1);
	            console.log("cid2 : " + this.cid2);
	            console.log("name : " + this.gname)
	            console.log("brand : " + this.gbrand);
	            console.log("price : " + this.gprice);
	            console.log("gsale : " + this.gsale);
	            console.log("gdetail : " + this.gdetail);
	            console.log("gstock: " + this.gstock);
	            console.log("gstatus : " + this.gstatus);
	            console.log("gimage : " + this.gimage);
	            console.log("eid : " + this.eid);

	            let map = {
	                c_id: this.cid2,
	                g_name: this.gname,
	                g_brand: this.gbrand,
	                g_price: this.gprice,
	                g_sale: this.gsale,
	                g_detail: this.gdetail,
	                g_stock: this.gstock,
	                g_status: this.gstatus,
	                g_image: this.gimage,
	                eid: this.eid.join(",")
	            };
	            /* axios.post("http://localhost:8080/web/admin/goods_add_ok.do", map).then(res => {
	                location.href = '../admin/adlist.do';
	            }) */
	        }
	    }
	})
	
	</script>

</body>
</html>