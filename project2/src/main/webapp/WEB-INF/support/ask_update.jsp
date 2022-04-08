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
		<h3 class="text-left" style="padding-bottom: 20px">수정하기</h3>
		<div class="row">
      <form method=post action="../support/ask_update_ok.do">
      <table class="table">
        <tr>
          <th width=15% class="text-right">이름</th>
          <td width=85%>
           <input type=text name=u_id size=15 class="input-sm"
             value="${vo.u_id }"
           >
           <input type=hidden name=no value="${vo.a_id }">
          </td>
        </tr>
        <tr>
          <th width=15% class="text-right">제목</th>
          <td width=85%>
           <input type=text name=a_title size=55 class="input-sm"
            value="${vo.a_title }"
           >
          </td>
        </tr>
        <tr>
          <th width=15% class="text-right">내용</th>
          <td width=85%>
            <textarea rows="10" cols="58" name=content>${vo.a_content }</textarea>
          </td>
        </tr>
        <tr>
          <th width=15% class="text-right">비밀번호</th>
          <td width=85%>
            <input type=password name=a_pwd size=10 class="input-sm">
          </td>
        </tr>
      </table>
          <div colspan="2" class="text-right">
            <input type=submit value="수정" class="btn btn-sm" style="background-color: #eeeee6">
            <input type=button value="취소" class="btn btn-sm" style="background-color: #dbd0be"
             onclick="javasecript:history.back()">
          </div>
      </form>
    </div>
 </div>
</body>
</html> 