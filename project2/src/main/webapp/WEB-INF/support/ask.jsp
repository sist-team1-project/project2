<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
	<div class="container bg0">
		<h3 class="text-left p-b-20">1:1 문의</h3>
		<div class="row">

			<table class="table">
			  <tr>
				<th class="text-center wd-15">유형</th>
				<th class="text-center wd-50">제목</th>
				<th class="text-center">작성일</th>
				<th class="text-center">답변여부</th>
	    	  </tr>
	    	  

				<!--  -----------------   관리자   -----------------  -->
				<c:if test="${sessionScope.grade=='0' }">
				<c:forEach var="avo" items="${alist }">
				
				  <!-- 문의 -->
				  <c:if test="${avo.a_group_step==0 }"> 
					<tr>
					  <td class="text-center">${avo.a_type }</td>
					  <td><a href="../support/ask_detail.do?no=${avo.a_id }">${avo.a_title }</a></td>
					  <td class="text-center">${avo.a_regdate }</td>
		    		  <td class="p-t-10 text-center">
		    		  <c:if test="${avo.a_group_tab==1 }">답변완료</c:if> 
		    		  <c:if test="${avo.a_group_tab==0 }">미답변</c:if></td>
					</tr>
				  </c:if>
				  
				  <!-- 답변 -->
				  <c:if test="${avo.a_group_step==1 }">
					<tr>
					  <td class="text-center">${avo.a_type }</td>
					  <td>&nbsp;&nbsp;ㄴ <a href="../support/ask_detail.do?no=${avo.a_id }">${avo.a_title }</a></td>
					  <td class="text-center">${avo.a_regdate }</td>
					  <td class="p-t-10 text-center"></td>
					</tr>
				  </c:if>
				</c:forEach>
			    </c:if>
			
				<!--  ---------------    일반 사용자    ---------------  -->
				<c:if test="${sessionScope.grade==1 }">
				  <c:forEach var="vo" items="${list }">
				
				  <!-- 문의 -->
					<c:if test="${vo.a_group_step==0 }">
					<c:set var="count" value="${vo.a_id }" />
					  <tr>
						<td class="text-center">${vo.a_type }</td>
						<td><a href="../support/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
						<td class="text-center">${vo.a_regdate }</td>
						<td class="p-t-10 text-center">
						<c:if test="${vo.a_group_tab==1 }">답변완료</c:if> 
						<c:if test="${vo.a_group_tab==0 }">미답변</c:if></td>
					  </tr>
					</c:if>
				  
				  <!-- 답변 -->
				  <c:if test="${count+1 == vo.a_id  }">
				    <c:if test="${vo.a_group_step==1 }">
					  <tr>
					    <td class="text-center">${vo.a_type }</td>
						<td>&nbsp;&nbsp;ㄴ <a href="../support/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
						<td class="text-center">${vo.a_regdate }</td>
				  	    <td class="p-t-10 text-center"></td>
					  </tr>
				    </c:if>
				  </c:if>
			    </c:forEach>
			  </c:if>
				 
			</table>
		</div>
		
        <!--  ---------------   글쓰기 버튼   ---------------  -->
		<div class="text-right" style="padding-top: 10px;">
		  <c:choose>
			<c:when test="${sessionScope.id == null}">
			  <a href="../user/login.do" class="btn btn-sm" onclick="return confirm('먼저 로그인을 진행해주세요')"
				style="background-color: #dbd0be">글쓰기</a>
			</c:when>
			<c:otherwise>
			  <a href="ask_insert.do" class="btn btn-sm" style="background-color: #dbd0be">글쓰기</a>
			</c:otherwise>
		  </c:choose>
		</div>
	</div>
	
	<!--  ---------------   페이지   ---------------  -->
	<c:if test="${sessionScope.grade=='0' }">
		<div class="text-center">
		<ul class="pagination">
		    <c:if test="${astartPage>1 }">
		  		<li class="paging page-item" data-page="${astartPage-1 }"></c:if>
				<button class="page-link"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
			<c:forEach var="i" begin="${astartPage }" end="${aendPage }">
				<c:if test="${i==curPage }">
					<li class="current">${i }</li>
				</c:if>
				<c:if test="${i!=curPage }">
					<li class="paging page-item" data-page="${i }"><button class="page-link">${i }</button></li>
				</c:if>
			</c:forEach>
			<c:if test="${aendPage<atotalpage }">
				<li class="paging page-item" data-page="${aendPage+1 }"></c:if>	
				<button class="page-link"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
		</ul>
	</div>
	</c:if>
	
	<c:if test="${sessionScope.grade=='1' }">
		<div class="text-center">
		<ul class="pagination">
		    <c:if test="${startPage>1 }">
		  		<li class="paging page-item" data-page="${startPage-1 }"></c:if>
				<button class="page-link"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></li>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${i==curPage }">
					<li class="current">${i }</li>
				</c:if>
				<c:if test="${i!=curPage }">
					<li class="paging page-item" data-page="${i }"><button class="page-link">${i }</button></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage<totalpage }">
				<li class="paging page-item" data-page="${endPage+1 }"></c:if>	
				<button class="page-link"><i class="fa fa-chevron-right" aria-hidden="true"></i></button></li>
		</ul>
	</div>
	</c:if>

	<script>
		$(function() {
			$('.paging').css("cursor", "pointer");
			$('.paging').click(function() {
				let page = $(this).attr('data-page');

				location.href = '../support/ask.do?page=' + page;

			})
		})
	</script>
</body>
</html>
