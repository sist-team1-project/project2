<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td {
	width: 150px;
	margin: 0px	auto;
}

img {
	width: 100px;
	height: 70px;
}
</style>
</head>
<body>
	<!-- 테이블이 필요하실땐 cart나 checkout쪽에서 사용한 테이블 사용하시면 편할거에요 -->
	<div class="container bg0 p-t-150 p-b-30">
		<div class="row">
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
							<tr class="table_row">
								<td><div>
										<img src="${glist.g_image }">
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
	</div>
</body>
</html>