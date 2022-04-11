<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <div class="container bg0">
    <h3 class="text-left" style="padding-bottom: 20px">삭제하기</h3>
    <div class="row">
      <form method=post action="../support/ask_delete_ok.do">
          <input type=hidden name=no value="${no }">
        <div class="text-right">
          <input type=submit value="삭제" class="btn btn-sm" style="background-color: #dbd0be"> 
          <input type=button value="취소" class="btn btn-sm" style="background-color: #eeeee6" onclick="javascript:history.back()">
        </div>
      </form>
    </div>
  </div>
</body>
</html> 