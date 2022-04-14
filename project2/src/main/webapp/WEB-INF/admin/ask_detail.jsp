<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin/ask.css">
</head>
<body>
  <div id="ask" class="container">
    <div class="row bor10 p-all-30">
      <div class="col-sm-12 p-tb-10 cl3"><h5>${vo.a_title }</h5></div>
      <div class="col-sm-12 p-tb-10 bor12 cl3 fs-13"><b>유형</b>&nbsp;&nbsp;${vo.a_type }&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<b>작성일</b>&nbsp;&nbsp;${vo.a_regdate }</div>
      <div id="ask-content" class="col-sm-12 p-lr-15 p-tb-20 cl3 fs-13"><pre>${vo.a_content }</pre></div>
    </div>
    <div class="row">
      <div class="col-sm-12 dis-flex flex-r p-t-20">
        <c:if test="${vo.a_group_step==0 }">
          <a href="../admin/ask_reply.do?aid=${vo.a_id }" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 size-126">답변</a>
          <a href="../admin/ask_delete.do?aid=${vo.a_id }" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">삭제</a>
          <a href="../admin/ask.do" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">목록</a>
        </c:if>
        <c:if test="${vo.a_group_step==1 }">
          <a href="../admin/ask_delete.do?aid=${vo.a_id }" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">삭제</a>
          <a href="../admin/ask.do" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126">목록</a>
        </c:if>
      </div>
    </div>
  </div>
</body>
</html>