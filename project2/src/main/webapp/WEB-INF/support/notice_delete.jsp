<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div class="container">
    <div class="text-center p-tb-70">
      <h3 class="text-center p-tb-20">삭제하시겠습니까?</h3>
      <form method=post action="../support/notice_delete_ok.do">
        <input type=hidden name=nid value="${nid }">
        <div class="flex-c-m">
          <input type=submit value="삭제" class="flex-c-m cl1 bg3 bor2 hov-btn3 p-lr-15 size-126 fs-13 pointer"> 
          <input type=button value="취소" class="flex-c-m cl0 bg2 bor2 hov-btn3 p-lr-15 size-126 fs-13 pointer" onclick="history.back()">
        </div>
      </form>
    </div>
  </div>
</body>
</html> 