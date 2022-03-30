<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	width: 150px;
	margin: 0px auto;
}
</style>
</head>
<body>
  <!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->
  <div class="container bg0 p-t-70 p-b-30">
    <div class="row">
      <div class="p-b-20">
        <h3>상품 목록</h3>
      </div>
    </div>
    <div class="row">
      <input type="text" size=20 class="bor4" v-model="ss" :value="ss">
      &nbsp;&nbsp;
      <input type="button" class="btn btn-sm btn-warning" value="검색" v-on:click="gfind()">
    </div>
    <div class="row p-t-30">
      <div class="fs-11 size-301 m-l-10">
        총
        <fmt:formatNumber value="${count }" pattern=",000" />
        개
      </div>
      <div class="col-lg-12 m-lr-auto m-b-50">
        <div class="wrap-table js-pscroll">

          <table class="table-checkout">
            <tr class="table_head">
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
            </tr>
            <c:forEach var="glist" items="${glist }" varStatus="status">
              <tr class="table_row fs-11">
                <td><div>
                    <img src="${glist.g_image }" class="size-109">
                  </div></td>
                <td>${glist.g_id }</td>
                <td>${glist.c_id }</td>
                <td>${glist.g_name }</td>
                <td>${glist.g_brand }</td>
                <td>${glist.g_price }</td>
                <td>${glist.g_sale }</td>
                <td>${glist.g_stock }</td>
                <td>${glist.g_sold }</td>
                <td>${glist.g_status }</td>
                <td>${glist.g_regdate }</td>
                <td><a type="button" href="${glist.g_detail }">상세보기</a></td>
              </tr>
            </c:forEach>
          </table>

        </div>
      </div>
    </div>
    <div>

      <!-- <ul class="pagination">
      <li class="page-item"><a class="page-link" href="#">Previous</a></li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item active"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">Next</a></li>
    </ul> -->




      <ul class="pagination">
        <c:if test="${startPage > 1 }">
          <li class="page-item"><a class="page-link" href="user.do?page=${startPage-1 }">&lt;</a></li>
        </c:if>
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <c:if test="${curpage==i }">
            <c:set var="style" value="active" />
          </c:if>
          <c:if test="${curpage != i }">
            <c:set var="style" value="" />
          </c:if>
          <li class="page-item ${style }"><a class="page-link" href="user.do?page=${i }">${i }</a></li>
        </c:forEach>
        <c:if test="${endPage < totalpage }">
          <li class="page-item"><a class="page-link" href="user.do?page=${endPage+1 }">&gt;</a></li>
        </c:if>
      </ul>
    </div>
  </div>
  <script>
			new Vue({
				el : '.container',
				data : {

				}

			})
		</script>
</body>
</html>