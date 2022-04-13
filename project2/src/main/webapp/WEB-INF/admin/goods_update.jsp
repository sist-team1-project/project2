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
  <div class="container bg0 p-t-70 p-b-10" id="GoodsUpdate">
    <div class="row">
      <div class="col-lg-12 m-lr-auto">
        <div class="p-b-20">
          <h3>상품 수정</h3>
        </div>
      </div>
      <div class="col-lg-12-add flex-m">
        <div class="col-sm-12-add col-md-12 m-lr-auto m-b-50">
          <div class="bor10 p-lr-40 p-t-30 p-b-40 p-lr-0-sm">
            <form @submit="submitForm" method="post" action="../admin/goods_update_ok.do">
              <input type=hidden name="g_id" v-model="gid">
              <div class="flex-w flex-t bor12 p-b-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 카테고리 </span>
                </div>
                <div class="size-209">
                  <select ref="select1" v-model="cid1" @change="selectIndex" class="bor10 cl3 p-tb-3 p-lr-5">
                    <option v-for="cate in categories1" :value="cate.cid">{{cate.title}}</option>
                  </select> &nbsp;&nbsp; 
                  <select ref="good" name="c_id" v-model="cid2" class="bor10 cl3 p-tb-3 p-lr-5">
                    <option v-for="cate2 in categories2[cindex]" :value="cate2.cid">{{cate2.title}}</option>
                  </select>
                </div>
              </div>
        
              <div class="flex-w flex-t bor12 p-tb-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 상품명 </span>
                </div>
                <div class="size-209">
                  <input ref="gname" type=text name="g_name" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gname">
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-tb-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 브랜드 </span>
                </div>
                <div class="size-209">
                  <input ref="gbrand" type=text name="g_brand" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gbrand">
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-tb-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 가격 (₩) </span>
                </div>
                <div class="size-209">
                  <input ref="gprice" type=number min="0" name="g_price" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gprice">
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-tb-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 할인율 (%) </span>
                </div>
                <div class="size-209">
                  <input ref="gsale" type=number min="0" name="g_sale" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gsale">
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-tb-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 판매 상태 </span>
                </div>
                <div class="size-209">
                  <select id="gstatus" name="g_status" class="bor10 cl3 p-tb-3 p-lr-5" v-model="gstatus">
                    <option value=-1>판매상태</option>
                    <option value=1>판매중</option>
                    <option value=0>판매중단</option>
                  </select>
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-t-20 p-b-20">
                <div class="size-208">
                  <span class="stext-110 cl2"> 대표이미지 첨부 </span>
                </div>
                <div class="size-209">
                  <div>
                    직접 경로 작성 ( 여러 이미지일시 구분자 ; )
                    <input ref="gimage" type=text min="0" name="g_image" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gimage">
                  </div>
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-t-20 p-b-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 상세정보 </span>
                </div>
                <div class="size-209">
                  <div>
                    직접 경로 작성 ( 여러 이미지일시 구분자 ; )
                    <input ref="gdetail" type=text min="0" name="g_detail" class="bor10 cl3 p-tb-3 p-lr-5 w-full" v-model="gdetail">
                  </div>
                </div>
              </div>

              <div class="flex-w flex-t bor12 p-t-20 p-b-20">
                <div class="size-208 w-full-ssm">
                  <span class="stext-110 cl2"> 이벤트 여부 </span>
                </div>
                <div class="row size-209">
                  <span v-for="e in events" class="dis-inline-block"><input type="checkbox" name="eid" class="bor10 cl3 dis-inline-block" :value="e.eid" v-model="eid"> &nbsp;{{e.etitle}} &nbsp;&nbsp;</span>
                </div>
              </div>

              <div class="row">
                <div class="p-t-35 col-md-6">
                  <input type=submit class="btn flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer btn-pro-color2" value="수정">
                </div>
                <div class="p-t-35 col-md-6">
                  <input type=button class="btn flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer btn-pro-color2" value="취소" onclick="javascript:history.back()">
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
		el: '#GoodsUpdate',
	    data: {
	        gid: ${gid},
	        cid1: '',
	        cid2: '',
	        gname: '',
	        gbrand: '',
	        gprice: '',
	        gsale: '',
	        gstatus: '',
	        gimage: '',
	        gdetail: '',
	        eid: [],
	        categories1: [],
	        categories2: [],
	        cindex: 0,
	        events: [],
	        detaildata: []
	    },
	    mounted: function() {
	        // 카테고리 대분류
	        axios.get("http://localhost:8080/web/main/category_1_vue.do", {}).then(result => {
                this.categories1 = result.data;
                this.cid1 = result.data[0].cid;
            })
            // 카테고리 소분류
	        axios.get("http://localhost:8080/web/main/category_2_vue.do", {}).then(result => {
                this.categories2 = result.data;
                this.cid2 = result.data[0][0].cid;
            })
            // 이벤트 목록
            axios.get("http://localhost:8080/web/admin/event_list.do", {}).then(result => {
                this.events = result.data;
            })
	        axios.get("http://localhost:8080/web/admin/goodsdetaildata.do", {
                params: {
                    g_id: this.gid
                }
	        }).then(result => {
                this.detaildata = result.data;
                this.gname = result.data.g_name;
                this.cid1 = result.data.cid1;
                // 카테고리 대분류 목록에서 소분류 배열의 인덱스를 찾음
                for(i = 0; i < this.categories1.length; i++) {
                    if(this.cid1.startsWith(this.categories1[i].cid)) {
                        this.cindex = i;
                    }
                }
                this.cid2 = result.data.c_id;
                this.gbrand = result.data.g_brand;
                this.gprice = result.data.g_price;
                this.gsale = result.data.g_sale;
                this.gstatus = result.data.g_status;
                this.gimage = result.data.g_image;
                this.gdetail = result.data.g_detail;
                for (var i = 0; i < result.data.eid.length; i++) {
					this.eid.push(result.data.eid[i]);
                }
            })
	    },
	    methods: {
	        submitForm: function(e) {
	            if (this.gname && this.gbrand && this.gprice && this.gsale && this.gimage && this.gdetail && this.gstatus != -1) {
	                return true;
	            } if (this.gname == '') {
	                this.$refs.gname.focus();
	            } else if (this.gbrand == '') {
	                this.$refs.gbrand.focus();
	            } else if (this.gprice == '') {
	                this.$refs.gprice.focus();
	            } else if (this.gsale == '') {
	                this.$refs.gsale.focus();
	            } else if (this.gimage == '') {
                    this.$refs.gimage.focus();
                } else if (this.gdetail == '') {
                    this.$refs.gdetail.focus();
                } else if (this.gstatus == -1) {
	                alert("상태를 확인해주세요");
	            }
	            e.preventDefault();
	        },
	        selectIndex: function(event) {
	            this.cindex = event.target.selectedIndex;
	            this.cid2 = this.categories2[this.cindex][0].cid;
	        }
	    }
	})
  </script>
</body>
</html>