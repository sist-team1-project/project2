<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container bg0 p-t-70 p-b-10" id="">
		<div class="row">
			<div class="col-lg-12 m-lr-auto">
				<div class="p-b-20">
					<h3>문의 관리</h3>
				</div>
			</div>
			<div class="col-lg-12 flex-m">검색? 안하면 뺄 곳</div>
		</div>
		<div class="row p-t-10" id="askAdminResult">
			<div class="col-lg-12 m-lr-auto p-tb-10 dis-flex flex-sb flex-m">
				<div class="fs-13">총 ${count }개</div>
			</div>

			<div class="col-lg-12 m-lr-auto m-b-50" id="askAdmin">
				<div class="wrap-table js-pscroll">

					<table class="table-checkout">
						<thead>
							<tr class="table_head">
								<th width=11% class="text-center">번호</th>
								<th width=11% class="text-center">유형</th>
								<th width=35% class="text-center">제목</th>
								<th width=11% class="text-center">이름</th>
								<th width=20% class="text-center">작성일</th>
								<th width=11% class="text-center">상태</th>
							</tr>
						</thead>

						<tbody>
							<c:set var="count" value="${count }" />
							<c:forEach var="vo" items="${list }">
								<tr class="table_row fs-13 text-center p-t-20-admin-td">
									<td>${count }</td>
									<td>${vo.a_type }</td>
									<td>
										<a href="../support/ask_detail.do?no=${vo.a_id }" >${vo.a_title }</a>
									</td>
									<td>${vo.u_id }</td>
									<td>${vo.a_regdate }</td>
									<td>
										<c:if test="${vo.a_group_tab==1 }">답변완료</c:if>
										<c:if test="${vo.a_group_tab==0 }">미답변</c:if>
									</td>
								</tr>
								<c:set var="count" value="${count-1 }" />
							</c:forEach>
						</tbody>

					</table>

				</div>
			</div>
		</div>
	</div>

	<div class="text-center">
		<div class="pagination">
			<ul>
				<c:if test="${startPage>1 }">
					<li class="paging" data-page="${startPage-1 }"><i class="fa fa-chevron-left" aria-hidden="true"></i></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i==curPage }">
						<li class="current">${i }</li>
					</c:if>
					<c:if test="${i!=curPage }">
						<li class="paging" data-page="${i }">${i }</li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage<totalPage }">
					<li class="paging" data-page="${endPage+1 }"><i class="fa fa-caret-right" aria-hidden="true"></i></li>
				</c:if>
			</ul>
		</div>
	</div>



	<script>
		$(function() {
			$('.paging').css("cursor", "pointer");
			$('.paging').click(function() {
				let page = $(this).attr('data-page');
				$.ajax({
					type : 'get',
					url : '../admin/ask_admin_result.do',
					data : {
						"page" : page
					},
					success : function(result) {
						$('#askAdmin').html(result);
					}
				});
			})
/* 
			$('.detail_result').click(function() {
				let a_id = $(this).attr('data-page');
				$.ajax({
					type : 'get',
					url : '../admin/ask_admin_result.do',
					data : {
						"a_id" : a_id
					},
					success : function(result) {
						$('#askAdminResult').html(result);
					}
				})
			}) */

		})
	</script>

</body>
</html>