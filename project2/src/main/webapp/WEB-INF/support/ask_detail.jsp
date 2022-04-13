<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support/ask.css">
</head>
<body>
  <div class="container">
    <div class="row bor10 p-all-30">
      <div class="col-sm-12 p-b-10 text-center"><h3>1:1 문의</h3></div>
      <div class="col-sm-12 p-tb-10 bor12 fs-14"><b>유형</b>&nbsp;&nbsp;${vo.a_type }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<b>작성일</b>&nbsp;&nbsp;${vo.a_regdate }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<b>제목</b>&nbsp;&nbsp;${vo.a_title }</div>
      <div class="col-sm-12 p-all-20 fs-14"><pre>${vo.a_content }</pre></div>
    </div>
    <div class="row">
      <div class="col-sm-12">
        <c:if test="${sessionScope.grade=='0'}">
          <c:if test="${vo.a_group_step==0 }">
            <a href="../support/ask_reply.do?no=${vo.a_id }" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 trans-04 dis-inline-block">답변</a>
            <a href="../support/ask_delete.do?no=${vo.a_id }" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 trans-04 dis-inline-block">삭제</a>
            <a href="../admin/ask_admin.do" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 trans-04 dis-inline-block">목록</a>
          </c:if>
          <c:if test="${vo.a_group_step==1 }">
            <a href="../support/ask_delete.do?no=${vo.a_id }" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 p-tb-10 trans-04 dis-inline-block">삭제</a>
            <a href="../admin/ask_admin.do" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 p-tb-10 trans-04 dis-inline-block">목록</a>
          </c:if>
        </c:if>
        <c:if test="${sessionScope.grade=='1'}">
          <c:if test="${vo.a_group_step==0 }">
            <a href="../support/ask_delete.do?no=${vo.a_id }" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 p-tb-10 trans-04 dis-inline-block">삭제</a>
            <a href="../support/ask.do" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 trans-04 dis-inline-block">목록</a>
          </c:if>    
          <c:if test="${vo.a_group_step==1 }">
            <a href="../support/ask.do" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 trans-04 dis-inline-block">목록</a>
          </c:if>
        </c:if>
      </div>
    </div>
  </div>
</body>
</html>