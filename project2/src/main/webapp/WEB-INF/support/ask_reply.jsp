<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/support.css">
</head>
<body>
  <div class="container bg0">
    <h3 class="text-center p-b-20">답변하기</h3>
    <div class="row">
      <form method=post action="../support/ask_reply_ok.do">
      	
        <table class="table">
          <tr>
            <th class="text-right">유형</th>
            <td><input type=text name=a_type size=15 value="답변"
            class="input-sm"><input type="hidden" name=pno value="${no }"></td>
          </tr>
          <tr>
            <th class="text-right">이름</th>
            <td><input type=text name=u_id size=15 value="${sessionScope.id }"
            class="input-sm"></td>
          </tr>
          <tr>
            <th class="text-right">제목</th>
            <td><input type=text name=a_title size=55
              class="input-sm"></td>
          </tr>
          <tr>
            <th class="text-right">내용</th>
            <td><textarea rows="15" cols=110 name=a_content></textarea></td>
          </tr>
          <tr>
        	<td colspan="2" class="text-right">
        	  <input type=submit value="답변" class="btn btn-sm bg-1"> 
         	  <input type=button value="취소" class="btn btn-sm bg-2" onclick="javasecript:history.back()">
       		</td>
          </tr>
        </table>
        
      </form>
    </div>
  </div>
</body>
</html>
