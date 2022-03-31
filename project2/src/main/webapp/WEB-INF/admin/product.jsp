<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <input type="text" size=20 class="bor4 p-tb-4 dis-inline-block" v-model="ss" :value="ss">
        &nbsp;&nbsp;
        <button class="flex-c-m stext-101 cl0 btn-sm btn-pro-color2 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail fs-10" v-on:click="gfind()">검색</button>
      </div>
    </div>
    <div class="row p-t-10">
      <div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
        <div class="fs-13">
          총
          <fmt:formatNumber value="${count }" pattern=",000" />
          개
        </div>
        <input type="button" class="btn btn-sm btn-pro-color2" value="상품 등록" v-on:click="goods_add">
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

              <tr v-for class="table_row fs-13 font-center">
                <td></td>
                <td>{{goodsList}}</td>
                <!-- <td>{{goods.c_id}}</td>
                <td>{{goods.g_name}}</td>
                <td>{{goods.g_brand}}</td>
                <td></td>
                <td>{{goods.g_sale }}</td>
                <td>{{goods.g_stock }}</td>
                <td>{{goods.g_sold }}</td>
                <td>{{goods.g_status }}</td>
                <td>{{goods.g_regdate }}</td> -->
                <td></td>
                <td></td>
              </tr>

            </tbody>

          </table>
        </div>
      </div>
    </div>
    <div>

      <ul class="pagination">
        <c:if test="${startPage > 1 }">
          <li class="page-item"><a class="page-link" href="adlist.do?page=${startPage-1 }">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <c:if test="${curpage==i }">
            <c:set var="style" value="active" />
          </c:if>
          <c:if test="${curpage != i }">
            <c:set var="style" value="" />
          </c:if>
          <li class="page-item ${style }"><a class="page-link" href="adlist.do?page=${i }">${i }</a></li>
        </c:forEach>
        <c:if test="${endPage < totalpage }">
          <li class="page-item"><a class="page-link" href="adlist.do?page=${endPage+1 }">&gt;</a></li>
        </c:if>
      </ul>

    </div>

    <!-- 사이드 Detail -->

    <div class="wrap-header-admin js-panel-admin">
      <div class="s-full js-hide-admin"></div>
      <div class="header-admin flex-col-l p-l-65 p-r-25">
        <div class="header-admin-title flex-w flex-sb-m p-b-8">
          <span class="mtext-103 cl2"> Detail </span>
          <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-admin">
            <i class="zmdi zmdi-close"></i>
          </div>
        </div>
        <div class="header-admin-content flex-w js-pscroll">
          <ul class="header-admin-wrapitem w-full">
            <li class="header-admin-item flex-w flex-t m-b-12">
              <div class="header-admin-item-img">
                <img src="${gdetail }" alt="IMG">
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>

  </div>


  <!-- <script type="text/javascript">
			/*==================================================================
			[ admin ]*/
			$('.js-show-admin').on('click', function() {
				$('.js-panel-admin').addClass('show-header-admin');
			});

			$('.js-hide-admin').on('click', function() {
				$('.js-panel-admin').removeClass('show-header-admin');
			});
		</script> -->
  <script>
			new Vue({
				el : '#adminGoods', // 제어하는 영역 
				data : {
					ss : ' 텐트',
					goodsList : []
				},
				mounted : function() {
					axios.get("http://localhost:8080/web/admin/adlist_vue.do", {
						params : {
							page : "1"
						}
					}).then(function(res) {
						console.log(res);
						this.goodsList = res.data;
						console.log(this.goodsList);
						console.log(this.goodsList[0].g_id);

						this.g_detail = res.data[0].g_detail;
					})
				},
				methods : {

					gfind : function() {

					},
					goods_add : function() {
						console.log("이건???애드");
					},
					goods_update : function() {

					},
					goods_detail : function(detailId) {
						console.log("오긴오냐");
						console.log(detailId);
					}
				}
			})
		</script>
</body>
</html>