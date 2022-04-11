<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <th class="text-center" width=20%>유형</th>
          <td class="text-center" width=30%>${vo.a_type }</td>
          <th class="text-center" width=20%>작성일</th>
          <td class="text-center" width=30%>${vo.a_regdate }</td>
        </tr>
        <tr>
          <th class="text-center" width=20%>제목</th>
          <td colspan="3">${vo.a_title }</td>
        </tr>
        <tr>
          <td colspan="4" valign="top" class="text-left" height="200">
            <pre style="border: none; background-color: white; white-space: pre-wrap;">${vo.a_content }</pre>
          </td>
        </tr>
        <tr>
          <td colspan="4" class="text-right">
            <c:if test="${sessionScope.grade=='0'}">
            <c:if test="${vo.a_group_tab==0 }">
                <a href="../support/ask_reply.do?no=${vo.a_id }" class="btn btn-xs" style="background-color: #eeeee6">답변</a>
            </c:if>
                <a href="../support/ask_delete.do?no=${vo.a_id }" class="btn btn-xs" style="background-color: #eeeee6">삭제</a>
                <a href="../admin/ask_admin.do" class="btn btn-xs" style="background-color: #dbd0be">목록</a>
            </c:if>
            <c:if test="${sessionScope.grade=='1'}">
                <a href="../support/ask_delete.do?no=${vo.a_id }" class="btn btn-xs" style="background-color: #eeeee6">삭제</a>
                <a href="../support/ask.do" class="btn btn-xs" style="background-color: #dbd0be">목록</a>
            </c:if>    
          </td>
        </tr>
      </table>
    </div>
  </div>
</body>
</html>