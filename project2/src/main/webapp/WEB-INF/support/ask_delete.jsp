<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
  <div class="container bg0">
    <h3 class="text-center p-b-20">삭제하기</h3>
      <form method=post action="../support/ask_delete_ok.do">
          <input type=hidden name=no value="${no }">
        <div class="text-center">
          <input type=submit value="삭제" class="btn btn-sm bg-1"> 
          <input type=button value="취소" class="btn btn-sm bg-2" onclick="javascript:history.back()">
        </div>
      </form>
  </div>
</body>
</html> 