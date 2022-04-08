<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container bg0">
		<h3 class="text-left" style="padding-bottom: 20px">1:1 문의</h3>
		<div class="row">

			<table class="table">
				<tr>
				    <th width=10% class="text-center">상태</th>
					<th width=10% class="text-center">유형</th>
					<th width=60% class="text-center">제목</th>
					<th width=20% class="text-center">작성일</th>
				</tr>
				<c:set var="count" value="${count }" />
				<c:forEach var="vo" items="${list }">
					<tr>
					    <td width=10% class="text-center">${count }</td>
						<td width=10% class="text-center">${vo.a_type }</td>
						<td width=60%>
					<c:if test="${vo.a_group_tab==1 }">
                        &nbsp;&nbsp;
                        <img src="../images/demo/re_icon.png">
					</c:if> 
					    <a href="../support/ask_detail.do?no=${vo.a_id }">${vo.a_title }</a></td>
						<td width=20% class="text-center">${vo.a_regdate }</td>
					</tr>
					<c:set var="count" value="${count-1 }" />
				</c:forEach>
			</table>
		</div>
		
		<div class="text-right" style="padding-top: 10px;">
		<c:choose>
		  <c:when test="${sessionScope.id == null}" >
		    <a href="../user/login.do" class="btn btn-sm" onclick="return confirm('먼저 로그인을 진행해주세요')"
			   style="background-color: #dbd0be">새글</a>
		  </c:when>
		  <c:otherwise>
		    <a href="ask_insert.do" class="btn btn-sm" style="background-color: #dbd0be">새글</a>
		  </c:otherwise>
		</c:choose>
		</div>
		<nav class="pagination">
			<ul>
				<c:if test="${startPage>1 }">
					<li><a href="../support/ask.do?page=${startPage-1 }">&laquo;
							Previous</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i==curpage }">
						<c:set var="style" value="class=current" />
					</c:if>
					<c:if test="${i!=curpage }">
						<c:set var="style" value="" />
					</c:if>
					<li ${style }><a href="../support/ask.do?page=${i }">${i }</a></li>
				</c:forEach>

				<c:if test="${endPage<totalpage }">
					<li><a href="../support/ask.do?page=${endPage+1 }">
							<i class="fa fa-caret-right" aria-hidden="true"></i></a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</body>
</html> 
