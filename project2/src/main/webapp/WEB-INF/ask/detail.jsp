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
         <th class="text-center" width=20%>번호</th>
         <td class="text-center" width=30%>${vo.a_id }</td>
         <th class="text-center" width=20%>작성일</th>
         <td class="text-center" width=30%>${vo.a_regdate }</td>
        </tr>
        <tr>
         <th class="text-center" width=20%>이름</th>
         <td class="text-center" width=30%>${vo.u_name }</td>
         <th class="text-center" width=20%>조회수</th>
         <td class="text-center" width=30%>${vo.n_visits }</td>
        </tr>
        <tr>
         <th class="text-center" width=20%>제목</th>
         <td colspan="3">${vo.a.title }</td>
        </tr>
        <tr>
          <td colspan="4" valign="top" class="text-left" height="200">
           <pre style="border:none;background-color:white;white-space: pre-wrap;">${vo.a.content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <c:if test="${count!=1 }">
              <a href="../ask/reply.do?no=${vo.a_id }" class="btn btn-xs">답변</a>
            </c:if>
            <a href="../ask/update.do?no=${vo.a_id }" class="btn btn-xs">수정</a>
            <a href="../ask/delete.do?no=${vo.a_id }" class="btn btn-xs">삭제</a>
            <a href="list.do" class="btn btn-xs">목록</a>
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>