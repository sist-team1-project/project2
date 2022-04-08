<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container bg0">
		<h3 class="text-left" style="padding-bottom: 20px">글쓰기</h3>
		<div class="row">
			<form method=post action="../support/ask_insert_ok.do">
				<table class="table">
					<tr>
						<th width=20% class="text-right">문의유형</th>
						<td width=80%>
						<select class="form-select" name=a_type>
							<option selected>문의유형 선택</option>
							<option value="1">교환</option>
							<option value="2">환불</option>
							<option value="3">취소(출하 전 취소)</option>
							<option value="4">배송</option>
							<option value="4">A/S</option>
							<option value="4">주문/결제</option>
							<option value="4">회원 관련</option>
							<option value="4">기타 문의</option>
						</select>
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">작성자</th>
						<td width=80%><input name="u_id" value="${sessionScope.id }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th width=20% class="text-right">제목</th>
						<td width=80%><input type=text name=a_title size=55
							class="input-sm"></td>
					</tr>
					<tr>
						<th width=20% class="text-right">내용</th>
						<td width=80%><textarea rows="10" cols="58" name=a_content></textarea>
						</td>
					</tr>
				</table>
				<div class="text-right" colspan="2" class="text-center">
					<input type=submit value="글쓰기" class="btn btn-sm" style="background-color: #eeeee6">
					<input type=button value="취소" class="btn btn-sm" style="background-color: #dbd0be"
						onclick="javasecript:history.back()">
				</div>
			</form>
		</div>
	</div>
</body>
</html> 
