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
     <div class="row">
       <form method=post action="../support/notice_insert_ok.do">
       <table class="table">
        <tr>
          <th width=20% class="text-right">제목</th>
          <td width=80%>
           <input type=text name=title size=55 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">내용</th>
          <td width=80%>
            <textarea rows="10" cols="58" name=content></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="글쓰기" class="btn btn-sm btn-success">
            <input type=button value="취소" class="btn btn-sm btn-info"
             onclick="javasecript:history.back()">
          </td>
        </tr>
       </table>
      </form>
     </div>
   </div>

</body>
</html>










