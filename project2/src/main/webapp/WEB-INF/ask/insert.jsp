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
		<h3 class="text-left" style="padding-bottom: 20px">글쓰기</h3>
		<div class="row">
      <form method=post action="../ask/insert_ok.do">
      <table class="table">
        <tr>
          <th width=20% class="text-right">이름</th>
          <td width=80%>
           <input type=text name=u_id size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">제목</th>
          <td width=80%>
           <input type=text name=a_title size=55 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">내용</th>
          <td width=80%>
            <textarea rows="10" cols="58" name=a_content></textarea>
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">비밀번호</th>
          <td width=80%>
            <input type=password name=pwd size=10 class="input-sm">
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="글쓰기" class="btn btn-sm">
            <input type=button value="취소" class="btn btn-sm"
             onclick="javasecript:history.back()"
            >
          </td>
        </tr>
      </table>
      </form>
    </div>
 </div>
</body>
</html>
